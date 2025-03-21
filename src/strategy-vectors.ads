with Ada.Containers.Vectors;
with Ada.Containers.Indefinite_Vectors;

package Strategy.Vectors is

   generic
      type Element_Type is private;
      with package Element_Strat is new Definite_Strategy
        (Value => Element_Type, others => <>);

      with package Output_Vector is new Ada.Containers.Vectors
        (Element_Type => Element_Type, others => <>);

      Min_Length : Natural := 0;
      Max_Length : Natural := 1_024;
   package Definite_Vector_Strat is

      package Value_Tree is new Definite_Value_Tree (Output_Vector.Vector);

      package Impl is

         type Node (<>) is new Value_Tree.Value_Node with private;

         function Create (Ctx : in out Runner_Context'Class) return Node;

      private

         package Element_Node_Vector
         is new Ada.Containers.Indefinite_Vectors
           (Output_Vector.Index_Type,
            Element_Strat.Node,
            Element_Strat."=");

         type Node is new Value_Tree.Value_Node with record
            Inputs : Element_Node_Vector.Vector;

            Shrinker : Output_Vector.Index_Type :=
              Output_Vector.Index_Type'First;

            Valid_Last_Shrinker : Boolean                  := False;
            Last_Shrinker       : Output_Vector.Index_Type :=
              Output_Vector.Index_Type'First;
         end record;

         overriding function Current
           (This : in out Node) return Output_Vector.Vector;

         overriding function Simplify (This : in out Node) return Boolean;

         overriding function Complicate (This : in out Node) return Boolean;

      end Impl;

      package Strat is new Definite_Strategy
        (Output_Vector.Vector, Value_Tree, Impl.Node, Impl.Create);

   end Definite_Vector_Strat;

end Strategy.Vectors;
