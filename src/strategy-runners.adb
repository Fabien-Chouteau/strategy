pragma Ada_2022;

with Ada.Numerics.Discrete_Random;

package body Strategy.Runners is

   package Integer_RNG is new Ada.Numerics.Discrete_Random (Integer);

   type Context is limited new Runner_Context with record
      Gen : Integer_RNG.Generator;
   end record;

   overriding
   function Random_Initiator (This : in out Context) return Integer;

   ----------
   -- Init --
   ----------

   procedure Init (This : in out Context; Seed : Integer) is
   begin
      Integer_RNG.Reset (This.Gen, Seed);
   end Init;

   ----------
   -- Init --
   ----------

   procedure Init (This : in out Context) is
   begin
      Integer_RNG.Reset (This.Gen);
   end Init;

   ----------------------
   -- Random_Initiator --
   ----------------------

   overriding
   function Random_Initiator (This : in out Context) return Integer
   is
   begin
      return Integer_RNG.Random (This.Gen);
   end Random_Initiator;

   package body Definite_Runner is

      -------------
      -- Run_One --
      -------------

      function Run_One (Seed : Integer) return Run_Result
      is
         function Test_Wrapper (Input : Input_Strat.Value) return Result_Kind
         is
         begin
            if Test (Input) then
               return Pass;
            else
               return Fail;
            end if;
         exception
            when others =>
               return Fail;
         end Test_Wrapper;
         Ctx : Context;
      begin
         Init (Ctx, Seed);

         declare
            State : Input_Strat.Node := Input_Strat.Create (Ctx);
         begin
            if Test_Wrapper (State.Current) = Pass then
               return (Outcome => Pass);
            else
               loop
                  if Test_Wrapper (State.Current) = Fail then
                     exit when not State.Simplify;
                  else
                     exit when not State.Complicate;
                  end if;
               end loop;
               return (Outcome => Fail,
                       Seed    => Seed,
                       Input   => State.Current);
            end if;
         end;
      end Run_One;

      ---------
      -- Run --
      ---------

      function Run (Runs : Positive := 1_000)
                    return Run_Result
      is
         Ctx : Context;
      begin
         Init (Ctx);

         for X in 1 .. Runs loop

            --  Hack to return a limited type
            loop
               return Result : constant Run_Result :=
                 Run_One (Ctx.Random_Initiator)
               do
                  exit when Result.Outcome = Pass;
               end return;
            end loop;
         end loop;

         return (Outcome => Pass);
      end Run;

   end Definite_Runner;

   -----------------------
   -- Indefinite_Runner --
   -----------------------

   package body Indefinite_Runner is

      -------------
      -- Run_One --
      -------------

      function Run_One (Seed : Integer) return Run_Result
      is
         function Test_Wrapper (Input : Input_Strat.Value) return Result_Kind
         is
         begin
            if Test (Input) then
               return Pass;
            else
               return Fail;
            end if;
         exception
            when others =>
               return Fail;
         end Test_Wrapper;
         Ctx : Context;
      begin
         Init (Ctx, Seed);

         declare
            State : Input_Strat.Node := Input_Strat.Create (Ctx);
         begin
            if Test_Wrapper (State.Current) = Pass then
               return (Outcome => Pass);
            else
               loop
                  if Test_Wrapper (State.Current) = Fail then
                     exit when not State.Simplify;
                  else
                     exit when not State.Complicate;
                  end if;
               end loop;
               return (Outcome => Fail,
                       Seed    => Seed,
                       Input   => new Input_Strat.Value'(State.Current));
            end if;
         end;
      end Run_One;

      ---------
      -- Run --
      ---------

      function Run (Runs : Positive := 1_000)
                    return Run_Result
      is
         Ctx : Context;
      begin
         Init (Ctx);

         for X in 1 .. Runs loop

            declare
               Result : constant Run_Result := Run_One (Ctx.Random_Initiator);
            begin
               if Result.Outcome = Fail then
                  return Result;
               end if;
            end;
         end loop;

         return (Outcome => Pass);
      end Run;

   end Indefinite_Runner;

end Strategy.Runners;
