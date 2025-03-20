with Ada.Assertions; use Ada.Assertions;

with Strategy; use Strategy;
with Strategy.Enums;

procedure Strategy_Tests.Enum_Strats is
   type My_Enum is (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S);

   package My_Enum_VT
   is new Definite_Value_Tree (My_Enum);
   package Enum_Strat_All
   is new Enums.Enum_Strat (My_Enum, My_Enum_VT);
   package Enum_Strat_B_K
   is new Enums.Enum_Strat (My_Enum, My_Enum_VT, B, K);
   package Enum_Strat_E_F
   is new Enums.Enum_Strat (My_Enum, My_Enum_VT, E, F);
   package Enum_Strat_B_R
   is new Enums.Enum_Strat (My_Enum, My_Enum_VT, B, R);
   package Enum_Strat_L_L
   is new Enums.Enum_Strat (My_Enum, My_Enum_VT, L, L);

   generic
      with package Strat is new Enums.Enum_Strat (<>);
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
                 "Simplify: " & N.Current'Img & " =/ " & Strat.First'Img);
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
                 "Complicate: " & N.Current'Img & " =/ " & Orig'Img);
      end;
   end Check_Strat;

   procedure Check_All is new Check_Strat (Enum_Strat_All);
   procedure Check_B_K is new Check_Strat (Enum_Strat_B_K);
   procedure Check_E_F is new Check_Strat (Enum_Strat_E_F);
   procedure Check_B_R is new Check_Strat (Enum_Strat_B_R);
   procedure Check_L_L is new Check_Strat (Enum_Strat_L_L);
begin
   Check_All;
   Check_B_K;
   Check_E_F;
   Check_B_R;
   Check_L_L;
end Strategy_Tests.Enum_Strats;
