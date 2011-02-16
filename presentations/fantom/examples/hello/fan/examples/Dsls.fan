//DSL examples
using compiler

class Dsls
{
  //using bult-in DSL's
  Void builtin()
  {
    s := Str<| some text """ with no worries about quotations etc... \" \' ' " $notAVar 
                Another line 
|>

    Regex r := Regex<||foo|foo/(\d*)||>  
    b := r.matcher("foo").matches
  }
}

** Custom DSL example (Regex)
class CustomRegex : DslPlugin
{
  new make(Compiler c) : super(c) {}

  override Expr compile(DslExpr dsl)
  {
    regexType := ns.resolveType("sys::Regex")
    fromStr := regexType.method("fromStr")
    args := [Expr.makeForLiteral(dsl.loc, ns, dsl.src)]
    return CallExpr.makeWithMethod(dsl.loc, null, fromStr, args)
  }
}