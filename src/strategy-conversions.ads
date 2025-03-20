with Ada.Containers.Indefinite_Holders;

package Strategy.Conversions is

   generic
      with package Input_Strat is new Definite_Strategy (<>);
      with package Output_VT is new Definite_Value_Tree (<>);
      with function Convert
        (From : Input_Strat.Value) return Output_VT.Value;
   package Def_Convert is
      --  Convertion strategy from a definite value to another definite value

      package Impl is

         type Node (<>) is new Output_VT.Value_Node with private;

         function Create (Ctx : in out Runner_Context'Class) return Node;

      private

         package Input_Node_Holders is new Ada.Containers.Indefinite_Holders
           (Input_Strat.Node, Input_Strat."=");
         use Input_Node_Holders;

         subtype Parent is Output_VT.Value_Node;
         type Node is new Parent with record
            Input : aliased Holder;
         end record;

         overriding function Current
           (This : in out Node) return Output_VT.Value;

         overriding function Simplify (This : in out Node) return Boolean;

         overriding function Complicate (This : in out Node) return Boolean;

      end Impl;

      package Strat is new Definite_Strategy
        (Output_VT.Value, Output_VT, Impl.Node, Impl.Create);

   end Def_Convert;

   generic
      with package Input_Strat is new Indefinite_Strategy (<>);
      with package Output_VT is new Indefinite_Value_Tree (<>);
      with function Convert
        (From : Input_Strat.Value) return Output_VT.Value;
   package Indef_Convert is
      --  Convertion strategy from a indefinite value to another inddefinite
      --  value

      package Impl is

         type Node (<>) is new Output_VT.Value_Node with private;

         function Create (Ctx : in out Runner_Context'Class) return Node;

      private

         package Input_Node_Holders is new Ada.Containers.Indefinite_Holders
           (Input_Strat.Node, Input_Strat."=");
         use Input_Node_Holders;

         subtype Parent is Output_VT.Value_Node;
         type Node is new Parent with record
            Input : aliased Holder;
         end record;

         overriding function Current
           (This : in out Node) return Output_VT.Value;

         overriding function Simplify (This : in out Node) return Boolean;

         overriding function Complicate (This : in out Node) return Boolean;

      end Impl;

      package Strat is new Indefinite_Strategy
        (Output_VT.Value, Output_VT, Impl.Node, Impl.Create);

   end Indef_Convert;

   generic
      with package Input_Strat is new Definite_Strategy (<>);
      with package Output_VT is new Indefinite_Value_Tree (<>);
      with function Convert
        (From : Input_Strat.Value) return Output_VT.Value;
   package Def_Indef_Convert is
      --  Convertion strategy from a definite value to an indefinite value

      package Impl is

         type Node (<>) is new Output_VT.Value_Node with private;

         function Create (Ctx : in out Runner_Context'Class) return Node;

      private

         package Input_Node_Holders is new Ada.Containers.Indefinite_Holders
           (Input_Strat.Node, Input_Strat."=");
         use Input_Node_Holders;

         subtype Parent is Output_VT.Value_Node;
         type Node is new Parent with record
            Input : aliased Holder;
         end record;

         overriding function Current
           (This : in out Node) return Output_VT.Value;

         overriding function Simplify (This : in out Node) return Boolean;

         overriding function Complicate (This : in out Node) return Boolean;

      end Impl;

      package Strat is new Indefinite_Strategy
        (Output_VT.Value, Output_VT, Impl.Node, Impl.Create);

   end Def_Indef_Convert;

   generic
      with package Input_Strat is new Indefinite_Strategy (<>);
      with package Output_VT is new Definite_Value_Tree (<>);
      with function Convert
        (From : Input_Strat.Value) return Output_VT.Value;
   package Indef_Def_Convert is
      --  Convertion strategy from an indefinite value to an definite value

      package Impl is

         type Node (<>) is new Output_VT.Value_Node with private;

         function Create (Ctx : in out Runner_Context'Class) return Node;

      private

         package Input_Node_Holders is new Ada.Containers.Indefinite_Holders
           (Input_Strat.Node, Input_Strat."=");
         use Input_Node_Holders;

         subtype Parent is Output_VT.Value_Node;
         type Node is new Parent with record
            Input : aliased Holder;
         end record;

         overriding function Current
           (This : in out Node) return Output_VT.Value;

         overriding function Simplify (This : in out Node) return Boolean;

         overriding function Complicate (This : in out Node) return Boolean;

      end Impl;

      package Strat is new Definite_Strategy
        (Output_VT.Value, Output_VT, Impl.Node, Impl.Create);

   end Indef_Def_Convert;

end Strategy.Conversions;
