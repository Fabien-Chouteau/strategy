pragma Ada_2022;

with Ada.Assertions; use Ada.Assertions;

with Strategy; use Strategy;
with Strategy.Enums;
with Strategy.One_Of;

procedure Strategy_Tests.Just_One_Of is

   pragma Warnings (Off, "not referenced");
   type My_Enum is (D, E, F, G, H, I, J, K, L, M, N, O, P);

   subtype A_Range is My_Enum range D .. F;
   subtype B_Range is My_Enum range G .. K;
   subtype C_Range is My_Enum range L .. P;

   type Strat_Id is (A, B, C);

   function Which_Strat (E : My_Enum) return Strat_Id
   is (case E is
          when A_Range => A,
          when B_Range => B,
          when C_Range => C);

   package My_Enum_VT
   is new Definite_Value_Tree (My_Enum);
   package A_Strat
   is new Enums.Enum_Strat (My_Enum, My_Enum_VT, A_Range'First, A_Range'Last);
   package B_Strat
   is new Enums.Enum_Strat (My_Enum, My_Enum_VT, B_Range'First, B_Range'Last);
   package C_Strat
   is new Enums.Enum_Strat (My_Enum, My_Enum_VT, C_Range'First, C_Range'Last);

   package O3
   is new One_Of.Just_One_Of_3 (My_Enum,
                                My_Enum_VT,
                                A_Strat.Strat,
                                B_Strat.Strat,
                                C_Strat.Strat);

   Ctx : Basic_Context;
begin

   for X in 1 .. 1000 loop
      declare
         VT : O3.Impl.Node := O3.Impl.Create (Ctx);

         Org : constant My_Enum := VT.Current;
         Org_Strat : constant Strat_Id := Which_Strat (Org);
      begin

         --  Check that only one strat is changing, so current should always be
         --  in the origin strat.
         while VT.Simplify loop
            Assert (Which_Strat (VT.Current) = Org_Strat);
         end loop;
         while VT.Complicate loop
            Assert (Which_Strat (VT.Current) = Org_Strat);
         end loop;
      end;
   end loop;

end Strategy_Tests.Just_One_Of;
