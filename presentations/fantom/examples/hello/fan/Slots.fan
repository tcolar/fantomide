using sql

**
** Slots examples
**
abstract class MyUser
{
  ** Fields
  Int age := 23 // field
  Bool? isInactive  // nullable field
  Str name // not null, will need to be assigned in ctor
  Str[] aliases := [,] // list of Str
  
  ** Field with manual getter/setter
  Int id := 0
  {
    get { echo("get id"); return &id }
    set { echo("set id"); &id = it } // using field storage
  }
  
  ** Method
  Void hello()  { echo("Hello") }

  ** Method with defaulted params
  Void hello2(Str first, Str last:="", Str middle:="")  
  { 
    echo("Hello $first $middle $last") 
  }
  
  ** static method
  static Int add(Int a, Int b) { return a + b } // return optional when only one statement
  
  ** special "This" return type, allows method chaining like s := slots().addParam(p1).addParam(p2)....
  This addAlias(Str alias)
  {
    aliases.add(alias)
    return this
  }

  ** abstract method to be impl. by subclass
  abstract Int inplementMe(Str param)
    
  ** Virtual method : Has an implementation but specifically marked as an overridable class (Clean API's)
  virtual Void talk() { echo("Hello") }

  ** Overriding (override keyword)  
  override Str toStr() { "I'm a MyClass impl." }
    
  ** Operator overloading example  (called when using  myClass + Int)
  @Operator MyUser plusInt(Int x) { age+=x ; return this }
  
  ** Once method, automatically lazy-cached in memory !
  once Int expensiveComputation(Int x, Int y) {return x.hash.pow(y.hash)}
  
  ** Method calls
  internal Void methodCalls()
  {
    hello // optional parenthesis if no args
    this.hello   
    hello2("John", "Doe")
    Str? string := "Hello"
    string.capitalize // call
    string?.capitalize // safe call
    string->capitalize // dynamic call
    string?->capitalize // safe dynamic call
  }
  
  ** Constructor
  new make(Str name, Int age:=30) { this.name = name; i := age }
  
  ** Constructor
  new makeFromSql(Row sqlRow) { this.name = sqlRow.col(name) }
  
  Void ctorCalls()
  {
    s := MyUser.make("John Doe") // ctor call
    s2 := MyUser("John Doe", 30) // ctor call shortcut
    s3 := MyUser("John Doe").addAlias("a").addAlias("b")
  }
  
}

** Contsructor chaining examples
class MySubUser : MyUser
{
  new make() : super("Sub User") {/*...*/}
  new makeFromSql(Str sql) : super.makeFromSql(sql) {/*...*/}
  new makeFromObj(Obj obj) : this.makeFromSql(obj.toStr) {/*...*/}
}