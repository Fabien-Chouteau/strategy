pragma Ada_2022;

with Ada.Text_IO; use Ada.Text_IO;

with Ada.Assertions; use Ada.Assertions;

with Strategy; use Strategy;
with Strategy.One_Of;
with Strategy.Modular;

procedure Strategy_Tests.One_Of_Strats is


   type My_Mod is mod 300;
   package My_Mod_VT
   is new Definite_Value_Tree (My_Mod);

   package A_Strat
   is new Modular.Modular_Strat (My_Mod, My_Mod_VT, 0, 1);
   package B_Strat
   is new Modular.Modular_Strat (My_Mod, My_Mod_VT, 100, 101);
   package C_Strat
   is new Modular.Modular_Strat (My_Mod, My_Mod_VT, 200, 201);

   package T3
   is new One_Of.Just_One_Of_3 (My_Mod,
                                My_Mod_VT,
                                A_Strat.Strat,
                                B_Strat.Strat,
                                C_Strat.Strat);

   Ctx : Basic_Context;

   type Strat_Id is (A, B, C);

   Counter : array (Strat_Id) of Natural := [others => 0];
   Check_Simplify_Once : Boolean := False;
begin

   for X in 1 .. 1000 loop
      declare
         VT : T3.Impl.Node := T3.Impl.Create (Ctx);
         Org : constant My_Mod := VT.Current;
      begin

         case Org is
            when 000 | 001 => Counter (A) := @ + 1;
            when 100 | 101 => Counter (B) := @ + 1;
            when 200 | 201 => Counter (C) := @ + 1;
            when others =>
               raise Program_Error with "invalid value: " & Org'Img;
         end case;

         Put_Line ("Org: " &  Org'Img);
         if Org mod 10 = 1 then
            Assert (T3.Impl.Simplify (VT));
            Put_Line ("Simplify: " &  T3.Impl.Current (VT)'Img);
            Assert (T3.Impl.Current (VT) mod 10 = 0);
            Assert (T3.Impl.Complicate (VT));
            Put_Line ("Complicate: " &  T3.Impl.Current (VT)'Img);
            Assert (T3.Impl.Current (VT) mod 10 = 1);
            Check_Simplify_Once := True;
         end if;
      end;
   end loop;

   for Id in Strat_Id loop
      Put_Line ("Strat " & Id'Img & " counter: " & Counter (Id)'Img);
      Assert (Counter (Id) >= 200);
   end loop;

   Assert (Check_Simplify_Once);
end Strategy_Tests.One_Of_Strats;
