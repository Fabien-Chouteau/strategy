pragma Ada_2022;

with Ada.Assertions; use Ada.Assertions;
with Ada.Containers.Generic_Constrained_Array_Sort;
with Ada.Text_IO; use Ada.Text_IO;

with Interfaces; use Interfaces;
with Strategy; use Strategy;
with Strategy.Arrays;
with Strategy.Standard; use Strategy.Standard;
with Strategy.Runners;

procedure Strategy_Tests.Runner_Definite_Sort is

   type Arr_Range is range 1 .. 10;
   type My_Array is array (Arr_Range) of Unsigned_8;

   package My_Array_VT
   is new Definite_Value_Tree (My_Array);

   package My_Array_Strat
   is new Strategy.Arrays.Definite_Array_Strat
     (Unsigned_8, Arr_Range, My_Array, My_Array_VT, Unsigned_8_Strat.Strat);

   procedure Sort
   is new Ada.Containers.Generic_Constrained_Array_Sort
     (Arr_Range, Unsigned_8, My_Array);

   function Check_Sorted (Arr : My_Array) return Boolean is
   begin
      for Idx in Arr'First .. Arr'Last - 1 loop
         if Arr (Idx) > Arr (Idx + 1) then
            return False;
         end if;
      end loop;
      return True;
   end Check_Sorted;

   function Test_Sort (Arr : My_Array) return Boolean is
      Copy : My_Array := Arr;
   begin
      if not (for some Elt of Arr => Elt >= 200) then
         Sort (Copy);
      end if;
      return Check_Sorted (Copy);
   end Test_Sort;

   package Sort_Runner
   is new Runners.Definite_Runner (My_Array_Strat.Strat, Test_Sort);

   Result : constant Sort_Runner.Run_Result := Sort_Runner.Run (Natural'Last);

begin
   case Result.Outcome is
      when Runners.Pass =>
         raise Program_Error with "Counld not find failing input...";
      when Runners.Fail =>
         Put_Line (Result.Input'Img);
         Assert (for some Elt of Result.Input => Elt = 200);
   end case;
end Strategy_Tests.Runner_Definite_Sort;
