with Ada.Containers.Indefinite_Holders;

package Strategy.Arrays is

   generic
      type Elt_Type is private;
      type Index_Type is (<>);
      type Value is array (Index_Type) of Elt_Type;
      with package Value_Tree is new Definite_Value_Tree (Value);
      with package Input_Strat is new Definite_Strategy
        (Value => Elt_Type, others => <>);
   package Definite_Array_Strat is

      package Impl is

         type Node (<>) is new Value_Tree.Value_Node with private;

         function Create (Ctx : in out Runner_Context'Class) return Node;

      private

         package Input_Node_Holders is new Ada.Containers.Indefinite_Holders
           (Input_Strat.Node, Input_Strat."=");

         type State_Array is
           array (Index_Type) of aliased Input_Node_Holders.Holder;

         type Node is new Value_Tree.Value_Node with record
            States : State_Array;

            Shrinker : Index_Type := Index_Type'First;

            Valid_Last_Shrinker : Boolean    := False;
            Last_Shrinker       : Index_Type := Index_Type'First;
         end record;

         overriding function Current (This : in out Node) return Value;

         overriding function Simplify (This : in out Node) return Boolean;

         overriding function Complicate (This : in out Node) return Boolean;

      end Impl;

      package Strat is new Definite_Strategy
        (Value, Value_Tree, Impl.Node, Impl.Create);

   end Definite_Array_Strat;

   generic
      type Elt_Type is private;
      type Index_Type is range <>;
      type Value is array (Index_Type range <>) of Elt_Type;
      with package Value_Tree is new Indefinite_Value_Tree (Value);
      with package Input_Strat is new Definite_Strategy
        (Value => Elt_Type, others => <>);

      Min_Len : Positive := 1;
      Max_Len : Positive := 100;
   package Indefinite_Array_Strat is

      package Impl is

         type Node (<>) is new Value_Tree.Value_Node with private;

         function Create (Ctx : in out Runner_Context'Class) return Node;

      private

         package Input_Node_Holders is new Ada.Containers.Indefinite_Holders
           (Input_Strat.Node, Input_Strat."=");

         type State_Array is
           array (Natural range <>) of aliased Input_Node_Holders.Holder;

         type Node (Len : Natural) is new Value_Tree.Value_Node with record
            States : State_Array (1 .. Len);

            First_Index, Last_Index : Index_Type;

            Shrinker : Natural := 1;

            Valid_Last_Shrinker : Boolean := False;
            Last_Shrinker       : Natural := 1;
         end record;

         overriding function Current (This : in out Node) return Value;

         overriding function Simplify (This : in out Node) return Boolean;

         overriding function Complicate (This : in out Node) return Boolean;

      end Impl;

      package Strat is new Indefinite_Strategy
        (Value, Value_Tree, Impl.Node, Impl.Create);

   end Indefinite_Array_Strat;

end Strategy.Arrays;
