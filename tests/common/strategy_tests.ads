with Strategy;
private with Ada.Numerics.Discrete_Random;

package Strategy_Tests is

   type Basic_Context is limited private;

private

   package Integer_RNG is new Ada.Numerics.Discrete_Random (Integer);

   type Basic_Context
   is limited new Strategy.Runner_Context with record
      Do_Init : Boolean := True;
      Gen     : Integer_RNG.Generator;
   end record;

   overriding function Random_Initiator
     (This : in out Basic_Context) return Integer;

end Strategy_Tests;
