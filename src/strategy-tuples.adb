package body Strategy.Tuples is
   package body Tuple_2 is
      package body Impl is
         function Create (Ctx : in out Runner_Context'Class) return Node
         is ((Parent with
              A => A_Holders.To_Holder (A_Strat.Create (Ctx)),
              B => B_Holders.To_Holder (B_Strat.Create (Ctx)),
              others => <>));
         overriding
         function Current (This : in out Node) return Value is
         begin
            return (
                    A => A_Holders.Reference (This.A).Current,
                    B => B_Holders.Reference (This.B).Current);
         end Current;
         overriding
         function Simplify (This : in out Node) return Boolean is
         begin
            if (case This.Shrinker is
                   when A => A_Holders.Reference (This.A).Simplify,
                   when B => B_Holders.Reference (This.B).Simplify)
            then
               This.Prev_Shrinker := This.Shrinker;
               return True;
            else
               if This.Shrinker /= Valid_Options'Last then
                  This.Shrinker := Valid_Options'Succ (This.Shrinker);
                  return Simplify (This);
               else
                  return False;
               end if;
            end if;
         end Simplify;
         overriding
         function Complicate (This : in out Node) return Boolean is
         begin
            if (case This.Prev_Shrinker is
                   when A => A_Holders.Reference (This.A).Complicate,
                   when B => B_Holders.Reference (This.B).Complicate,
                   when None => False)
            then
               This.Shrinker := This.Prev_Shrinker;
               return True;
            else
               This.Prev_Shrinker := None;
               return False;
            end if;
         end Complicate;
      end Impl;
   end Tuple_2;
   package body Tuple_3 is
      package body Impl is
         function Create (Ctx : in out Runner_Context'Class) return Node
         is ((Parent with
              A => A_Holders.To_Holder (A_Strat.Create (Ctx)),
              B => B_Holders.To_Holder (B_Strat.Create (Ctx)),
              C => C_Holders.To_Holder (C_Strat.Create (Ctx)),
              others => <>));
         overriding
         function Current (This : in out Node) return Value is
         begin
            return (
                    A => A_Holders.Reference (This.A).Current,
                    B => B_Holders.Reference (This.B).Current,
                    C => C_Holders.Reference (This.C).Current);
         end Current;
         overriding
         function Simplify (This : in out Node) return Boolean is
         begin
            if (case This.Shrinker is
                   when A => A_Holders.Reference (This.A).Simplify,
                   when B => B_Holders.Reference (This.B).Simplify,
                   when C => C_Holders.Reference (This.C).Simplify)
            then
               This.Prev_Shrinker := This.Shrinker;
               return True;
            else
               if This.Shrinker /= Valid_Options'Last then
                  This.Shrinker := Valid_Options'Succ (This.Shrinker);
                  return Simplify (This);
               else
                  return False;
               end if;
            end if;
         end Simplify;
         overriding
         function Complicate (This : in out Node) return Boolean is
         begin
            if (case This.Prev_Shrinker is
                   when A => A_Holders.Reference (This.A).Complicate,
                   when B => B_Holders.Reference (This.B).Complicate,
                   when C => C_Holders.Reference (This.C).Complicate,
                   when None => False)
            then
               This.Shrinker := This.Prev_Shrinker;
               return True;
            else
               This.Prev_Shrinker := None;
               return False;
            end if;
         end Complicate;
      end Impl;
   end Tuple_3;
   package body Tuple_4 is
      package body Impl is
         function Create (Ctx : in out Runner_Context'Class) return Node
         is ((Parent with
              A => A_Holders.To_Holder (A_Strat.Create (Ctx)),
              B => B_Holders.To_Holder (B_Strat.Create (Ctx)),
              C => C_Holders.To_Holder (C_Strat.Create (Ctx)),
              D => D_Holders.To_Holder (D_Strat.Create (Ctx)),
              others => <>));
         overriding
         function Current (This : in out Node) return Value is
         begin
            return (
                    A => A_Holders.Reference (This.A).Current,
                    B => B_Holders.Reference (This.B).Current,
                    C => C_Holders.Reference (This.C).Current,
                    D => D_Holders.Reference (This.D).Current);
         end Current;
         overriding
         function Simplify (This : in out Node) return Boolean is
         begin
            if (case This.Shrinker is
                   when A => A_Holders.Reference (This.A).Simplify,
                   when B => B_Holders.Reference (This.B).Simplify,
                   when C => C_Holders.Reference (This.C).Simplify,
                   when D => D_Holders.Reference (This.D).Simplify)
            then
               This.Prev_Shrinker := This.Shrinker;
               return True;
            else
               if This.Shrinker /= Valid_Options'Last then
                  This.Shrinker := Valid_Options'Succ (This.Shrinker);
                  return Simplify (This);
               else
                  return False;
               end if;
            end if;
         end Simplify;
         overriding
         function Complicate (This : in out Node) return Boolean is
         begin
            if (case This.Prev_Shrinker is
                   when A => A_Holders.Reference (This.A).Complicate,
                   when B => B_Holders.Reference (This.B).Complicate,
                   when C => C_Holders.Reference (This.C).Complicate,
                   when D => D_Holders.Reference (This.D).Complicate,
                   when None => False)
            then
               This.Shrinker := This.Prev_Shrinker;
               return True;
            else
               This.Prev_Shrinker := None;
               return False;
            end if;
         end Complicate;
      end Impl;
   end Tuple_4;
   package body Tuple_5 is
      package body Impl is
         function Create (Ctx : in out Runner_Context'Class) return Node
         is ((Parent with
              A => A_Holders.To_Holder (A_Strat.Create (Ctx)),
              B => B_Holders.To_Holder (B_Strat.Create (Ctx)),
              C => C_Holders.To_Holder (C_Strat.Create (Ctx)),
              D => D_Holders.To_Holder (D_Strat.Create (Ctx)),
              E => E_Holders.To_Holder (E_Strat.Create (Ctx)),
              others => <>));
         overriding
         function Current (This : in out Node) return Value is
         begin
            return (
                    A => A_Holders.Reference (This.A).Current,
                    B => B_Holders.Reference (This.B).Current,
                    C => C_Holders.Reference (This.C).Current,
                    D => D_Holders.Reference (This.D).Current,
                    E => E_Holders.Reference (This.E).Current);
         end Current;
         overriding
         function Simplify (This : in out Node) return Boolean is
         begin
            if (case This.Shrinker is
                   when A => A_Holders.Reference (This.A).Simplify,
                   when B => B_Holders.Reference (This.B).Simplify,
                   when C => C_Holders.Reference (This.C).Simplify,
                   when D => D_Holders.Reference (This.D).Simplify,
                   when E => E_Holders.Reference (This.E).Simplify)
            then
               This.Prev_Shrinker := This.Shrinker;
               return True;
            else
               if This.Shrinker /= Valid_Options'Last then
                  This.Shrinker := Valid_Options'Succ (This.Shrinker);
                  return Simplify (This);
               else
                  return False;
               end if;
            end if;
         end Simplify;
         overriding
         function Complicate (This : in out Node) return Boolean is
         begin
            if (case This.Prev_Shrinker is
                   when A => A_Holders.Reference (This.A).Complicate,
                   when B => B_Holders.Reference (This.B).Complicate,
                   when C => C_Holders.Reference (This.C).Complicate,
                   when D => D_Holders.Reference (This.D).Complicate,
                   when E => E_Holders.Reference (This.E).Complicate,
                   when None => False)
            then
               This.Shrinker := This.Prev_Shrinker;
               return True;
            else
               This.Prev_Shrinker := None;
               return False;
            end if;
         end Complicate;
      end Impl;
   end Tuple_5;
   package body Tuple_6 is
      package body Impl is
         function Create (Ctx : in out Runner_Context'Class) return Node
         is ((Parent with
              A => A_Holders.To_Holder (A_Strat.Create (Ctx)),
              B => B_Holders.To_Holder (B_Strat.Create (Ctx)),
              C => C_Holders.To_Holder (C_Strat.Create (Ctx)),
              D => D_Holders.To_Holder (D_Strat.Create (Ctx)),
              E => E_Holders.To_Holder (E_Strat.Create (Ctx)),
              F => F_Holders.To_Holder (F_Strat.Create (Ctx)),
              others => <>));
         overriding
         function Current (This : in out Node) return Value is
         begin
            return (
                    A => A_Holders.Reference (This.A).Current,
                    B => B_Holders.Reference (This.B).Current,
                    C => C_Holders.Reference (This.C).Current,
                    D => D_Holders.Reference (This.D).Current,
                    E => E_Holders.Reference (This.E).Current,
                    F => F_Holders.Reference (This.F).Current);
         end Current;
         overriding
         function Simplify (This : in out Node) return Boolean is
         begin
            if (case This.Shrinker is
                   when A => A_Holders.Reference (This.A).Simplify,
                   when B => B_Holders.Reference (This.B).Simplify,
                   when C => C_Holders.Reference (This.C).Simplify,
                   when D => D_Holders.Reference (This.D).Simplify,
                   when E => E_Holders.Reference (This.E).Simplify,
                   when F => F_Holders.Reference (This.F).Simplify)
            then
               This.Prev_Shrinker := This.Shrinker;
               return True;
            else
               if This.Shrinker /= Valid_Options'Last then
                  This.Shrinker := Valid_Options'Succ (This.Shrinker);
                  return Simplify (This);
               else
                  return False;
               end if;
            end if;
         end Simplify;
         overriding
         function Complicate (This : in out Node) return Boolean is
         begin
            if (case This.Prev_Shrinker is
                   when A => A_Holders.Reference (This.A).Complicate,
                   when B => B_Holders.Reference (This.B).Complicate,
                   when C => C_Holders.Reference (This.C).Complicate,
                   when D => D_Holders.Reference (This.D).Complicate,
                   when E => E_Holders.Reference (This.E).Complicate,
                   when F => F_Holders.Reference (This.F).Complicate,
                   when None => False)
            then
               This.Shrinker := This.Prev_Shrinker;
               return True;
            else
               This.Prev_Shrinker := None;
               return False;
            end if;
         end Complicate;
      end Impl;
   end Tuple_6;
   package body Tuple_7 is
      package body Impl is
         function Create (Ctx : in out Runner_Context'Class) return Node
         is ((Parent with
              A => A_Holders.To_Holder (A_Strat.Create (Ctx)),
              B => B_Holders.To_Holder (B_Strat.Create (Ctx)),
              C => C_Holders.To_Holder (C_Strat.Create (Ctx)),
              D => D_Holders.To_Holder (D_Strat.Create (Ctx)),
              E => E_Holders.To_Holder (E_Strat.Create (Ctx)),
              F => F_Holders.To_Holder (F_Strat.Create (Ctx)),
              G => G_Holders.To_Holder (G_Strat.Create (Ctx)),
              others => <>));
         overriding
         function Current (This : in out Node) return Value is
         begin
            return (
                    A => A_Holders.Reference (This.A).Current,
                    B => B_Holders.Reference (This.B).Current,
                    C => C_Holders.Reference (This.C).Current,
                    D => D_Holders.Reference (This.D).Current,
                    E => E_Holders.Reference (This.E).Current,
                    F => F_Holders.Reference (This.F).Current,
                    G => G_Holders.Reference (This.G).Current);
         end Current;
         overriding
         function Simplify (This : in out Node) return Boolean is
         begin
            if (case This.Shrinker is
                   when A => A_Holders.Reference (This.A).Simplify,
                   when B => B_Holders.Reference (This.B).Simplify,
                   when C => C_Holders.Reference (This.C).Simplify,
                   when D => D_Holders.Reference (This.D).Simplify,
                   when E => E_Holders.Reference (This.E).Simplify,
                   when F => F_Holders.Reference (This.F).Simplify,
                   when G => G_Holders.Reference (This.G).Simplify)
            then
               This.Prev_Shrinker := This.Shrinker;
               return True;
            else
               if This.Shrinker /= Valid_Options'Last then
                  This.Shrinker := Valid_Options'Succ (This.Shrinker);
                  return Simplify (This);
               else
                  return False;
               end if;
            end if;
         end Simplify;
         overriding
         function Complicate (This : in out Node) return Boolean is
         begin
            if (case This.Prev_Shrinker is
                   when A => A_Holders.Reference (This.A).Complicate,
                   when B => B_Holders.Reference (This.B).Complicate,
                   when C => C_Holders.Reference (This.C).Complicate,
                   when D => D_Holders.Reference (This.D).Complicate,
                   when E => E_Holders.Reference (This.E).Complicate,
                   when F => F_Holders.Reference (This.F).Complicate,
                   when G => G_Holders.Reference (This.G).Complicate,
                   when None => False)
            then
               This.Shrinker := This.Prev_Shrinker;
               return True;
            else
               This.Prev_Shrinker := None;
               return False;
            end if;
         end Complicate;
      end Impl;
   end Tuple_7;
   package body Tuple_8 is
      package body Impl is
         function Create (Ctx : in out Runner_Context'Class) return Node
         is ((Parent with
              A => A_Holders.To_Holder (A_Strat.Create (Ctx)),
              B => B_Holders.To_Holder (B_Strat.Create (Ctx)),
              C => C_Holders.To_Holder (C_Strat.Create (Ctx)),
              D => D_Holders.To_Holder (D_Strat.Create (Ctx)),
              E => E_Holders.To_Holder (E_Strat.Create (Ctx)),
              F => F_Holders.To_Holder (F_Strat.Create (Ctx)),
              G => G_Holders.To_Holder (G_Strat.Create (Ctx)),
              H => H_Holders.To_Holder (H_Strat.Create (Ctx)),
              others => <>));
         overriding
         function Current (This : in out Node) return Value is
         begin
            return (
                    A => A_Holders.Reference (This.A).Current,
                    B => B_Holders.Reference (This.B).Current,
                    C => C_Holders.Reference (This.C).Current,
                    D => D_Holders.Reference (This.D).Current,
                    E => E_Holders.Reference (This.E).Current,
                    F => F_Holders.Reference (This.F).Current,
                    G => G_Holders.Reference (This.G).Current,
                    H => H_Holders.Reference (This.H).Current);
         end Current;
         overriding
         function Simplify (This : in out Node) return Boolean is
         begin
            if (case This.Shrinker is
                   when A => A_Holders.Reference (This.A).Simplify,
                   when B => B_Holders.Reference (This.B).Simplify,
                   when C => C_Holders.Reference (This.C).Simplify,
                   when D => D_Holders.Reference (This.D).Simplify,
                   when E => E_Holders.Reference (This.E).Simplify,
                   when F => F_Holders.Reference (This.F).Simplify,
                   when G => G_Holders.Reference (This.G).Simplify,
                   when H => H_Holders.Reference (This.H).Simplify)
            then
               This.Prev_Shrinker := This.Shrinker;
               return True;
            else
               if This.Shrinker /= Valid_Options'Last then
                  This.Shrinker := Valid_Options'Succ (This.Shrinker);
                  return Simplify (This);
               else
                  return False;
               end if;
            end if;
         end Simplify;
         overriding
         function Complicate (This : in out Node) return Boolean is
         begin
            if (case This.Prev_Shrinker is
                   when A => A_Holders.Reference (This.A).Complicate,
                   when B => B_Holders.Reference (This.B).Complicate,
                   when C => C_Holders.Reference (This.C).Complicate,
                   when D => D_Holders.Reference (This.D).Complicate,
                   when E => E_Holders.Reference (This.E).Complicate,
                   when F => F_Holders.Reference (This.F).Complicate,
                   when G => G_Holders.Reference (This.G).Complicate,
                   when H => H_Holders.Reference (This.H).Complicate,
                   when None => False)
            then
               This.Shrinker := This.Prev_Shrinker;
               return True;
            else
               This.Prev_Shrinker := None;
               return False;
            end if;
         end Complicate;
      end Impl;
   end Tuple_8;
   package body Tuple_9 is
      package body Impl is
         function Create (Ctx : in out Runner_Context'Class) return Node
         is ((Parent with
              A => A_Holders.To_Holder (A_Strat.Create (Ctx)),
              B => B_Holders.To_Holder (B_Strat.Create (Ctx)),
              C => C_Holders.To_Holder (C_Strat.Create (Ctx)),
              D => D_Holders.To_Holder (D_Strat.Create (Ctx)),
              E => E_Holders.To_Holder (E_Strat.Create (Ctx)),
              F => F_Holders.To_Holder (F_Strat.Create (Ctx)),
              G => G_Holders.To_Holder (G_Strat.Create (Ctx)),
              H => H_Holders.To_Holder (H_Strat.Create (Ctx)),
              I => I_Holders.To_Holder (I_Strat.Create (Ctx)),
              others => <>));
         overriding
         function Current (This : in out Node) return Value is
         begin
            return (
                    A => A_Holders.Reference (This.A).Current,
                    B => B_Holders.Reference (This.B).Current,
                    C => C_Holders.Reference (This.C).Current,
                    D => D_Holders.Reference (This.D).Current,
                    E => E_Holders.Reference (This.E).Current,
                    F => F_Holders.Reference (This.F).Current,
                    G => G_Holders.Reference (This.G).Current,
                    H => H_Holders.Reference (This.H).Current,
                    I => I_Holders.Reference (This.I).Current);
         end Current;
         overriding
         function Simplify (This : in out Node) return Boolean is
         begin
            if (case This.Shrinker is
                   when A => A_Holders.Reference (This.A).Simplify,
                   when B => B_Holders.Reference (This.B).Simplify,
                   when C => C_Holders.Reference (This.C).Simplify,
                   when D => D_Holders.Reference (This.D).Simplify,
                   when E => E_Holders.Reference (This.E).Simplify,
                   when F => F_Holders.Reference (This.F).Simplify,
                   when G => G_Holders.Reference (This.G).Simplify,
                   when H => H_Holders.Reference (This.H).Simplify,
                   when I => I_Holders.Reference (This.I).Simplify)
            then
               This.Prev_Shrinker := This.Shrinker;
               return True;
            else
               if This.Shrinker /= Valid_Options'Last then
                  This.Shrinker := Valid_Options'Succ (This.Shrinker);
                  return Simplify (This);
               else
                  return False;
               end if;
            end if;
         end Simplify;
         overriding
         function Complicate (This : in out Node) return Boolean is
         begin
            if (case This.Prev_Shrinker is
                   when A => A_Holders.Reference (This.A).Complicate,
                   when B => B_Holders.Reference (This.B).Complicate,
                   when C => C_Holders.Reference (This.C).Complicate,
                   when D => D_Holders.Reference (This.D).Complicate,
                   when E => E_Holders.Reference (This.E).Complicate,
                   when F => F_Holders.Reference (This.F).Complicate,
                   when G => G_Holders.Reference (This.G).Complicate,
                   when H => H_Holders.Reference (This.H).Complicate,
                   when I => I_Holders.Reference (This.I).Complicate,
                   when None => False)
            then
               This.Shrinker := This.Prev_Shrinker;
               return True;
            else
               This.Prev_Shrinker := None;
               return False;
            end if;
         end Complicate;
      end Impl;
   end Tuple_9;
   package body Tuple_10 is
      package body Impl is
         function Create (Ctx : in out Runner_Context'Class) return Node
         is ((Parent with
              A => A_Holders.To_Holder (A_Strat.Create (Ctx)),
              B => B_Holders.To_Holder (B_Strat.Create (Ctx)),
              C => C_Holders.To_Holder (C_Strat.Create (Ctx)),
              D => D_Holders.To_Holder (D_Strat.Create (Ctx)),
              E => E_Holders.To_Holder (E_Strat.Create (Ctx)),
              F => F_Holders.To_Holder (F_Strat.Create (Ctx)),
              G => G_Holders.To_Holder (G_Strat.Create (Ctx)),
              H => H_Holders.To_Holder (H_Strat.Create (Ctx)),
              I => I_Holders.To_Holder (I_Strat.Create (Ctx)),
              J => J_Holders.To_Holder (J_Strat.Create (Ctx)),
              others => <>));
         overriding
         function Current (This : in out Node) return Value is
         begin
            return (
                    A => A_Holders.Reference (This.A).Current,
                    B => B_Holders.Reference (This.B).Current,
                    C => C_Holders.Reference (This.C).Current,
                    D => D_Holders.Reference (This.D).Current,
                    E => E_Holders.Reference (This.E).Current,
                    F => F_Holders.Reference (This.F).Current,
                    G => G_Holders.Reference (This.G).Current,
                    H => H_Holders.Reference (This.H).Current,
                    I => I_Holders.Reference (This.I).Current,
                    J => J_Holders.Reference (This.J).Current);
         end Current;
         overriding
         function Simplify (This : in out Node) return Boolean is
         begin
            if (case This.Shrinker is
                   when A => A_Holders.Reference (This.A).Simplify,
                   when B => B_Holders.Reference (This.B).Simplify,
                   when C => C_Holders.Reference (This.C).Simplify,
                   when D => D_Holders.Reference (This.D).Simplify,
                   when E => E_Holders.Reference (This.E).Simplify,
                   when F => F_Holders.Reference (This.F).Simplify,
                   when G => G_Holders.Reference (This.G).Simplify,
                   when H => H_Holders.Reference (This.H).Simplify,
                   when I => I_Holders.Reference (This.I).Simplify,
                   when J => J_Holders.Reference (This.J).Simplify)
            then
               This.Prev_Shrinker := This.Shrinker;
               return True;
            else
               if This.Shrinker /= Valid_Options'Last then
                  This.Shrinker := Valid_Options'Succ (This.Shrinker);
                  return Simplify (This);
               else
                  return False;
               end if;
            end if;
         end Simplify;
         overriding
         function Complicate (This : in out Node) return Boolean is
         begin
            if (case This.Prev_Shrinker is
                   when A => A_Holders.Reference (This.A).Complicate,
                   when B => B_Holders.Reference (This.B).Complicate,
                   when C => C_Holders.Reference (This.C).Complicate,
                   when D => D_Holders.Reference (This.D).Complicate,
                   when E => E_Holders.Reference (This.E).Complicate,
                   when F => F_Holders.Reference (This.F).Complicate,
                   when G => G_Holders.Reference (This.G).Complicate,
                   when H => H_Holders.Reference (This.H).Complicate,
                   when I => I_Holders.Reference (This.I).Complicate,
                   when J => J_Holders.Reference (This.J).Complicate,
                   when None => False)
            then
               This.Shrinker := This.Prev_Shrinker;
               return True;
            else
               This.Prev_Shrinker := None;
               return False;
            end if;
         end Complicate;
      end Impl;
   end Tuple_10;
end Strategy.Tuples;
