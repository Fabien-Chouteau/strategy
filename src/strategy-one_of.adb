with Ada.Numerics.Discrete_Random;
package body Strategy.One_Of is
   package body Just_One_Of_2 is
      package body Impl is
         function Create (Ctx : in out Runner_Context'Class) return Node is
            package RNG is new Ada.Numerics.Discrete_Random (Options);
            Gen : RNG.Generator;
            Pick : Options;
         begin
            RNG.Reset (Gen, Ctx.Random_Initiator);
            Pick := RNG.Random (Gen);
            case Pick is
            when A =>
               return (Parent with
                       Pick => A,
                       A => A_Holders.To_Holder (A_Strat.Create (Ctx)));
            when B =>
               return (Parent with
                       Pick => B,
                       B => B_Holders.To_Holder (B_Strat.Create (Ctx)));
            end case;
         end Create;
         overriding
         function Current (This : in out Node) return Value is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Current,
                       when B => B_Holders.Reference (This.B).Current);
         end Current;
         overriding
         function Simplify (This : in out Node) return Boolean is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Simplify,
                       when B => B_Holders.Reference (This.B).Simplify);
         end Simplify;
         overriding
         function Complicate (This : in out Node) return Boolean is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Complicate,
                       when B => B_Holders.Reference (This.B).Complicate);
         end Complicate;
      end Impl;
   end Just_One_Of_2;
   package body Just_One_Of_3 is
      package body Impl is
         function Create (Ctx : in out Runner_Context'Class) return Node is
            package RNG is new Ada.Numerics.Discrete_Random (Options);
            Gen : RNG.Generator;
            Pick : Options;
         begin
            RNG.Reset (Gen, Ctx.Random_Initiator);
            Pick := RNG.Random (Gen);
            case Pick is
            when A =>
               return (Parent with
                       Pick => A,
                       A => A_Holders.To_Holder (A_Strat.Create (Ctx)));
            when B =>
               return (Parent with
                       Pick => B,
                       B => B_Holders.To_Holder (B_Strat.Create (Ctx)));
            when C =>
               return (Parent with
                       Pick => C,
                       C => C_Holders.To_Holder (C_Strat.Create (Ctx)));
            end case;
         end Create;
         overriding
         function Current (This : in out Node) return Value is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Current,
                       when B => B_Holders.Reference (This.B).Current,
                       when C => C_Holders.Reference (This.C).Current);
         end Current;
         overriding
         function Simplify (This : in out Node) return Boolean is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Simplify,
                       when B => B_Holders.Reference (This.B).Simplify,
                       when C => C_Holders.Reference (This.C).Simplify);
         end Simplify;
         overriding
         function Complicate (This : in out Node) return Boolean is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Complicate,
                       when B => B_Holders.Reference (This.B).Complicate,
                       when C => C_Holders.Reference (This.C).Complicate);
         end Complicate;
      end Impl;
   end Just_One_Of_3;
   package body Just_One_Of_4 is
      package body Impl is
         function Create (Ctx : in out Runner_Context'Class) return Node is
            package RNG is new Ada.Numerics.Discrete_Random (Options);
            Gen : RNG.Generator;
            Pick : Options;
         begin
            RNG.Reset (Gen, Ctx.Random_Initiator);
            Pick := RNG.Random (Gen);
            case Pick is
            when A =>
               return (Parent with
                       Pick => A,
                       A => A_Holders.To_Holder (A_Strat.Create (Ctx)));
            when B =>
               return (Parent with
                       Pick => B,
                       B => B_Holders.To_Holder (B_Strat.Create (Ctx)));
            when C =>
               return (Parent with
                       Pick => C,
                       C => C_Holders.To_Holder (C_Strat.Create (Ctx)));
            when D =>
               return (Parent with
                       Pick => D,
                       D => D_Holders.To_Holder (D_Strat.Create (Ctx)));
            end case;
         end Create;
         overriding
         function Current (This : in out Node) return Value is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Current,
                       when B => B_Holders.Reference (This.B).Current,
                       when C => C_Holders.Reference (This.C).Current,
                       when D => D_Holders.Reference (This.D).Current);
         end Current;
         overriding
         function Simplify (This : in out Node) return Boolean is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Simplify,
                       when B => B_Holders.Reference (This.B).Simplify,
                       when C => C_Holders.Reference (This.C).Simplify,
                       when D => D_Holders.Reference (This.D).Simplify);
         end Simplify;
         overriding
         function Complicate (This : in out Node) return Boolean is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Complicate,
                       when B => B_Holders.Reference (This.B).Complicate,
                       when C => C_Holders.Reference (This.C).Complicate,
                       when D => D_Holders.Reference (This.D).Complicate);
         end Complicate;
      end Impl;
   end Just_One_Of_4;
   package body Just_One_Of_5 is
      package body Impl is
         function Create (Ctx : in out Runner_Context'Class) return Node is
            package RNG is new Ada.Numerics.Discrete_Random (Options);
            Gen : RNG.Generator;
            Pick : Options;
         begin
            RNG.Reset (Gen, Ctx.Random_Initiator);
            Pick := RNG.Random (Gen);
            case Pick is
            when A =>
               return (Parent with
                       Pick => A,
                       A => A_Holders.To_Holder (A_Strat.Create (Ctx)));
            when B =>
               return (Parent with
                       Pick => B,
                       B => B_Holders.To_Holder (B_Strat.Create (Ctx)));
            when C =>
               return (Parent with
                       Pick => C,
                       C => C_Holders.To_Holder (C_Strat.Create (Ctx)));
            when D =>
               return (Parent with
                       Pick => D,
                       D => D_Holders.To_Holder (D_Strat.Create (Ctx)));
            when E =>
               return (Parent with
                       Pick => E,
                       E => E_Holders.To_Holder (E_Strat.Create (Ctx)));
            end case;
         end Create;
         overriding
         function Current (This : in out Node) return Value is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Current,
                       when B => B_Holders.Reference (This.B).Current,
                       when C => C_Holders.Reference (This.C).Current,
                       when D => D_Holders.Reference (This.D).Current,
                       when E => E_Holders.Reference (This.E).Current);
         end Current;
         overriding
         function Simplify (This : in out Node) return Boolean is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Simplify,
                       when B => B_Holders.Reference (This.B).Simplify,
                       when C => C_Holders.Reference (This.C).Simplify,
                       when D => D_Holders.Reference (This.D).Simplify,
                       when E => E_Holders.Reference (This.E).Simplify);
         end Simplify;
         overriding
         function Complicate (This : in out Node) return Boolean is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Complicate,
                       when B => B_Holders.Reference (This.B).Complicate,
                       when C => C_Holders.Reference (This.C).Complicate,
                       when D => D_Holders.Reference (This.D).Complicate,
                       when E => E_Holders.Reference (This.E).Complicate);
         end Complicate;
      end Impl;
   end Just_One_Of_5;
   package body Just_One_Of_6 is
      package body Impl is
         function Create (Ctx : in out Runner_Context'Class) return Node is
            package RNG is new Ada.Numerics.Discrete_Random (Options);
            Gen : RNG.Generator;
            Pick : Options;
         begin
            RNG.Reset (Gen, Ctx.Random_Initiator);
            Pick := RNG.Random (Gen);
            case Pick is
            when A =>
               return (Parent with
                       Pick => A,
                       A => A_Holders.To_Holder (A_Strat.Create (Ctx)));
            when B =>
               return (Parent with
                       Pick => B,
                       B => B_Holders.To_Holder (B_Strat.Create (Ctx)));
            when C =>
               return (Parent with
                       Pick => C,
                       C => C_Holders.To_Holder (C_Strat.Create (Ctx)));
            when D =>
               return (Parent with
                       Pick => D,
                       D => D_Holders.To_Holder (D_Strat.Create (Ctx)));
            when E =>
               return (Parent with
                       Pick => E,
                       E => E_Holders.To_Holder (E_Strat.Create (Ctx)));
            when F =>
               return (Parent with
                       Pick => F,
                       F => F_Holders.To_Holder (F_Strat.Create (Ctx)));
            end case;
         end Create;
         overriding
         function Current (This : in out Node) return Value is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Current,
                       when B => B_Holders.Reference (This.B).Current,
                       when C => C_Holders.Reference (This.C).Current,
                       when D => D_Holders.Reference (This.D).Current,
                       when E => E_Holders.Reference (This.E).Current,
                       when F => F_Holders.Reference (This.F).Current);
         end Current;
         overriding
         function Simplify (This : in out Node) return Boolean is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Simplify,
                       when B => B_Holders.Reference (This.B).Simplify,
                       when C => C_Holders.Reference (This.C).Simplify,
                       when D => D_Holders.Reference (This.D).Simplify,
                       when E => E_Holders.Reference (This.E).Simplify,
                       when F => F_Holders.Reference (This.F).Simplify);
         end Simplify;
         overriding
         function Complicate (This : in out Node) return Boolean is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Complicate,
                       when B => B_Holders.Reference (This.B).Complicate,
                       when C => C_Holders.Reference (This.C).Complicate,
                       when D => D_Holders.Reference (This.D).Complicate,
                       when E => E_Holders.Reference (This.E).Complicate,
                       when F => F_Holders.Reference (This.F).Complicate);
         end Complicate;
      end Impl;
   end Just_One_Of_6;
   package body Just_One_Of_7 is
      package body Impl is
         function Create (Ctx : in out Runner_Context'Class) return Node is
            package RNG is new Ada.Numerics.Discrete_Random (Options);
            Gen : RNG.Generator;
            Pick : Options;
         begin
            RNG.Reset (Gen, Ctx.Random_Initiator);
            Pick := RNG.Random (Gen);
            case Pick is
            when A =>
               return (Parent with
                       Pick => A,
                       A => A_Holders.To_Holder (A_Strat.Create (Ctx)));
            when B =>
               return (Parent with
                       Pick => B,
                       B => B_Holders.To_Holder (B_Strat.Create (Ctx)));
            when C =>
               return (Parent with
                       Pick => C,
                       C => C_Holders.To_Holder (C_Strat.Create (Ctx)));
            when D =>
               return (Parent with
                       Pick => D,
                       D => D_Holders.To_Holder (D_Strat.Create (Ctx)));
            when E =>
               return (Parent with
                       Pick => E,
                       E => E_Holders.To_Holder (E_Strat.Create (Ctx)));
            when F =>
               return (Parent with
                       Pick => F,
                       F => F_Holders.To_Holder (F_Strat.Create (Ctx)));
            when G =>
               return (Parent with
                       Pick => G,
                       G => G_Holders.To_Holder (G_Strat.Create (Ctx)));
            end case;
         end Create;
         overriding
         function Current (This : in out Node) return Value is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Current,
                       when B => B_Holders.Reference (This.B).Current,
                       when C => C_Holders.Reference (This.C).Current,
                       when D => D_Holders.Reference (This.D).Current,
                       when E => E_Holders.Reference (This.E).Current,
                       when F => F_Holders.Reference (This.F).Current,
                       when G => G_Holders.Reference (This.G).Current);
         end Current;
         overriding
         function Simplify (This : in out Node) return Boolean is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Simplify,
                       when B => B_Holders.Reference (This.B).Simplify,
                       when C => C_Holders.Reference (This.C).Simplify,
                       when D => D_Holders.Reference (This.D).Simplify,
                       when E => E_Holders.Reference (This.E).Simplify,
                       when F => F_Holders.Reference (This.F).Simplify,
                       when G => G_Holders.Reference (This.G).Simplify);
         end Simplify;
         overriding
         function Complicate (This : in out Node) return Boolean is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Complicate,
                       when B => B_Holders.Reference (This.B).Complicate,
                       when C => C_Holders.Reference (This.C).Complicate,
                       when D => D_Holders.Reference (This.D).Complicate,
                       when E => E_Holders.Reference (This.E).Complicate,
                       when F => F_Holders.Reference (This.F).Complicate,
                       when G => G_Holders.Reference (This.G).Complicate);
         end Complicate;
      end Impl;
   end Just_One_Of_7;
   package body Just_One_Of_8 is
      package body Impl is
         function Create (Ctx : in out Runner_Context'Class) return Node is
            package RNG is new Ada.Numerics.Discrete_Random (Options);
            Gen : RNG.Generator;
            Pick : Options;
         begin
            RNG.Reset (Gen, Ctx.Random_Initiator);
            Pick := RNG.Random (Gen);
            case Pick is
            when A =>
               return (Parent with
                       Pick => A,
                       A => A_Holders.To_Holder (A_Strat.Create (Ctx)));
            when B =>
               return (Parent with
                       Pick => B,
                       B => B_Holders.To_Holder (B_Strat.Create (Ctx)));
            when C =>
               return (Parent with
                       Pick => C,
                       C => C_Holders.To_Holder (C_Strat.Create (Ctx)));
            when D =>
               return (Parent with
                       Pick => D,
                       D => D_Holders.To_Holder (D_Strat.Create (Ctx)));
            when E =>
               return (Parent with
                       Pick => E,
                       E => E_Holders.To_Holder (E_Strat.Create (Ctx)));
            when F =>
               return (Parent with
                       Pick => F,
                       F => F_Holders.To_Holder (F_Strat.Create (Ctx)));
            when G =>
               return (Parent with
                       Pick => G,
                       G => G_Holders.To_Holder (G_Strat.Create (Ctx)));
            when H =>
               return (Parent with
                       Pick => H,
                       H => H_Holders.To_Holder (H_Strat.Create (Ctx)));
            end case;
         end Create;
         overriding
         function Current (This : in out Node) return Value is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Current,
                       when B => B_Holders.Reference (This.B).Current,
                       when C => C_Holders.Reference (This.C).Current,
                       when D => D_Holders.Reference (This.D).Current,
                       when E => E_Holders.Reference (This.E).Current,
                       when F => F_Holders.Reference (This.F).Current,
                       when G => G_Holders.Reference (This.G).Current,
                       when H => H_Holders.Reference (This.H).Current);
         end Current;
         overriding
         function Simplify (This : in out Node) return Boolean is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Simplify,
                       when B => B_Holders.Reference (This.B).Simplify,
                       when C => C_Holders.Reference (This.C).Simplify,
                       when D => D_Holders.Reference (This.D).Simplify,
                       when E => E_Holders.Reference (This.E).Simplify,
                       when F => F_Holders.Reference (This.F).Simplify,
                       when G => G_Holders.Reference (This.G).Simplify,
                       when H => H_Holders.Reference (This.H).Simplify);
         end Simplify;
         overriding
         function Complicate (This : in out Node) return Boolean is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Complicate,
                       when B => B_Holders.Reference (This.B).Complicate,
                       when C => C_Holders.Reference (This.C).Complicate,
                       when D => D_Holders.Reference (This.D).Complicate,
                       when E => E_Holders.Reference (This.E).Complicate,
                       when F => F_Holders.Reference (This.F).Complicate,
                       when G => G_Holders.Reference (This.G).Complicate,
                       when H => H_Holders.Reference (This.H).Complicate);
         end Complicate;
      end Impl;
   end Just_One_Of_8;
   package body Just_One_Of_9 is
      package body Impl is
         function Create (Ctx : in out Runner_Context'Class) return Node is
            package RNG is new Ada.Numerics.Discrete_Random (Options);
            Gen : RNG.Generator;
            Pick : Options;
         begin
            RNG.Reset (Gen, Ctx.Random_Initiator);
            Pick := RNG.Random (Gen);
            case Pick is
            when A =>
               return (Parent with
                       Pick => A,
                       A => A_Holders.To_Holder (A_Strat.Create (Ctx)));
            when B =>
               return (Parent with
                       Pick => B,
                       B => B_Holders.To_Holder (B_Strat.Create (Ctx)));
            when C =>
               return (Parent with
                       Pick => C,
                       C => C_Holders.To_Holder (C_Strat.Create (Ctx)));
            when D =>
               return (Parent with
                       Pick => D,
                       D => D_Holders.To_Holder (D_Strat.Create (Ctx)));
            when E =>
               return (Parent with
                       Pick => E,
                       E => E_Holders.To_Holder (E_Strat.Create (Ctx)));
            when F =>
               return (Parent with
                       Pick => F,
                       F => F_Holders.To_Holder (F_Strat.Create (Ctx)));
            when G =>
               return (Parent with
                       Pick => G,
                       G => G_Holders.To_Holder (G_Strat.Create (Ctx)));
            when H =>
               return (Parent with
                       Pick => H,
                       H => H_Holders.To_Holder (H_Strat.Create (Ctx)));
            when I =>
               return (Parent with
                       Pick => I,
                       I => I_Holders.To_Holder (I_Strat.Create (Ctx)));
            end case;
         end Create;
         overriding
         function Current (This : in out Node) return Value is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Current,
                       when B => B_Holders.Reference (This.B).Current,
                       when C => C_Holders.Reference (This.C).Current,
                       when D => D_Holders.Reference (This.D).Current,
                       when E => E_Holders.Reference (This.E).Current,
                       when F => F_Holders.Reference (This.F).Current,
                       when G => G_Holders.Reference (This.G).Current,
                       when H => H_Holders.Reference (This.H).Current,
                       when I => I_Holders.Reference (This.I).Current);
         end Current;
         overriding
         function Simplify (This : in out Node) return Boolean is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Simplify,
                       when B => B_Holders.Reference (This.B).Simplify,
                       when C => C_Holders.Reference (This.C).Simplify,
                       when D => D_Holders.Reference (This.D).Simplify,
                       when E => E_Holders.Reference (This.E).Simplify,
                       when F => F_Holders.Reference (This.F).Simplify,
                       when G => G_Holders.Reference (This.G).Simplify,
                       when H => H_Holders.Reference (This.H).Simplify,
                       when I => I_Holders.Reference (This.I).Simplify);
         end Simplify;
         overriding
         function Complicate (This : in out Node) return Boolean is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Complicate,
                       when B => B_Holders.Reference (This.B).Complicate,
                       when C => C_Holders.Reference (This.C).Complicate,
                       when D => D_Holders.Reference (This.D).Complicate,
                       when E => E_Holders.Reference (This.E).Complicate,
                       when F => F_Holders.Reference (This.F).Complicate,
                       when G => G_Holders.Reference (This.G).Complicate,
                       when H => H_Holders.Reference (This.H).Complicate,
                       when I => I_Holders.Reference (This.I).Complicate);
         end Complicate;
      end Impl;
   end Just_One_Of_9;
   package body Just_One_Of_10 is
      package body Impl is
         function Create (Ctx : in out Runner_Context'Class) return Node is
            package RNG is new Ada.Numerics.Discrete_Random (Options);
            Gen : RNG.Generator;
            Pick : Options;
         begin
            RNG.Reset (Gen, Ctx.Random_Initiator);
            Pick := RNG.Random (Gen);
            case Pick is
            when A =>
               return (Parent with
                       Pick => A,
                       A => A_Holders.To_Holder (A_Strat.Create (Ctx)));
            when B =>
               return (Parent with
                       Pick => B,
                       B => B_Holders.To_Holder (B_Strat.Create (Ctx)));
            when C =>
               return (Parent with
                       Pick => C,
                       C => C_Holders.To_Holder (C_Strat.Create (Ctx)));
            when D =>
               return (Parent with
                       Pick => D,
                       D => D_Holders.To_Holder (D_Strat.Create (Ctx)));
            when E =>
               return (Parent with
                       Pick => E,
                       E => E_Holders.To_Holder (E_Strat.Create (Ctx)));
            when F =>
               return (Parent with
                       Pick => F,
                       F => F_Holders.To_Holder (F_Strat.Create (Ctx)));
            when G =>
               return (Parent with
                       Pick => G,
                       G => G_Holders.To_Holder (G_Strat.Create (Ctx)));
            when H =>
               return (Parent with
                       Pick => H,
                       H => H_Holders.To_Holder (H_Strat.Create (Ctx)));
            when I =>
               return (Parent with
                       Pick => I,
                       I => I_Holders.To_Holder (I_Strat.Create (Ctx)));
            when J =>
               return (Parent with
                       Pick => J,
                       J => J_Holders.To_Holder (J_Strat.Create (Ctx)));
            end case;
         end Create;
         overriding
         function Current (This : in out Node) return Value is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Current,
                       when B => B_Holders.Reference (This.B).Current,
                       when C => C_Holders.Reference (This.C).Current,
                       when D => D_Holders.Reference (This.D).Current,
                       when E => E_Holders.Reference (This.E).Current,
                       when F => F_Holders.Reference (This.F).Current,
                       when G => G_Holders.Reference (This.G).Current,
                       when H => H_Holders.Reference (This.H).Current,
                       when I => I_Holders.Reference (This.I).Current,
                       when J => J_Holders.Reference (This.J).Current);
         end Current;
         overriding
         function Simplify (This : in out Node) return Boolean is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Simplify,
                       when B => B_Holders.Reference (This.B).Simplify,
                       when C => C_Holders.Reference (This.C).Simplify,
                       when D => D_Holders.Reference (This.D).Simplify,
                       when E => E_Holders.Reference (This.E).Simplify,
                       when F => F_Holders.Reference (This.F).Simplify,
                       when G => G_Holders.Reference (This.G).Simplify,
                       when H => H_Holders.Reference (This.H).Simplify,
                       when I => I_Holders.Reference (This.I).Simplify,
                       when J => J_Holders.Reference (This.J).Simplify);
         end Simplify;
         overriding
         function Complicate (This : in out Node) return Boolean is
         begin
            return (case This.Pick is
                       when A => A_Holders.Reference (This.A).Complicate,
                       when B => B_Holders.Reference (This.B).Complicate,
                       when C => C_Holders.Reference (This.C).Complicate,
                       when D => D_Holders.Reference (This.D).Complicate,
                       when E => E_Holders.Reference (This.E).Complicate,
                       when F => F_Holders.Reference (This.F).Complicate,
                       when G => G_Holders.Reference (This.G).Complicate,
                       when H => H_Holders.Reference (This.H).Complicate,
                       when I => I_Holders.Reference (This.I).Complicate,
                       when J => J_Holders.Reference (This.J).Complicate);
         end Complicate;
      end Impl;
   end Just_One_Of_10;
end Strategy.One_Of;
