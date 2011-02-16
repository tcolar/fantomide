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


class EnvExample
{
  /*
  in build.fan:
  index = [myPod.myProp": "some value]
  */
  Void main()
  {
    prop := Env.cur.index("mypod.myProp")
  }
}

class NamingExample
{
  Void main()
  {
    File f := `file:/dir/file.txt`.get
    f2 := File(`fan://hello/res/file.txt`)
  }
}

class LoggingExample
{
  // custom logger
  const static Log log := Log.get("mylog")
  
  Void main()
  {
    // Use standard default logger
    Pod.of(this).log.err("...")
    // Use cutom logger
    log.warn("error", Err())
    // find log
    Log.find("mylog").debug("dbg")
    // Custom handler
    Log.addHandler |entry| { echo("My Handler: $entry") }
  }
}

class LocalizationExample
{
  Void main()
  {
    // will lookup into locale/*.props files. (ex: en-US.props))
    pod := Pod.of(this)
    ok := pod.locale("ok")
    // locale interpolation
    hello := "$<hello> Bob"
    // locale interpolation with default value
    frenchHello := "$<hello=bonjour> Bob"
  }
}

class DateExamples
{
  Void main()
  {
    d := DateTime.now
    echo("$d.day $d.month $d.year | $d.hour $d.min | $d.tz") // 9 sep 2010 | 8 58 | Los_Angeles
    echo("$d.date | $d.time") // 2010-09-09 | 08:58:54.668
    echo(DateTime.now) // 2010-09-09T09:00:41.09-04:00 Los_Angeles
    echo(DateTime.nowUtc) // 2010-09-09T10:00:41.106Z UTC
    echo(DateTime.now.toTimeZone(TimeZone("Taipei"))) // 2010-09-09T18:00:41.09+08:00 Taipei
    
    // Localization
    DateTime.now.toLocale("kk:mmaa")              //  09:10am
    DateTime.now.toLocale("DDD 'of' MMMM, YYYY")  //  9th of September, 2010
    
    // TZ alias:
    TimeZone("Asia/Saigon")  //  Asia/Ho_Chi_Minh
  }
  
  ** relative timezone - use to compare time ignoring the timezone.
  Void relativeTz()
  {
    pattern := "DD-MM-YYYY hh:mm zzz"
    a := DateTime.fromLocale("01-09-2010 03:00 Los_Angeles", pattern)
    b := DateTime.fromLocale("01-09-2010 03:00 Chicago", pattern)
    echo("$a ?= $b => ${a==b}") 
    // --> 2010-09-01T03:00:00-07:00 Los_Angeles ?= 2010-09-01T03:00:00-05:00 Chicago => false
    a = a.toRel // special "relative" timezone
    b = b.toRel// special "relative" timezone
    echo("$a ?= $b => ${a==b}") 
    // --> 2010-09-01T03:00:00Z Rel ?= 2010-09-01T03:00:00Z Rel => true
  }
}