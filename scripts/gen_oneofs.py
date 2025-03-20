#!/usr/bin/env python3
import os

def gen_spec(num):
    out = ""
    out += "   generic\n"
    out += "      type Value is limited private;\n"
    out += "      with package Value_Tree is new Definite_Value_Tree (Value => Value);\n"
    for x in range(num):
        letter = chr(65 + x)
        out += f"      with package {letter}_Strat is new Definite_Strategy (Value => Value, Value_Tree => Value_Tree, others => <>);\n"

    out += f"   package Just_One_Of_{num} is\n"
    out +=  "      package Impl is\n"
    out +=  "         type Node (<>) is new Value_Tree.Value_Node with private;\n"
    out +=  "         function Create (Ctx : in out Runner_Context'Class) return Node;\n"
    out +=  "      private\n"
    for x in range(num):
        letter = chr(65 + x)
        out += f"         package {letter}_Holders\n"
        out += f"         is new Ada.Containers.Indefinite_Holders ({letter}_Strat.Node, {letter}_Strat.\"=\");\n"

    options = ""
    for x in range(num):
        letter = chr(65 + x)
        end = ", " if x < num - 1 else ""
        options += f"{letter}{end}"
    
    out +=  f"         type Options is ({options});\n"
    out +=  "         subtype Parent is Value_Tree.Value_Node;\n"
    out +=  "         type Node (Pick : Options) is new Parent with record\n"
    out += "            case Pick is\n"
    
    for x in range(num):
        letter = chr(65 + x)
        out += f"            when {letter} => {letter} : aliased {letter}_Holders.Holder;\n"
    out += "            end case;\n"
    out += "         end record;\n"

           
    out += "         overriding\n"
    out += "         function Current (This : in out Node) return Value;\n"
    out += "         overriding\n"
    out += "         function Simplify (This : in out Node) return Boolean;\n"
    out += "         overriding\n"
    out += "         function Complicate (This : in out Node) return Boolean;\n"

    out += "      end Impl;\n"

    out += "      package Strat\n"
    out += "      is new Definite_Strategy (Value, Value_Tree, Impl.Node, Impl.Create);\n"
    out += f"   end Just_One_Of_{num};\n"

    return out


spec  = "with Ada.Containers.Indefinite_Holders;\n"
spec += "pragma Style_Checks (Off);\n"
spec += "package Strategy.One_Of is\n"
for x in range(2, 11):
    spec += gen_spec(x)
spec += "end Strategy.One_Of;\n"

def gen_body(num):
    out = ""
    out += f"   package body Just_One_Of_{num} is\n"
    out +=  "      package body Impl is\n"
    out +=  "         function Create (Ctx : in out Runner_Context'Class) return Node is\n"
    out +=  "            package RNG is new Ada.Numerics.Discrete_Random (Options);\n"
    out +=  "            Gen : RNG.Generator;\n"
    out +=  "            Pick : Options;\n"
    out +=  "         begin\n"
    out +=  "            RNG.Reset (Gen, Ctx.Random_Initiator);\n"
    out +=  "            Pick := RNG.Random (Gen);\n"

    out +=  "            case Pick is\n"
    for x in range(num):
        letter = chr(65 + x)
        out += f"            when {letter} =>\n"
        out +=  "               return (Parent with\n"
        out += f"                       Pick => {letter},\n"
        out += f"                       {letter} => {letter}_Holders.To_Holder ({letter}_Strat.Create (Ctx)));\n"
    out +=  "            end case;\n"
    out +=  "         end Create;\n"
    out +=  "         overriding\n"
    out +=  "         function Current (This : in out Node) return Value is\n"
    out +=  "         begin\n"
    out +=  "            return (case This.Pick is\n"
    for x in range(num):
        letter = chr(65 + x)
        end = "," if x < num - 1 else ");"
        out += f"                       when {letter} => {letter}_Holders.Reference (This.{letter}).Current{end}\n"
    out +=  "         end Current;\n"

    out +=  "         overriding\n"
    out +=  "         function Simplify (This : in out Node) return Boolean is\n"
    out +=  "         begin\n"
    out +=  "            return (case This.Pick is\n"
    for x in range(num):
        letter = chr(65 + x)
        end = "," if x < num - 1 else ");"
        out += f"                       when {letter} => {letter}_Holders.Reference (This.{letter}).Simplify{end}\n"
    out +=  "         end Simplify;\n"

    out +=  "         overriding\n"
    out +=  "         function Complicate (This : in out Node) return Boolean is\n"
    out +=  "         begin\n"
    out +=  "            return (case This.Pick is\n"
    for x in range(num):
        letter = chr(65 + x)
        end = "," if x < num - 1 else ");"
        out += f"                       when {letter} => {letter}_Holders.Reference (This.{letter}).Complicate{end}\n"
    out +=  "         end Complicate;\n"
    out += "      end Impl;\n"
    out += f"   end Just_One_Of_{num};\n"

    return out

body = "with Ada.Numerics.Discrete_Random;\n"
body += "package body Strategy.One_Of is\n"
for x in range(2, 11):
    body += gen_body(x)
body += "end Strategy.One_Of;\n"

src_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "src")

spec_filename = os.path.join(src_dir, "strategy-one_of.ads")
with open(spec_filename, "w", encoding="utf-8") as f:
    print(f"Writing {spec_filename}")
    f.write(spec)
body_filename = os.path.join(src_dir, "strategy-one_of.adb")
with open(body_filename, "w", encoding="utf-8") as f:
    print(f"Writing {body_filename}")
    f.write(body)
