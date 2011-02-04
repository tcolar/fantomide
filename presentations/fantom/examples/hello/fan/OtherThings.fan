// To change this License template, choose Tools / Templates
// and edit Licenses / FanDefaultLicense.txt
//
// History:
//   31-Jan-2011 thibautc Creation
//
using fwt

**
** Various other examples
**
class OtherThings
{
  ** Statements examples
  Void statements()
  {
    // semicolumns are optional. statements can end with a newline a semi or }
    Str s1 := "str 1" // assignment uses :=
    s2 := "s2 and $s1" //inferred assignment with interpolation
    
    while (s1.size <= 5) // while loop
        s1 += " "  // single statment doesn't need curlies
    
    for (i:=0; i<4; ++i) // for loop
    {
        if (i == 2) continue //continue
        echo(i)
        if (i == 3) break   // break
    }  
            
    switch (s1) // switch example (Int, Enum values or any other type(equals) can be used)
    {
      case "str 1":
        echo("case 1") // no fall-through / no "break" needed
      case "str2":
      case "str3": // grouped "case" 
        echo("case 2")
      default: // default if no matches
        echo("default")
    }                   
  }  
  
  ** Exception handling examples
  Void exceptions()
  {
      // try/catch/finaly example
      Int? a  
      try
          s := a + 2
      catch(NullErr npe)
          echo("Catched NPE")
      catch(Err e)
          e.trace    // dump trace to system out, can also use a log file 
      finally
          echo("Done")     
          
      throw IndexErr("Index error")  // exception throwing        
  }    
              
  ** Expressions examples  
  Void operators()
  {
    a := 1 + 2 // + - * / % ++ --
    b := a == 3 // == != <= >=   
    c := (Num) a // cast
    d := 2 > 1 ? true : false // ternary    
            
    // Fantom specific         
    j := a <=> 5 // compare method       
    k := "Hello" === "Hello" // !==   -> same in memory, not equals    
    l := (a is Int) // is, isnot
    m := (a as Num) // cast
    n := 0..3 // 0..<3   -> range    
    p := 2 > 1 ? true : throw ArgErr("Broken math!") // ternary with throw
            
    Int? nullable
    [Str:Int]? map := ["john":1, "mike":2]    
    Str hello := "Hello"
                    
    q := nullable ?: 5 // (Elvis op) same as:   q = nullable != null ? nullable : 5  
    r := nullable ?: throw ArgErr("nullable is null !")   // Elvis op with throw()
            
    s := map?.get("bob")?.abs // safe invoke ... s would be a null Int
    t := map?->get("bob")?->abs // safe dynamic invoke
        
    u := map["john"] // indexing operator, calls get() can also do map["john"] = 3
    v := hello[0..2] // range operator, calls getRange() -> would get "hel", can use negative values
        
    w := Version("3.2") // Serilaization -> equivalent to Version.fromStr(3.2). Note: static fromStr takes precedence over make(str)
        
    // itBlock
    address := Address
    {
      it.street = "123 Happy Lane"
      city   = "Houston"
      state  = "TX"
    }
        
    /*
    Comma operator -> it.add()    
    Note the comma operator chains the calls to add, therefore the add method must be annotated with the @Operator facet and return the chainable type This.
    */        
    win := Window{ Button{text="Ok"}, Button{text="Cancel"}, } // add method
  }                                      
}

class Address
{
  Str street := ""
  Str city := "N/A"  
  Str? state
}


