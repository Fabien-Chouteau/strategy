with Ada.Numerics.Discrete_Random;

package body Strategy.Vectors is

   package body Definite_Vector_Strat is
      package body Impl is

         ------------
         -- Create --
         ------------

         function Create (Ctx : in out Runner_Context'Class) return Node is
            use Ada.Containers;

            package RNG is new Ada.Numerics.Discrete_Random (Count_Type);
            Gen    : RNG.Generator;
            Result : Node;
            Len    : Ada.Containers.Count_Type;
         begin

            RNG.Reset (Gen, Ctx.Random_Initiator);
            Len :=
              RNG.Random
                (Gen, Count_Type (Min_Length), Count_Type (Max_Length));

            Result.Inputs.Set_Length (Len);
            Result.Current.Set_Length (Len);

            for Idx in Result.Inputs.First_Index .. Result.Inputs.Last_Index
            loop
               Result.Inputs (Idx) := Element_Strat.Create (Ctx);
            end loop;
            return Result;
         end Create;

         -------------
         -- Current --
         -------------

         overriding function Current
           (This : in out Node) return Output_Vector.Vector
         is
            Result : Output_Vector.Vector;
         begin
            Result.Set_Length (This.Inputs.Length);

            for Idx in Result.First_Index .. Result.Last_Index loop
               Result (Idx) := This.Inputs (Idx).Current;
            end loop;

            return Result;
         end Current;

         --------------
         -- Simplify --
         --------------

         overriding function Simplify (This : in out Node) return Boolean is
         begin
            --  TODO...
            return False;
         end Simplify;

         ----------------
         -- Complicate --
         ----------------

         overriding function Complicate (This : in out Node) return Boolean is
         begin
            --  TODO...
            return False;
         end Complicate;

      end Impl;
   end Definite_Vector_Strat;

end Strategy.Vectors;
