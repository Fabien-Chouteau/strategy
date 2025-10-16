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

   procedure Bubble_Sort (List : in out My_Array) is
   begin
      for I in reverse List'First + 1 .. List'Last loop
         for J in List'First .. I - 1 loop
            if List (J) > List (J + 1) then

               if List (J) mod 2 = 0 then
                  declare
                     Tmp : constant Unsigned_8 := List (J);
                  begin
                     List (J) := List (J + 1);
                     List (J + 1) := Tmp;
                  end;
               end if;
            end if;
         end loop;
      end loop;
   end Bubble_Sort;

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
      Bubble_Sort (Copy);
      return Check_Sorted (Copy);
   end Test_Sort;

   package Sort_Runner
   is new Runners.Definite_Runner (My_Array_Strat.Strat, Test_Sort);

   Result : constant Sort_Runner.Run_Result := Sort_Runner.Run (Natural'Last);

   Count_Zeroes : Natural := 0;
begin
   case Result.Outcome is
      when Runners.Pass =>
         raise Program_Error with "Counld not find failing input...";
      when Runners.Fail =>
         Put_Line (Result.Input'Img);
         for Elt of Result.Input loop
            if Elt = 0 then
               Count_Zeroes := @ + 1;
            else
               Assert (Elt mod 2 = 1);
            end if;
         end loop;

         Assert (Count_Zeroes = 9);
   end case;
end Strategy_Tests.Runner_Definite_Sort;
