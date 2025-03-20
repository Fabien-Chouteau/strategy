with Interfaces; use Interfaces;

with Strategy.Modular;

package Strategy.Standard is

   package Unsigned_8_Value_Tree
   is new Definite_Value_Tree (Unsigned_8);

   package Unsigned_8_Strat
   is new Modular.Modular_Strat (Unsigned_8, Unsigned_8_Value_Tree);

   package Unsigned_16_Value_Tree
   is new Definite_Value_Tree (Unsigned_16);

   package Unsigned_16_Strat
   is new Modular.Modular_Strat (Unsigned_16, Unsigned_16_Value_Tree);

   package Unsigned_32_Value_Tree
   is new Definite_Value_Tree (Unsigned_32);

   package Unsigned_32_Strat
   is new Modular.Modular_Strat (Unsigned_32, Unsigned_32_Value_Tree);

   package Unsigned_64_Value_Tree
   is new Definite_Value_Tree (Unsigned_64);

   package Unsigned_64_Strat
   is new Modular.Modular_Strat (Unsigned_64, Unsigned_64_Value_Tree);

   package String_Value_Tree
   is new Indefinite_Value_Tree (String);

   package Boolean_Value_Tree
   is new Definite_Value_Tree (Boolean);

   package Boolean_Strat is

      package Impl is

         type Node (<>) is new Boolean_Value_Tree.Value_Node with private;

         function Create (Ctx : in out Runner_Context'Class) return Node;

      private

         type Shrink_State is (Untouched, Simplified, Final);

         subtype Parent is Boolean_Value_Tree.Value_Node;
         type Node is new Parent with record
            Current : Boolean      := True;
            State   : Shrink_State := Untouched;
         end record;

         overriding function Current (This : in out Node) return Boolean;

         overriding function Simplify (This : in out Node) return Boolean;

         overriding function Complicate (This : in out Node) return Boolean;

      end Impl;

      package Strat is new Definite_Strategy
        (Boolean, Boolean_Value_Tree, Impl.Node, Impl.Create);
   end Boolean_Strat;

end Strategy.Standard;
