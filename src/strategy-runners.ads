with Ada.Unchecked_Deallocation;

package Strategy.Runners is

   type Result_Kind is (Pass, Fail);

   generic
      with package Input_Strat is new Definite_Strategy (<>);

      with function Test (Input : Input_Strat.Value) return Boolean;

   package Definite_Runner is
      type Run_Result (Outcome : Result_Kind := Pass) is record
         case Outcome is
            when Fail =>
               Seed : Integer;
               Input : Input_Strat.Value;
            when Pass =>
               null;
         end case;
      end record;

      function Run_One (Seed : Integer) return Run_Result;
      function Run (Runs : Positive := 1_000) return Run_Result;
   end Definite_Runner;

   generic
      with package Input_Strat is new Indefinite_Strategy (<>);

      with function Test (Input : Input_Strat.Value) return Boolean;

   package Indefinite_Runner is

      type Input_Value_Access is access all Input_Strat.Value;

      procedure Free
      is new Ada.Unchecked_Deallocation (Input_Strat.Value,
                                         Input_Value_Access);

      type Run_Result (Outcome : Result_Kind := Pass) is record
         case Outcome is
            when Fail =>
               Seed : Integer;
               Input : Input_Value_Access;
            when Pass =>
               null;
         end case;
      end record;

      function Run_One (Seed : Integer) return Run_Result;
      function Run (Runs : Positive := 1_000) return Run_Result;
   end Indefinite_Runner;

end Strategy.Runners;
