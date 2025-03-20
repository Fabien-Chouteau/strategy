package body Strategy_Tests is

   ----------------------
   -- Random_Initiator --
   ----------------------

   overriding function Random_Initiator
     (This : in out Basic_Context) return Integer
   is
   begin
      if This.Do_Init then
         Integer_RNG.Reset (This.Gen);
         This.Do_Init := False;
      end if;
      return Integer_RNG.Random (This.Gen);
   end Random_Initiator;

end Strategy_Tests;
