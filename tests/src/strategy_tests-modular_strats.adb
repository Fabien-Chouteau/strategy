with Ada.Assertions; use Ada.Assertions;

with Strategy; use Strategy;
with Strategy.Modular;

procedure Strategy_Tests.Modular_Strats is
   type My_Mod is mod 256;

   package My_Mod_VT
   is new Definite_Value_Tree (My_Mod);
   package Mod_Strat_All
   is new Modular.Modular_Strat (My_Mod, My_Mod_VT);
   package Mod_Strat_10_20
   is new Modular.Modular_Strat (My_Mod, My_Mod_VT, 10, 20);
   package Mod_Strat_50_60
   is new Modular.Modular_Strat (My_Mod, My_Mod_VT, 50, 60);
   package Mod_Strat_100_200
   is new Modular.Modular_Strat (My_Mod, My_Mod_VT, 100, 200);
   package Mod_Strat_42_42
   is new Modular.Modular_Strat (My_Mod, My_Mod_VT, 42, 42);

   generic
      with package Strat is new Modular.Modular_Strat (<>);
   procedure Check_Strat;

   procedure Check_Strat is
      use type Strat.Value;

   begin
      declare
         Ctx : Basic_Context;
         N : Strat.Impl.Node := Strat.Impl.Create (Ctx);
      begin

         --  Check random value is within range
         Assert (N.Current in Strat.First .. Strat.Last);

         --  Check simplify towards lowest
         while N.Simplify loop
            null;
         end loop;
         Assert (N.Current = Strat.First,
                 "Simplify:" & N.Current'Img & " =/" & Strat.First'Img);
      end;

      declare
         Ctx : Basic_Context;
         N : Strat.Impl.Node := Strat.Impl.Create (Ctx);
         Orig : constant Strat.Value := N.Current;
         Unused : Boolean;
      begin

         --  Check random value is within range
         Assert (Orig in Strat.First .. Strat.Last);

         Unused := N.Simplify;

         --  Check complicate up to original value
         while N.Complicate loop
            null;
         end loop;
         Assert (N.Current = Orig,
                 "Complicate:" & N.Current'Img & " =/" & Orig'Img);
      end;
   end Check_Strat;

   procedure Check_All is new Check_Strat (Mod_Strat_All);
   procedure Check_10_20 is new Check_Strat (Mod_Strat_10_20);
   procedure Check_50_60 is new Check_Strat (Mod_Strat_50_60);
   procedure Check_100_200 is new Check_Strat (Mod_Strat_100_200);
   procedure Check_42_42 is new Check_Strat (Mod_Strat_42_42);
begin
   Check_All;
   Check_10_20;
   Check_50_60;
   Check_100_200;
   Check_42_42;
end Strategy_Tests.Modular_Strats;
