with Ada.Containers.Indefinite_Holders;
pragma Style_Checks (Off);
package Strategy.One_Of is
   generic
      type Value is limited private;
      with package Value_Tree is new Definite_Value_Tree (Value => Value);
      with package A_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package B_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
   package Just_One_Of_2 is
      package Impl is
         type Node (<>) is new Value_Tree.Value_Node with private;
         function Create (Ctx : in out Runner_Context'Class) return Node;
      private
         package A_Holders
         is new Ada.Containers.Indefinite_Holders (A_Strat.Node, A_Strat."=");
         package B_Holders
         is new Ada.Containers.Indefinite_Holders (B_Strat.Node, B_Strat."=");
         type Options is (A, B);
         subtype Parent is Value_Tree.Value_Node;
         type Node (Pick : Options) is new Parent with record
            case Pick is
            when A => A : aliased A_Holders.Holder;
            when B => B : aliased B_Holders.Holder;
            end case;
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
   end Just_One_Of_2;
   generic
      type Value is limited private;
      with package Value_Tree is new Definite_Value_Tree (Value => Value);
      with package A_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package B_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package C_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
   package Just_One_Of_3 is
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
         type Options is (A, B, C);
         subtype Parent is Value_Tree.Value_Node;
         type Node (Pick : Options) is new Parent with record
            case Pick is
            when A => A : aliased A_Holders.Holder;
            when B => B : aliased B_Holders.Holder;
            when C => C : aliased C_Holders.Holder;
            end case;
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
   end Just_One_Of_3;
   generic
      type Value is limited private;
      with package Value_Tree is new Definite_Value_Tree (Value => Value);
      with package A_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package B_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package C_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package D_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
   package Just_One_Of_4 is
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
         type Options is (A, B, C, D);
         subtype Parent is Value_Tree.Value_Node;
         type Node (Pick : Options) is new Parent with record
            case Pick is
            when A => A : aliased A_Holders.Holder;
            when B => B : aliased B_Holders.Holder;
            when C => C : aliased C_Holders.Holder;
            when D => D : aliased D_Holders.Holder;
            end case;
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
   end Just_One_Of_4;
   generic
      type Value is limited private;
      with package Value_Tree is new Definite_Value_Tree (Value => Value);
      with package A_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package B_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package C_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package D_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package E_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
   package Just_One_Of_5 is
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
         type Options is (A, B, C, D, E);
         subtype Parent is Value_Tree.Value_Node;
         type Node (Pick : Options) is new Parent with record
            case Pick is
            when A => A : aliased A_Holders.Holder;
            when B => B : aliased B_Holders.Holder;
            when C => C : aliased C_Holders.Holder;
            when D => D : aliased D_Holders.Holder;
            when E => E : aliased E_Holders.Holder;
            end case;
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
   end Just_One_Of_5;
   generic
      type Value is limited private;
      with package Value_Tree is new Definite_Value_Tree (Value => Value);
      with package A_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package B_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package C_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package D_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package E_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package F_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
   package Just_One_Of_6 is
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
         type Options is (A, B, C, D, E, F);
         subtype Parent is Value_Tree.Value_Node;
         type Node (Pick : Options) is new Parent with record
            case Pick is
            when A => A : aliased A_Holders.Holder;
            when B => B : aliased B_Holders.Holder;
            when C => C : aliased C_Holders.Holder;
            when D => D : aliased D_Holders.Holder;
            when E => E : aliased E_Holders.Holder;
            when F => F : aliased F_Holders.Holder;
            end case;
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
   end Just_One_Of_6;
   generic
      type Value is limited private;
      with package Value_Tree is new Definite_Value_Tree (Value => Value);
      with package A_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package B_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package C_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package D_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package E_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package F_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package G_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
   package Just_One_Of_7 is
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
         type Options is (A, B, C, D, E, F, G);
         subtype Parent is Value_Tree.Value_Node;
         type Node (Pick : Options) is new Parent with record
            case Pick is
            when A => A : aliased A_Holders.Holder;
            when B => B : aliased B_Holders.Holder;
            when C => C : aliased C_Holders.Holder;
            when D => D : aliased D_Holders.Holder;
            when E => E : aliased E_Holders.Holder;
            when F => F : aliased F_Holders.Holder;
            when G => G : aliased G_Holders.Holder;
            end case;
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
   end Just_One_Of_7;
   generic
      type Value is limited private;
      with package Value_Tree is new Definite_Value_Tree (Value => Value);
      with package A_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package B_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package C_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package D_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package E_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package F_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package G_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package H_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
   package Just_One_Of_8 is
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
         type Options is (A, B, C, D, E, F, G, H);
         subtype Parent is Value_Tree.Value_Node;
         type Node (Pick : Options) is new Parent with record
            case Pick is
            when A => A : aliased A_Holders.Holder;
            when B => B : aliased B_Holders.Holder;
            when C => C : aliased C_Holders.Holder;
            when D => D : aliased D_Holders.Holder;
            when E => E : aliased E_Holders.Holder;
            when F => F : aliased F_Holders.Holder;
            when G => G : aliased G_Holders.Holder;
            when H => H : aliased H_Holders.Holder;
            end case;
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
   end Just_One_Of_8;
   generic
      type Value is limited private;
      with package Value_Tree is new Definite_Value_Tree (Value => Value);
      with package A_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package B_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package C_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package D_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package E_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package F_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package G_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package H_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package I_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
   package Just_One_Of_9 is
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
         type Options is (A, B, C, D, E, F, G, H, I);
         subtype Parent is Value_Tree.Value_Node;
         type Node (Pick : Options) is new Parent with record
            case Pick is
            when A => A : aliased A_Holders.Holder;
            when B => B : aliased B_Holders.Holder;
            when C => C : aliased C_Holders.Holder;
            when D => D : aliased D_Holders.Holder;
            when E => E : aliased E_Holders.Holder;
            when F => F : aliased F_Holders.Holder;
            when G => G : aliased G_Holders.Holder;
            when H => H : aliased H_Holders.Holder;
            when I => I : aliased I_Holders.Holder;
            end case;
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
   end Just_One_Of_9;
   generic
      type Value is limited private;
      with package Value_Tree is new Definite_Value_Tree (Value => Value);
      with package A_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package B_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package C_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package D_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package E_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package F_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package G_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package H_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package I_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
      with package J_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);
   package Just_One_Of_10 is
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
         type Options is (A, B, C, D, E, F, G, H, I, J);
         subtype Parent is Value_Tree.Value_Node;
         type Node (Pick : Options) is new Parent with record
            case Pick is
            when A => A : aliased A_Holders.Holder;
            when B => B : aliased B_Holders.Holder;
            when C => C : aliased C_Holders.Holder;
            when D => D : aliased D_Holders.Holder;
            when E => E : aliased E_Holders.Holder;
            when F => F : aliased F_Holders.Holder;
            when G => G : aliased G_Holders.Holder;
            when H => H : aliased H_Holders.Holder;
            when I => I : aliased I_Holders.Holder;
            when J => J : aliased J_Holders.Holder;
            end case;
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
   end Just_One_Of_10;
end Strategy.One_Of;
