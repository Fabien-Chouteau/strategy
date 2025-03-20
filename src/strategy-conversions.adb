package body Strategy.Conversions is

   package body Def_Convert is
      package body Impl is
         function Create (Ctx : in out Runner_Context'Class) return Node is
           ((Parent with Input => To_Holder (Input_Strat.Create (Ctx))));
         overriding function Current
           (This : in out Node) return Output_VT.Value is
           (Convert (Reference (This.Input).Current));
         overriding function Simplify (This : in out Node) return Boolean is
           (Reference (This.Input).Simplify);
         overriding function Complicate (This : in out Node) return Boolean is
           (Reference (This.Input).Simplify);
      end Impl;
   end Def_Convert;

   package body Indef_Convert is
      package body Impl is
         function Create (Ctx : in out Runner_Context'Class) return Node is
           ((Parent with Input => To_Holder (Input_Strat.Create (Ctx))));
         overriding function Current
           (This : in out Node) return Output_VT.Value is
           (Convert (Reference (This.Input).Current));
         overriding function Simplify (This : in out Node) return Boolean is
           (Reference (This.Input).Simplify);
         overriding function Complicate (This : in out Node) return Boolean is
           (Reference (This.Input).Simplify);
      end Impl;
   end Indef_Convert;

   package body Def_Indef_Convert is
      package body Impl is
         function Create (Ctx : in out Runner_Context'Class) return Node is
           ((Parent with Input => To_Holder (Input_Strat.Create (Ctx))));
         overriding function Current
           (This : in out Node) return Output_VT.Value is
           (Convert (Reference (This.Input).Current));
         overriding function Simplify (This : in out Node) return Boolean is
           (Reference (This.Input).Simplify);
         overriding function Complicate (This : in out Node) return Boolean is
           (Reference (This.Input).Simplify);
      end Impl;
   end Def_Indef_Convert;

   package body Indef_Def_Convert is
      package body Impl is
         function Create (Ctx : in out Runner_Context'Class) return Node is
           ((Parent with Input => To_Holder (Input_Strat.Create (Ctx))));
         overriding function Current
           (This : in out Node) return Output_VT.Value is
           (Convert (Reference (This.Input).Current));
         overriding function Simplify (This : in out Node) return Boolean is
           (Reference (This.Input).Simplify);
         overriding function Complicate (This : in out Node) return Boolean is
           (Reference (This.Input).Simplify);
      end Impl;
   end Indef_Def_Convert;

end Strategy.Conversions;
