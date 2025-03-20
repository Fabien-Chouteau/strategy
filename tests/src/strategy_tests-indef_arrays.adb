pragma Ada_2022;

with Ada.Text_IO; use Ada.Text_IO;

with Ada.Assertions; use Ada.Assertions;

with Strategy; use Strategy;
with Strategy.Modular;
with Strategy.Arrays;

procedure Strategy_Tests.Indef_Arrays is

   type My_Mod is mod 256;

   package My_Mod_VT
   is new Definite_Value_Tree (My_Mod);

   package My_Mod_Strat
   is new Modular.Modular_Strat (My_Mod, My_Mod_VT, 10, 20);

   type My_Index is range 1 .. 100;
   type My_Array is array (My_Index range <>) of My_Mod;

   package My_Array_VT
   is new Indefinite_Value_Tree (My_Array);

   package My_Array_Strat
   is new Strategy.Arrays.Indefinite_Array_Strat
     (My_Mod, My_Index, My_Array, My_Array_VT, My_Mod_Strat.Strat,
      Max_Len => 50);

   Ctx : Basic_Context;
begin

   for X in 1 .. 1000 loop
      declare
         VT : My_Array_Strat.Impl.Node := My_Array_Strat.Impl.Create (Ctx);
         Org : constant My_Array := VT.Current;
      begin
         Put_Line (VT.Current'First'Img & " .." & VT.Current'Last'Img);
         Assert (Org'Length <= 50, Org'Length'Img);
         Assert ((for all E of Org => E in 10 .. 20),
                 VT.Current'Img);
      end;
   end loop;
end Strategy_Tests.Indef_Arrays;
