pragma Ada_2022;

with Ada.Assertions; use Ada.Assertions;

with Interfaces; use Interfaces;

with Strategy; use Strategy;
with Strategy.Conversions;
with Strategy.Modular;
with Strategy.Standard; use Strategy.Standard;

procedure Strategy_Tests.Conversion is

   function Div_2 (V : Unsigned_8) return Unsigned_32
   is (Unsigned_32 (V / 2));

   package Conv
   is new Conversions.Def_Convert (Unsigned_8_Strat.Strat,
                                   Unsigned_32_Value_Tree,
                                                Div_2);

   package String_VT is new Indefinite_Value_Tree (String);

   package My_U8_Strat
   is new Modular.Modular_Strat (Unsigned_8, Unsigned_8_Value_Tree, 10, 30);

   package Img_Conv
   is new Conversions.Def_Indef_Convert (My_U8_Strat.Strat,
                                         String_VT,
                                         Unsigned_8'Image);

   Ctx : Basic_Context;
begin

   for X in 1 .. 1000 loop
      declare
         VT : Conv.Impl.Node := Conv.Impl.Create (Ctx);
      begin

         Assert (VT.Current in
                   Unsigned_32 (Unsigned_8'First) ..
                   Unsigned_32 (Unsigned_8'Last / 2));
      end;
   end loop;

   for X in 1 .. 1000 loop
      declare
         VT : Img_Conv.Impl.Node := Img_Conv.Impl.Create (Ctx);
      begin
         Assert (Unsigned_8'Value (VT.Current) in 10 .. 30);
      end;
   end loop;
end Strategy_Tests.Conversion;
