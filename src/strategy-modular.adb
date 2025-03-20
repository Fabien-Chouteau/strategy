with Ada.Numerics.Discrete_Random;

package body Strategy.Modular is

   package body Modular_Strat is
      package body Impl is

         ------------
         -- Create --
         ------------

         function Create (Ctx : in out Runner_Context'Class) return Node is
            package RNG is new Ada.Numerics.Discrete_Random (Value);
            Gen    : RNG.Generator;
            Result : Node;
         begin
            RNG.Reset (Gen, Ctx.Random_Initiator);
            Result.Current := RNG.Random (Gen, First, Last);
            Result.Max     := Last;
            Result.Min     := First;
            return Result;
         end Create;

         -------------
         -- Current --
         -------------

         overriding function Current (This : in out Node) return Value is
         begin
            return This.Current;
         end Current;

         -----------------
         -- Reposistion --
         -----------------

         function Reposistion (This : in out Node) return Boolean is
            Interval : constant Value'Base := This.Max - This.Min;
            New_Mid  : constant Value      := This.Min + Interval / 2;
         begin
            if New_Mid = This.Current then
               return False;
            else
               This.Current := New_Mid;
               return True;
            end if;
         end Reposistion;

         --------------
         -- Simplify --
         --------------

         overriding function Simplify (This : in out Node) return Boolean is
         begin
            if This.Max <= This.Min then
               return False;
            end if;

            This.Max := This.Current;

            return Reposistion (This);
         end Simplify;

         ----------------
         -- Complicate --
         ----------------

         overriding function Complicate (This : in out Node) return Boolean is
         begin
            if This.Max <= This.Min then
               return False;
            end if;

            This.Min := This.Current + 1;

            return Reposistion (This);
         end Complicate;

      end Impl;
   end Modular_Strat;

end Strategy.Modular;
