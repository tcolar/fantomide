**
** Functions examples
**
class Functions
{
  Void example()
  {
    func1 := |Int a, Int b->Int| {a+b}  // function that takes two Int and return an Int
    
    a := func1.callList([2,3]) //  5
    b := func1.call(2,3) //  5
    c := func1(2,3) // 5
    
    func2 := func1.bind([3]) // [Int->Int]
    p := func2(2) // 5
      
    // function parameters
    func3 := |Str s->Void| {echo("** $s **")}
    executor(func3, ["Hello"]) //  ** Hello **

    executor(Obj#.method("echo").func, ["Hello"]) // Hello     
  }

  Void executor(Func func, Obj[] params)
  {
      echo("... Starting execution")
      func.call(params)  
      echo("... Stopping execution")
  }
  
  Void hello()
  {
    echo("Hello")
  }
  
  Void funcParam(Int i, |Str->Int| func) {}
  
  Void arityExample()
  {
    // signature of Map.each: Void each(|V value, K key| c)
    map := ["Tom::42"] 
    // iterate with function that only accepts value
    map.each |Obj value| { echo(value) }
    // or iterate with function that accepts both value and key
    map.each |Obj value, Obj key| { echo("$key = $value") }
  }
  
  Void exampleInstanceParams()
  {
    m := Str#replace
    f := m.func
    m.params// [sys::Str from, sys::Str to]
    f.params// [sys::Str this, sys::Str from, sys::Str to]
    // call as a method on instance
    s1 := "hi!".replace("hi", "hello")
    // call the function, passing an instance
    s2 := f("hi!", "hi", "hello")
  }
  
}