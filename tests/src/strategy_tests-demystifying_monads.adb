pragma Ada_2022;

with Interfaces; use Interfaces;

with Strategy; use Strategy;
with Strategy.Tuples;
with Strategy.Enums;
with Strategy.Vectors;
with Strategy.Standard;
with Strategy.Conversions;
with Strategy.Arrays;
with Strategy.Modular;
with Strategy.Runners; use Strategy.Runners;

with Ada.Containers.Vectors;
with Ada.Containers.Generic_Array_Sort;
with Ada.Finalization;
with Ada.Unchecked_Deallocation;
with Ada.Assertions; use Ada.Assertions;

with Ada.Text_IO; use Ada.Text_IO;

procedure Strategy_Tests.Demystifying_Monads is

   type Ord_Behavior is (Regular, Flipped);

   package Ord_Behavior_Vectors
   is new Ada.Containers.Vectors (Natural, Ord_Behavior);

   type Ord_Behavior_Vector_Access is access all Ord_Behavior_Vectors.Vector;
   procedure Free is new Ada.Unchecked_Deallocation
     (Ord_Behavior_Vectors.Vector, Ord_Behavior_Vector_Access);

   type Bad_Type is new Ada.Finalization.Controlled with record
      Value : Unsigned_64;
      Behavior : Ord_Behavior_Vector_Access := null;
   end record;

   overriding
   procedure Adjust (This : in out Bad_Type);

   overriding
   procedure Finalize (This : in out Bad_Type);

   overriding
   procedure Finalize (This : in out Bad_Type) is
   begin
      if This.Behavior /= null then
         Free (This.Behavior);
      end if;
   end Finalize;

   overriding
   procedure Adjust (This : in out Bad_Type) is
   begin
      if This.Behavior /= null then
         This.Behavior := new Ord_Behavior_Vectors.Vector'(This.Behavior.all);
      end if;
   end Adjust;

   package Ord_Behavior_VT
   is new Strategy.Definite_Value_Tree (Ord_Behavior);

   package Ord_Behavior_Strat
   is new Strategy.Enums.Enum_Strat (Ord_Behavior, Ord_Behavior_VT);

   package Ord_Behavior_Vector_Strat
   is new Strategy.Vectors.Definite_Vector_Strat
     (Ord_Behavior,
      Ord_Behavior_Strat.Strat,
      Ord_Behavior_Vectors,
      Min_Length => 0,
      Max_Length => 127);

   function "<" (Self, Other : Bad_Type) return Boolean is
      Behavior : Ord_Behavior := Regular;
   begin
      if Self.Behavior /= null and then not Self.Behavior.Is_Empty then
         Behavior := Self.Behavior.Last_Element;
         Self.Behavior.Delete_Last;
      end if;

      --  Put_Line (Behavior'Img);
      return
        (case Behavior is
            when Regular => Self.Value < Other.Value,
            when Flipped => not (Self.Value < Other.Value));
   end "<";

   package Value_Strat
   is new Strategy.Modular.Modular_Strat
     (Unsigned_64,
      Strategy.Standard.Unsigned_64_Value_Tree,
      First => 0,
      Last  => 10_000);

   package Bad_Type_Tuple_Strat
   is new Strategy.Tuples.Tuple_2
     (Value_Strat.Strat,
      Ord_Behavior_Vector_Strat.Strat);

   package Bad_Type_VT is new Strategy.Definite_Value_Tree (Bad_Type);

   function Convert (Input : Bad_Type_Tuple_Strat.Value) return Bad_Type
   is (Ada.Finalization.Controlled with
         Value => Input.A,
       Behavior => new Ord_Behavior_Vectors.Vector'(Input.B));

   package Bad_Type_Convert_Strat
   is new Strategy.Conversions.Def_Convert (Bad_Type_Tuple_Strat.Strat,
                                            Bad_Type_VT,
                                            Convert);

   type Bad_Type_Array is array (Natural range <>) of Bad_Type;

   package Bad_Type_Array_VT
   is new Strategy.Indefinite_Value_Tree (Bad_Type_Array);

   package Bad_Type_Array_Strat
   is new Strategy.Arrays.Indefinite_Array_Strat (Bad_Type,
                                                  Natural,
                                                  Bad_Type_Array,
                                                  Bad_Type_Array_VT,
                                                  Bad_Type_Convert_Strat.Strat,
                                                  Min_Len => 1,
                                                  Max_Len => 100);

   procedure Sort_Bad_Type_Array
   is new Ada.Containers.Generic_Array_Sort (Natural,
                                             Bad_Type,
                                             Bad_Type_Array);

   function Check_Sort (Input : Bad_Type_Array) return Boolean is
      Sorted : Bad_Type_Array := Input;
   begin
      Sort_Bad_Type_Array (Sorted);

      --  We don't expect the result to be sorted because of the eratic
      --  comparison behavior. We just want to check if the sort algorithm
      --  crashes in this situation and if all values are preserved.

      for A of Input loop
         if not (for some B of Sorted => B.Value = A.Value) then
            Put_Line (Input'Img);
            Put_Line (Sorted'Img);
            return False;
         end if;
      end loop;
      return True;
   end Check_Sort;

   package Check_Sort_Runner
   is new Strategy.Runners.Indefinite_Runner
     (Bad_Type_Array_Strat.Strat, Check_Sort);

   Result : constant Check_Sort_Runner.Run_Result := Check_Sort_Runner.Run;
   Unused : Boolean;
begin

   if Result.Outcome = Strategy.Runners.Fail then
      Put_Line (Result'Img);
      Put_Line (Result.Input.all'Img);
      Unused := Check_Sort (Result.Input.all);
      raise Program_Error;
   end if;

   declare

      type Bad_Type_Pair is record
         A : Bad_Type;
         B : Bad_Type;
      end record;

      package Bad_Type_Pair_VT
      is new Definite_Value_Tree (Bad_Type_Pair);

      function Flat_Map (Input : Bad_Type) return Bad_Type_Pair is
         package New_Value_Strats
         is new Strategy.Modular.Modular_Strat
           (Unsigned_64,
            Strategy.Standard.Unsigned_64_Value_Tree,
            First => Input.Value + 1,
            Last  => 20_000);

         Ctx : Strategy_Tests.Basic_Context;
         Value_Node : New_Value_Strats.Impl.Node :=
           New_Value_Strats.Impl.Create (Ctx);

         Behavior_Node : Ord_Behavior_Vector_Strat.Impl.Node :=
           Ord_Behavior_Vector_Strat.Impl.Create (Ctx);
      begin
         return (A => Input,
                 B =>
                   (Ada.Finalization.Controlled with
                      Value => Value_Node.Current,
                    Behavior =>
                       new
                         Ord_Behavior_Vectors.Vector'(Behavior_Node.Current)));
      end Flat_Map;

      package Flat_Map_Strat
      is new Strategy.Conversions.Def_Convert (Bad_Type_Convert_Strat.Strat,
                                               Bad_Type_Pair_VT,
                                               Flat_Map);
      Ctx : Strategy_Tests.Basic_Context;
      N : Flat_Map_Strat.Impl.Node := Flat_Map_Strat.Impl.Create (Ctx);

      V : constant Bad_Type_Pair := N.Current;
   begin
      Assert (V.A.Value < V.B.Value);
   end;

end Strategy_Tests.Demystifying_Monads;
