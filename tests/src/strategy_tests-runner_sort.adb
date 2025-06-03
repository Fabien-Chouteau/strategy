pragma Ada_2022;

with Ada.Assertions; use Ada.Assertions;
with Ada.Containers.Generic_Array_Sort;
with Ada.Text_IO; use Ada.Text_IO;

with Interfaces; use Interfaces;
with Strategy; use Strategy;
with Strategy.Arrays;
with Strategy.Standard; use Strategy.Standard;
with Strategy.Runners;

procedure Strategy_Tests.Runner_Sort is

   type My_Array is array (Natural range <>) of Unsigned_8;

   package My_Array_VT
   is new Indefinite_Value_Tree (My_Array);

   package My_Array_Strat
   is new Strategy.Arrays.Indefinite_Array_Strat
     (Unsigned_8, Natural, My_Array, My_Array_VT, Unsigned_8_Strat.Strat,
      Max_Len => 50);

   procedure Sort
   is new Ada.Containers.Generic_Array_Sort (Natural, Unsigned_8, My_Array);

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
      if not (for some Elt of Arr => Elt >= 1) then
         Sort (Copy);
      end if;
      return Check_Sorted (Copy);
   end Test_Sort;

   package Sort_Runner
   is new Runners.Indefinite_Runner (My_Array_Strat.Strat, Test_Sort);

   Result : Sort_Runner.Run_Result := Sort_Runner.Run (Natural'Last);

   Count_Zeroes : Natural := 0;
begin
   case Result.Outcome is
      when Runners.Pass =>
         raise Program_Error with "Counld not find failing input...";
      when Runners.Fail =>
         Put_Line (Result.Input.all'Img);

         for Elt of Result.Input.all loop
            if Elt = 0 then
               Count_Zeroes := @ + 1;
            end if;
         end loop;

         Assert (Count_Zeroes = Result.Input.all'Length - 1);

         Sort_Runner.Free (Result.Input);
   end case;
end Strategy_Tests.Runner_Sort;
