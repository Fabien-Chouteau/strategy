with Ada.Containers.Indefinite_Holders;
package Strategy.Tuples is
   generic
      with package A_Strat is new Definite_Strategy (<>);
      with package B_Strat is new Definite_Strategy (<>);
   package Tuple_2 is
      type Value is record
         A : A_Strat.Value;
         B : B_Strat.Value;
      end record;
      package Value_Tree is new Definite_Value_Tree (Value);
      package Impl is
         type Node (<>) is new Value_Tree.Value_Node with private;
         function Create (Ctx : in out Runner_Context'Class) return Node;
      private
         package A_Holders
         is new Ada.Containers.Indefinite_Holders (A_Strat.Node, A_Strat."=");
         package B_Holders
         is new Ada.Containers.Indefinite_Holders (B_Strat.Node, B_Strat."=");
         type Options is (None, A, B);
         subtype Valid_Options is Options range A .. Options'Last;
         subtype Parent is Value_Tree.Value_Node;
         type Node is new Parent with record
            A : aliased A_Holders.Holder;
            B : aliased B_Holders.Holder;
            Shrinker : Valid_Options := Valid_Options'First;
            Prev_Shrinker : Options := None;
         end record;
         overriding
         function Current (This : in out Node) return Value;
         overriding
         function Simplify (This : in out Node) return Boolean;
         overriding
         function Complicate (This : in out Node) return Boolean;
      end Impl;
      package Strat
      is new Definite_Strategy (Value, Value_Tree, Impl.Node, Impl.Create);
   end Tuple_2;
   generic
      with package A_Strat is new Definite_Strategy (<>);
      with package B_Strat is new Definite_Strategy (<>);
      with package C_Strat is new Definite_Strategy (<>);
   package Tuple_3 is
      type Value is record
         A : A_Strat.Value;
         B : B_Strat.Value;
         C : C_Strat.Value;
      end record;
      package Value_Tree is new Definite_Value_Tree (Value);
      package Impl is
         type Node (<>) is new Value_Tree.Value_Node with private;
         function Create (Ctx : in out Runner_Context'Class) return Node;
      private
         package A_Holders
         is new Ada.Containers.Indefinite_Holders (A_Strat.Node, A_Strat."=");
         package B_Holders
         is new Ada.Containers.Indefinite_Holders (B_Strat.Node, B_Strat."=");
         package C_Holders
         is new Ada.Containers.Indefinite_Holders (C_Strat.Node, C_Strat."=");
         type Options is (None, A, B, C);
         subtype Valid_Options is Options range A .. Options'Last;
         subtype Parent is Value_Tree.Value_Node;
         type Node is new Parent with record
            A : aliased A_Holders.Holder;
            B : aliased B_Holders.Holder;
            C : aliased C_Holders.Holder;
            Shrinker : Valid_Options := Valid_Options'First;
            Prev_Shrinker : Options := None;
         end record;
         overriding
         function Current (This : in out Node) return Value;
         overriding
         function Simplify (This : in out Node) return Boolean;
         overriding
         function Complicate (This : in out Node) return Boolean;
      end Impl;
      package Strat
      is new Definite_Strategy (Value, Value_Tree, Impl.Node, Impl.Create);
   end Tuple_3;
   generic
      with package A_Strat is new Definite_Strategy (<>);
      with package B_Strat is new Definite_Strategy (<>);
      with package C_Strat is new Definite_Strategy (<>);
      with package D_Strat is new Definite_Strategy (<>);
   package Tuple_4 is
      type Value is record
         A : A_Strat.Value;
         B : B_Strat.Value;
         C : C_Strat.Value;
         D : D_Strat.Value;
      end record;
      package Value_Tree is new Definite_Value_Tree (Value);
      package Impl is
         type Node (<>) is new Value_Tree.Value_Node with private;
         function Create (Ctx : in out Runner_Context'Class) return Node;
      private
         package A_Holders
         is new Ada.Containers.Indefinite_Holders (A_Strat.Node, A_Strat."=");
         package B_Holders
         is new Ada.Containers.Indefinite_Holders (B_Strat.Node, B_Strat."=");
         package C_Holders
         is new Ada.Containers.Indefinite_Holders (C_Strat.Node, C_Strat."=");
         package D_Holders
         is new Ada.Containers.Indefinite_Holders (D_Strat.Node, D_Strat."=");
         type Options is (None, A, B, C, D);
         subtype Valid_Options is Options range A .. Options'Last;
         subtype Parent is Value_Tree.Value_Node;
         type Node is new Parent with record
            A : aliased A_Holders.Holder;
            B : aliased B_Holders.Holder;
            C : aliased C_Holders.Holder;
            D : aliased D_Holders.Holder;
            Shrinker : Valid_Options := Valid_Options'First;
            Prev_Shrinker : Options := None;
         end record;
         overriding
         function Current (This : in out Node) return Value;
         overriding
         function Simplify (This : in out Node) return Boolean;
         overriding
         function Complicate (This : in out Node) return Boolean;
      end Impl;
      package Strat
      is new Definite_Strategy (Value, Value_Tree, Impl.Node, Impl.Create);
   end Tuple_4;
   generic
      with package A_Strat is new Definite_Strategy (<>);
      with package B_Strat is new Definite_Strategy (<>);
      with package C_Strat is new Definite_Strategy (<>);
      with package D_Strat is new Definite_Strategy (<>);
      with package E_Strat is new Definite_Strategy (<>);
   package Tuple_5 is
      type Value is record
         A : A_Strat.Value;
         B : B_Strat.Value;
         C : C_Strat.Value;
         D : D_Strat.Value;
         E : E_Strat.Value;
      end record;
      package Value_Tree is new Definite_Value_Tree (Value);
      package Impl is
         type Node (<>) is new Value_Tree.Value_Node with private;
         function Create (Ctx : in out Runner_Context'Class) return Node;
      private
         package A_Holders
         is new Ada.Containers.Indefinite_Holders (A_Strat.Node, A_Strat."=");
         package B_Holders
         is new Ada.Containers.Indefinite_Holders (B_Strat.Node, B_Strat."=");
         package C_Holders
         is new Ada.Containers.Indefinite_Holders (C_Strat.Node, C_Strat."=");
         package D_Holders
         is new Ada.Containers.Indefinite_Holders (D_Strat.Node, D_Strat."=");
         package E_Holders
         is new Ada.Containers.Indefinite_Holders (E_Strat.Node, E_Strat."=");
         type Options is (None, A, B, C, D, E);
         subtype Valid_Options is Options range A .. Options'Last;
         subtype Parent is Value_Tree.Value_Node;
         type Node is new Parent with record
            A : aliased A_Holders.Holder;
            B : aliased B_Holders.Holder;
            C : aliased C_Holders.Holder;
            D : aliased D_Holders.Holder;
            E : aliased E_Holders.Holder;
            Shrinker : Valid_Options := Valid_Options'First;
            Prev_Shrinker : Options := None;
         end record;
         overriding
         function Current (This : in out Node) return Value;
         overriding
         function Simplify (This : in out Node) return Boolean;
         overriding
         function Complicate (This : in out Node) return Boolean;
      end Impl;
      package Strat
      is new Definite_Strategy (Value, Value_Tree, Impl.Node, Impl.Create);
   end Tuple_5;
   generic
      with package A_Strat is new Definite_Strategy (<>);
      with package B_Strat is new Definite_Strategy (<>);
      with package C_Strat is new Definite_Strategy (<>);
      with package D_Strat is new Definite_Strategy (<>);
      with package E_Strat is new Definite_Strategy (<>);
      with package F_Strat is new Definite_Strategy (<>);
   package Tuple_6 is
      type Value is record
         A : A_Strat.Value;
         B : B_Strat.Value;
         C : C_Strat.Value;
         D : D_Strat.Value;
         E : E_Strat.Value;
         F : F_Strat.Value;
      end record;
      package Value_Tree is new Definite_Value_Tree (Value);
      package Impl is
         type Node (<>) is new Value_Tree.Value_Node with private;
         function Create (Ctx : in out Runner_Context'Class) return Node;
      private
         package A_Holders
         is new Ada.Containers.Indefinite_Holders (A_Strat.Node, A_Strat."=");
         package B_Holders
         is new Ada.Containers.Indefinite_Holders (B_Strat.Node, B_Strat."=");
         package C_Holders
         is new Ada.Containers.Indefinite_Holders (C_Strat.Node, C_Strat."=");
         package D_Holders
         is new Ada.Containers.Indefinite_Holders (D_Strat.Node, D_Strat."=");
         package E_Holders
         is new Ada.Containers.Indefinite_Holders (E_Strat.Node, E_Strat."=");
         package F_Holders
         is new Ada.Containers.Indefinite_Holders (F_Strat.Node, F_Strat."=");
         type Options is (None, A, B, C, D, E, F);
         subtype Valid_Options is Options range A .. Options'Last;
         subtype Parent is Value_Tree.Value_Node;
         type Node is new Parent with record
            A : aliased A_Holders.Holder;
            B : aliased B_Holders.Holder;
            C : aliased C_Holders.Holder;
            D : aliased D_Holders.Holder;
            E : aliased E_Holders.Holder;
            F : aliased F_Holders.Holder;
            Shrinker : Valid_Options := Valid_Options'First;
            Prev_Shrinker : Options := None;
         end record;
         overriding
         function Current (This : in out Node) return Value;
         overriding
         function Simplify (This : in out Node) return Boolean;
         overriding
         function Complicate (This : in out Node) return Boolean;
      end Impl;
      package Strat
      is new Definite_Strategy (Value, Value_Tree, Impl.Node, Impl.Create);
   end Tuple_6;
   generic
      with package A_Strat is new Definite_Strategy (<>);
      with package B_Strat is new Definite_Strategy (<>);
      with package C_Strat is new Definite_Strategy (<>);
      with package D_Strat is new Definite_Strategy (<>);
      with package E_Strat is new Definite_Strategy (<>);
      with package F_Strat is new Definite_Strategy (<>);
      with package G_Strat is new Definite_Strategy (<>);
   package Tuple_7 is
      type Value is record
         A : A_Strat.Value;
         B : B_Strat.Value;
         C : C_Strat.Value;
         D : D_Strat.Value;
         E : E_Strat.Value;
         F : F_Strat.Value;
         G : G_Strat.Value;
      end record;
      package Value_Tree is new Definite_Value_Tree (Value);
      package Impl is
         type Node (<>) is new Value_Tree.Value_Node with private;
         function Create (Ctx : in out Runner_Context'Class) return Node;
      private
         package A_Holders
         is new Ada.Containers.Indefinite_Holders (A_Strat.Node, A_Strat."=");
         package B_Holders
         is new Ada.Containers.Indefinite_Holders (B_Strat.Node, B_Strat."=");
         package C_Holders
         is new Ada.Containers.Indefinite_Holders (C_Strat.Node, C_Strat."=");
         package D_Holders
         is new Ada.Containers.Indefinite_Holders (D_Strat.Node, D_Strat."=");
         package E_Holders
         is new Ada.Containers.Indefinite_Holders (E_Strat.Node, E_Strat."=");
         package F_Holders
         is new Ada.Containers.Indefinite_Holders (F_Strat.Node, F_Strat."=");
         package G_Holders
         is new Ada.Containers.Indefinite_Holders (G_Strat.Node, G_Strat."=");
         type Options is (None, A, B, C, D, E, F, G);
         subtype Valid_Options is Options range A .. Options'Last;
         subtype Parent is Value_Tree.Value_Node;
         type Node is new Parent with record
            A : aliased A_Holders.Holder;
            B : aliased B_Holders.Holder;
            C : aliased C_Holders.Holder;
            D : aliased D_Holders.Holder;
            E : aliased E_Holders.Holder;
            F : aliased F_Holders.Holder;
            G : aliased G_Holders.Holder;
            Shrinker : Valid_Options := Valid_Options'First;
            Prev_Shrinker : Options := None;
         end record;
         overriding
         function Current (This : in out Node) return Value;
         overriding
         function Simplify (This : in out Node) return Boolean;
         overriding
         function Complicate (This : in out Node) return Boolean;
      end Impl;
      package Strat
      is new Definite_Strategy (Value, Value_Tree, Impl.Node, Impl.Create);
   end Tuple_7;
   generic
      with package A_Strat is new Definite_Strategy (<>);
      with package B_Strat is new Definite_Strategy (<>);
      with package C_Strat is new Definite_Strategy (<>);
      with package D_Strat is new Definite_Strategy (<>);
      with package E_Strat is new Definite_Strategy (<>);
      with package F_Strat is new Definite_Strategy (<>);
      with package G_Strat is new Definite_Strategy (<>);
      with package H_Strat is new Definite_Strategy (<>);
   package Tuple_8 is
      type Value is record
         A : A_Strat.Value;
         B : B_Strat.Value;
         C : C_Strat.Value;
         D : D_Strat.Value;
         E : E_Strat.Value;
         F : F_Strat.Value;
         G : G_Strat.Value;
         H : H_Strat.Value;
      end record;
      package Value_Tree is new Definite_Value_Tree (Value);
      package Impl is
         type Node (<>) is new Value_Tree.Value_Node with private;
         function Create (Ctx : in out Runner_Context'Class) return Node;
      private
         package A_Holders
         is new Ada.Containers.Indefinite_Holders (A_Strat.Node, A_Strat."=");
         package B_Holders
         is new Ada.Containers.Indefinite_Holders (B_Strat.Node, B_Strat."=");
         package C_Holders
         is new Ada.Containers.Indefinite_Holders (C_Strat.Node, C_Strat."=");
         package D_Holders
         is new Ada.Containers.Indefinite_Holders (D_Strat.Node, D_Strat."=");
         package E_Holders
         is new Ada.Containers.Indefinite_Holders (E_Strat.Node, E_Strat."=");
         package F_Holders
         is new Ada.Containers.Indefinite_Holders (F_Strat.Node, F_Strat."=");
         package G_Holders
         is new Ada.Containers.Indefinite_Holders (G_Strat.Node, G_Strat."=");
         package H_Holders
         is new Ada.Containers.Indefinite_Holders (H_Strat.Node, H_Strat."=");
         type Options is (None, A, B, C, D, E, F, G, H);
         subtype Valid_Options is Options range A .. Options'Last;
         subtype Parent is Value_Tree.Value_Node;
         type Node is new Parent with record
            A : aliased A_Holders.Holder;
            B : aliased B_Holders.Holder;
            C : aliased C_Holders.Holder;
            D : aliased D_Holders.Holder;
            E : aliased E_Holders.Holder;
            F : aliased F_Holders.Holder;
            G : aliased G_Holders.Holder;
            H : aliased H_Holders.Holder;
            Shrinker : Valid_Options := Valid_Options'First;
            Prev_Shrinker : Options := None;
         end record;
         overriding
         function Current (This : in out Node) return Value;
         overriding
         function Simplify (This : in out Node) return Boolean;
         overriding
         function Complicate (This : in out Node) return Boolean;
      end Impl;
      package Strat
      is new Definite_Strategy (Value, Value_Tree, Impl.Node, Impl.Create);
   end Tuple_8;
   generic
      with package A_Strat is new Definite_Strategy (<>);
      with package B_Strat is new Definite_Strategy (<>);
      with package C_Strat is new Definite_Strategy (<>);
      with package D_Strat is new Definite_Strategy (<>);
      with package E_Strat is new Definite_Strategy (<>);
      with package F_Strat is new Definite_Strategy (<>);
      with package G_Strat is new Definite_Strategy (<>);
      with package H_Strat is new Definite_Strategy (<>);
      with package I_Strat is new Definite_Strategy (<>);
   package Tuple_9 is
      type Value is record
         A : A_Strat.Value;
         B : B_Strat.Value;
         C : C_Strat.Value;
         D : D_Strat.Value;
         E : E_Strat.Value;
         F : F_Strat.Value;
         G : G_Strat.Value;
         H : H_Strat.Value;
         I : I_Strat.Value;
      end record;
      package Value_Tree is new Definite_Value_Tree (Value);
      package Impl is
         type Node (<>) is new Value_Tree.Value_Node with private;
         function Create (Ctx : in out Runner_Context'Class) return Node;
      private
         package A_Holders
         is new Ada.Containers.Indefinite_Holders (A_Strat.Node, A_Strat."=");
         package B_Holders
         is new Ada.Containers.Indefinite_Holders (B_Strat.Node, B_Strat."=");
         package C_Holders
         is new Ada.Containers.Indefinite_Holders (C_Strat.Node, C_Strat."=");
         package D_Holders
         is new Ada.Containers.Indefinite_Holders (D_Strat.Node, D_Strat."=");
         package E_Holders
         is new Ada.Containers.Indefinite_Holders (E_Strat.Node, E_Strat."=");
         package F_Holders
         is new Ada.Containers.Indefinite_Holders (F_Strat.Node, F_Strat."=");
         package G_Holders
         is new Ada.Containers.Indefinite_Holders (G_Strat.Node, G_Strat."=");
         package H_Holders
         is new Ada.Containers.Indefinite_Holders (H_Strat.Node, H_Strat."=");
         package I_Holders
         is new Ada.Containers.Indefinite_Holders (I_Strat.Node, I_Strat."=");
         type Options is (None, A, B, C, D, E, F, G, H, I);
         subtype Valid_Options is Options range A .. Options'Last;
         subtype Parent is Value_Tree.Value_Node;
         type Node is new Parent with record
            A : aliased A_Holders.Holder;
            B : aliased B_Holders.Holder;
            C : aliased C_Holders.Holder;
            D : aliased D_Holders.Holder;
            E : aliased E_Holders.Holder;
            F : aliased F_Holders.Holder;
            G : aliased G_Holders.Holder;
            H : aliased H_Holders.Holder;
            I : aliased I_Holders.Holder;
            Shrinker : Valid_Options := Valid_Options'First;
            Prev_Shrinker : Options := None;
         end record;
         overriding
         function Current (This : in out Node) return Value;
         overriding
         function Simplify (This : in out Node) return Boolean;
         overriding
         function Complicate (This : in out Node) return Boolean;
      end Impl;
      package Strat
      is new Definite_Strategy (Value, Value_Tree, Impl.Node, Impl.Create);
   end Tuple_9;
   generic
      with package A_Strat is new Definite_Strategy (<>);
      with package B_Strat is new Definite_Strategy (<>);
      with package C_Strat is new Definite_Strategy (<>);
      with package D_Strat is new Definite_Strategy (<>);
      with package E_Strat is new Definite_Strategy (<>);
      with package F_Strat is new Definite_Strategy (<>);
      with package G_Strat is new Definite_Strategy (<>);
      with package H_Strat is new Definite_Strategy (<>);
      with package I_Strat is new Definite_Strategy (<>);
      with package J_Strat is new Definite_Strategy (<>);
   package Tuple_10 is
      type Value is record
         A : A_Strat.Value;
         B : B_Strat.Value;
         C : C_Strat.Value;
         D : D_Strat.Value;
         E : E_Strat.Value;
         F : F_Strat.Value;
         G : G_Strat.Value;
         H : H_Strat.Value;
         I : I_Strat.Value;
         J : J_Strat.Value;
      end record;
      package Value_Tree is new Definite_Value_Tree (Value);
      package Impl is
         type Node (<>) is new Value_Tree.Value_Node with private;
         function Create (Ctx : in out Runner_Context'Class) return Node;
      private
         package A_Holders
         is new Ada.Containers.Indefinite_Holders (A_Strat.Node, A_Strat."=");
         package B_Holders
         is new Ada.Containers.Indefinite_Holders (B_Strat.Node, B_Strat."=");
         package C_Holders
         is new Ada.Containers.Indefinite_Holders (C_Strat.Node, C_Strat."=");
         package D_Holders
         is new Ada.Containers.Indefinite_Holders (D_Strat.Node, D_Strat."=");
         package E_Holders
         is new Ada.Containers.Indefinite_Holders (E_Strat.Node, E_Strat."=");
         package F_Holders
         is new Ada.Containers.Indefinite_Holders (F_Strat.Node, F_Strat."=");
         package G_Holders
         is new Ada.Containers.Indefinite_Holders (G_Strat.Node, G_Strat."=");
         package H_Holders
         is new Ada.Containers.Indefinite_Holders (H_Strat.Node, H_Strat."=");
         package I_Holders
         is new Ada.Containers.Indefinite_Holders (I_Strat.Node, I_Strat."=");
         package J_Holders
         is new Ada.Containers.Indefinite_Holders (J_Strat.Node, J_Strat."=");
         type Options is (None, A, B, C, D, E, F, G, H, I, J);
         subtype Valid_Options is Options range A .. Options'Last;
         subtype Parent is Value_Tree.Value_Node;
         type Node is new Parent with record
            A : aliased A_Holders.Holder;
            B : aliased B_Holders.Holder;
            C : aliased C_Holders.Holder;
            D : aliased D_Holders.Holder;
            E : aliased E_Holders.Holder;
            F : aliased F_Holders.Holder;
            G : aliased G_Holders.Holder;
            H : aliased H_Holders.Holder;
            I : aliased I_Holders.Holder;
            J : aliased J_Holders.Holder;
            Shrinker : Valid_Options := Valid_Options'First;
            Prev_Shrinker : Options := None;
         end record;
         overriding
         function Current (This : in out Node) return Value;
         overriding
         function Simplify (This : in out Node) return Boolean;
         overriding
         function Complicate (This : in out Node) return Boolean;
      end Impl;
      package Strat
      is new Definite_Strategy (Value, Value_Tree, Impl.Node, Impl.Create);
   end Tuple_10;
end Strategy.Tuples;
