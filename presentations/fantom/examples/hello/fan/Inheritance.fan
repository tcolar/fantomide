
// inheriting examples
using fwt::Button

class SubObj {}
class SubObj2 : Obj {}
class SubObj3 : Button { new make() : super() {} }
class SubObj4 : sys::Obj {}

mixin Mixin1{} 
mixin Mixin2{} 

// class inheritance
class SubClassA : SubObj {} // class
class SubClassB : Mixin1, Mixin2 {} //mixins
class SubClassC : SubObj, Mixin1, Mixin2 {} // class & mixin(s)

// mixin inheritance
mixin MixinA : Mixin1 {}
mixin MixinB : Mixin1, Mixin2 {}


class Super1 : Button
{ 
  new make() : super() {} 
   
  Void echoText() 
  {
    echo(super.text) // super
    echo(Obj.super.toStr) // named super
  }
}