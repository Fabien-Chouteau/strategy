with Ada.Numerics.Discrete_Random;

package body Strategy.Arrays is

   package body Definite_Array_Strat is
      package body Impl is

         ------------
         -- Create --
         ------------

         function Create (Ctx : in out Runner_Context'Class) return Node is
            Result : Node;
         begin
            for Elt of Result.States loop
               Elt := Input_Node_Holders.To_Holder (Input_Strat.Create (Ctx));
            end loop;
            return Result;
         end Create;

         -------------
         -- Current --
         -------------

         overriding function Current (This : in out Node) return Value is
            Ret : Value;
         begin
            for Index in Index_Type loop
               Ret (Index) :=
                 Input_Node_Holders.Reference (This.States (Index)).Current;
            end loop;

            return Ret;
         end Current;

         --------------
         -- Simplify --
         --------------

         overriding function Simplify (This : in out Node) return Boolean is
         begin
            loop
               if Input_Node_Holders.Reference (This.States (This.Shrinker))
                   .Simplify
               then
                  This.Last_Shrinker       := This.Shrinker;
                  This.Valid_Last_Shrinker := True;
                  return True;
               end if;

               exit when This.Shrinker = Index_Type'Last;
               This.Shrinker := Index_Type'Succ (This.Shrinker);
            end loop;

            return False;
         end Simplify;

         ----------------
         -- Complicate --
         ----------------

         overriding function Complicate (This : in out Node) return Boolean is
         begin
            if This.Valid_Last_Shrinker then
               This.Shrinker := This.Last_Shrinker;

               if Input_Node_Holders.Reference (This.States (This.Shrinker))
                   .Complicate
               then
                  return True;
               else
                  This.Valid_Last_Shrinker := False;
                  return False;
               end if;
            else
               return False;
            end if;
         end Complicate;

      end Impl;

   end Definite_Array_Strat;

   package body Indefinite_Array_Strat is
      package body Impl is

         ------------
         -- Create --
         ------------

         function Create (Ctx : in out Runner_Context'Class) return Node is

            package Len_RNG is new Ada.Numerics.Discrete_Random (Positive);
            package Idx_RNG is new Ada.Numerics.Discrete_Random (Index_Type);
            Len_Gen : Len_RNG.Generator;
            Idx_Gen : Idx_RNG.Generator;

            Index_Range : constant Integer :=
              Integer (Index_Type'Last) - Integer (Index_Type'First);

            Len : Positive;
            First : Index_Type;
         begin
            Len_RNG.Reset (Len_Gen, Ctx.Random_Initiator);
            Idx_RNG.Reset (Idx_Gen, Ctx.Random_Initiator);

            Len := Len_RNG.Random (Len_Gen, Min_Len,
                                   Positive'Min (Max_Len, Index_Range));

            First := Idx_RNG.Random
              (Idx_Gen,
               Index_Type'First,
               Index_Type (Integer (Index_Type'Last) - Len));

            return Result : Node (Len) do
               Result.First_Index := First;
               Result.Last_Index := Index_Type (Integer (First) + Len - 1);

               for Elt of Result.States loop
                  Elt := Input_Node_Holders.To_Holder
                    (Input_Strat.Create (Ctx));
               end loop;
            end return;
         end Create;

         -------------
         -- Current --
         -------------

         overriding
         function Current (This : in out Node) return Value is
            Ret : Value (This.First_Index .. This.Last_Index);
            Index : Natural := This.States'First;
         begin
            for Elt of Ret loop
               Elt :=
                 Input_Node_Holders.Reference (This.States (Index)).Current;
               Index := Index + 1;
            end loop;

            return Ret;
         end Current;

         --------------
         -- Simplify --
         --------------

         overriding
         function Simplify (This : in out Node) return Boolean is
         begin
            while This.Shrinker <= This.States'Last loop
               if Input_Node_Holders.Reference (This.States (This.Shrinker))
                   .Simplify
               then
                  This.Last_Shrinker       := This.Shrinker;
                  This.Valid_Last_Shrinker := True;
                  return True;
               else
                  This.Shrinker := Natural'Succ (This.Shrinker);
               end if;
            end loop;

            return False;
         end Simplify;

         ----------------
         -- Complicate --
         ----------------

         overriding function Complicate (This : in out Node) return Boolean is
         begin
            if This.Valid_Last_Shrinker then
               This.Shrinker := This.Last_Shrinker;

               if Input_Node_Holders.Reference (This.States (This.Shrinker))
                   .Complicate
               then
                  return True;
               else
                  This.Valid_Last_Shrinker := False;
                  return False;
               end if;
            else
               return False;
            end if;
         end Complicate;

      end Impl;

   end Indefinite_Array_Strat;

end Strategy.Arrays;
