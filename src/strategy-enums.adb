with Ada.Numerics.Discrete_Random;

package body Strategy.Enums is

   package body Enum_Strat is
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
           (This.Current);

         --------------
         -- Simplify --
         --------------

         overriding function Simplify (This : in out Node) return Boolean is
         begin
            This.Max := This.Current;

            if This.Max <= This.Min then
               return False;
            else
               This.Current := Value'Pred (This.Current);
               return True;
            end if;
         end Simplify;

         ----------------
         -- Complicate --
         ----------------

         overriding function Complicate (This : in out Node) return Boolean is
         begin
            if This.Current /= Value'Last then
               This.Min := Value'Succ (This.Current);
            else
               This.Min := Value'Last;
            end if;

            if This.Max <= This.Min then
               This.Current := This.Max;
               return False;
            else
               This.Current := Value'Succ (This.Current);
               return True;
            end if;
         end Complicate;

      end Impl;
   end Enum_Strat;

end Strategy.Enums;
