using fwt

**
** Closures examples
**
class Closures
{
  Void example()
  {
    Str s := "hello World"
    //Str.any(|Int char, Int index-> Bool| c) -> Return true if c returns true for any of the characters in this string.
    hasD := s.any(|Int char -> Bool| { return char == 'd'})
    hasD = s.any() |Int char -> Bool| { return char == 'd'} // simplified
    hasD = s.any |char| { return char == 'd'} // simplified more, and inference
  }
  
  Void arity()
  {
    // arity   str.each -> Void each(|Int ch, Int index| c)
    // Don't have to use all the parameters
    "Hello".each |Int char, Int index| { echo("$index => $char") }
    "Hello".each |char| { echo(char) }
  }
  
  ** Examples of nice closure use in API's
  Void apiExamples()
  {     
    5.times { echo("Hello #$it") } // Hello #0 to Hello #4
    
    // List.findAll (findAll(|V item, Int index->Bool| c)) -> Return a new list containing the items for which c returns true 
    odds := [1, 2, 3, 4, 5].findAll |val| { val.isOdd }
    
    // File.eachLine -> Read the entire stream into Str lines. This InStream is guaranteed to be closed upon return.
    f := File(`/tmp/dummyFile.txt`)
    f.eachLine |line| { echo(line) }
    
    // Example where the return value is used
    m := ["2":2, "3":3, "4":4]
    // Map.reduce : Iterates through every value in the map to reduce the map into a single value.
    // The initial value of the reduction is passed in as the init parameter, 
    // then passed back to the closure along with each item. 
    total := m.reduce(100) |Obj r, Int v->Obj| // would get 109
    { 
      echo("Adding: $v"); return (Int)r + v 
    }  
  }

  ** Closure Variables binding examples  
  Void varBinding()
  {
    
    counter := 0 // all closures in this scope can bind this var.
    f := |->Int| { return ++counter }
    f(); f(); f() 
    echo(counter) // 3
    g := |->Int| { return --counter }
    g(); g(); g()
    echo(counter) // 0
    
    //When a closure binds to a local variable in its outer scope, that variable lives as long as the closure lives
    // allows closures to store their own state between invocations.
    f2 := createFunc() 
    echo(f2()); echo(f2()); echo(f2()) //1,2,3
  }
  
  Func createFunc()
  {
    counter := 0; return |->Int| { return ++counter }
  }  
  
  Void itBlocks()
  {
    // An it-block can be used whenever a single parameter function is expected
    ["a","b","c"].each { echo(it.upper) }
    ["a","b","c"].each { echo(upper) } // implicit use of it

  
    // Special "This" method parameter
    // fwt::Button signature : new make(|This| f) { f(this) }
    oldSchool := Button() // old school
    oldSchool.text = "Button1"
    oldSchool.selected = true
    Window
    {
        add( oldSchool )
        add( Button { it.text = "Easier"} ) 
        Button {it.text = "Easiest"}, // itBlock plus "itAdd" operator (comma))
        Button 
        {
           text = "Exit" // implied "it""
           onAction.add |->| { Env.cur.exit } // use of closure
        },          
    }.open    
  }

  Void withBlocks()
  {
    // when itBlock passed to a method not waiting for one, then "with" method is called
    // Obj.with: just applies the function and returns it.
    // The itBlock opens a new scope can be used for declarative programming.
    list := Str[,].with { fill("x", 3) }
    list2 := Str[,] { fill("x", 3) } // implicit call to with
  }  
}