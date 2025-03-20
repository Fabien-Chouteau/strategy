with Ada.Numerics.Discrete_Random;

package body Strategy.Standard is
   package body Boolean_Strat is
      package body Impl is

         ------------
         -- Create --
         ------------

         function Create (Ctx : in out Runner_Context'Class) return Node is
            package RNG is new Ada.Numerics.Discrete_Random (Boolean);
            Gen    : RNG.Generator;
            Result : Node;
         begin
            RNG.Reset (Gen, Ctx.Random_Initiator);
            Result.Current := RNG.Random (Gen);
            return Result;
         end Create;

         -------------
         -- Current --
         -------------

         overriding function Current (This : in out Node) return Boolean is
         begin
            return This.Current;
         end Current;

         --------------
         -- Simplify --
         --------------

         overriding function Simplify (This : in out Node) return Boolean is
         begin
            if This.State = Untouched and then This.Current then
               This.Current := False;
               This.State   := Simplified;
               return True;
            else
               This.State := Final;
               return False;
            end if;
         end Simplify;

         ----------------
         -- Complicate --
         ----------------

         overriding function Complicate (This : in out Node) return Boolean is
         begin
            case This.State is
               when Untouched | Final =>
                  This.State := Final;
                  return False;
               when Simplified =>
                  This.Current := True;
                  This.State   := Final;
                  return True;
            end case;
         end Complicate;

      end Impl;

   end Boolean_Strat;

end Strategy.Standard;
