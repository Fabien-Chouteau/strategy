package Strategy.Enums is

   generic
      type Value is (<>);
      with package Value_Tree is new Definite_Value_Tree (Value => Value);
      First : Value := Value'First;
      Last : Value := Value'Last;
   package Enum_Strat is

      package Impl is

         type Node (<>) is new Value_Tree.Value_Node with private;

         function Create (Ctx : in out Runner_Context'Class) return Node;

      private

         type Node is new Value_Tree.Value_Node with record
            Current : Value := Value'First;
            Min     : Value := Value'First;
            Max     : Value := Value'Last;
         end record;

         overriding function Current (This : in out Node) return Value;

         overriding function Simplify (This : in out Node) return Boolean;

         overriding function Complicate (This : in out Node) return Boolean;

      end Impl;

      package Strat is new Definite_Strategy
        (Value, Value_Tree, Impl.Node, Impl.Create);
   end Enum_Strat;

end Strategy.Enums;
