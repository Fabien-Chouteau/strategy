pragma Ada_2022;

with Ada.Assertions; use Ada.Assertions;

with Strategy; use Strategy;
with Strategy.Tuples;
with Strategy.Enums;
with Strategy.Modular;

procedure Strategy_Tests.Tuple_Strats is

   pragma Warnings (Off, "not referenced");
   type My_Enum is (D, E, F, G, H, I, J, K);

   subtype A_Range is My_Enum range D .. F;
   subtype B_Range is My_Enum range G .. K;

   type Strat_Id is (A, B, C);

   package My_Enum_VT
   is new Definite_Value_Tree (My_Enum);
   package A_Strat
   is new Enums.Enum_Strat (My_Enum, My_Enum_VT, A_Range'First, A_Range'Last);
   package B_Strat
   is new Enums.Enum_Strat (My_Enum, My_Enum_VT, B_Range'First, B_Range'Last);

   type My_Mod is mod 256;
   package My_Mod_VT
   is new Definite_Value_Tree (My_Mod);

   package C_Strat
   is new Modular.Modular_Strat (My_Mod, My_Mod_VT, 100, 200);

   package T3
   is new Tuples.Tuple_3 (A_Strat.Strat,
                          B_Strat.Strat,
                          C_Strat.Strat);

   Ctx : Basic_Context;
begin

   for X in 1 .. 1000 loop
      declare
         VT : T3.Impl.Node := T3.Impl.Create (Ctx);

         Org : constant T3.Value := VT.Current;
      begin

         Assert (Org.A in A_Range);
         Assert (Org.B in B_Range);
         Assert (Org.C in 100 .. 200);

         --  Check that only one value is simplified at once
         if VT.Simplify then
            declare
               Change_Counter : Natural := 0;
               Changed : Strat_Id;
               New_A : A_Range;
               New_B : B_Range;
               New_C : My_Mod;
            begin
               if VT.Current.A /= Org.A then
                  Change_Counter := @ + 1;
                  Changed := A;
                  New_A := VT.Current.A;
               end if;
               if VT.Current.B /= Org.B then
                  Change_Counter := @ + 1;
                  Changed := B;
                  New_B := VT.Current.B;
               end if;
               if VT.Current.C /= Org.C then
                  Change_Counter := @ + 1;
                  Changed := C;
                  New_C := VT.Current.C;
               end if;

               Assert (Change_Counter = 1, "More than one value simplified");

               if VT.Complicate then
                  case Changed is
                  when A => Assert (VT.Current.A = A_Range'Succ (New_A));
                  when B => Assert (VT.Current.B = B_Range'Succ (New_B));
                  when C =>
                     Assert (VT.Current.C in New_C .. Org.C,
                             My_Mod'Image (New_C) &
                               VT.Current.C'Img &
                               My_Mod'Image (Org.C));
                  end case;
               end if;
            end;
         end if;
      end;
   end loop;

   for X in 1 .. 1000 loop
      declare
         VT : T3.Impl.Node := T3.Impl.Create (Ctx);
      begin
         --  Check that we can simplify all values
         while VT.Simplify loop
            null;
         end loop;
         Assert (VT.Current.A = A_Range'First);
         Assert (VT.Current.B = B_Range'First);
         Assert (VT.Current.C = 100);
      end;
   end loop;

end Strategy_Tests.Tuple_Strats;
