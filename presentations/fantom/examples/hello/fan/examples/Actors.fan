using concurrent

//Actors examples
class Actors
{
  Void main()
  {  // pass receive to constructor as a closure function
    actor := Actor(pool) |Int msg->Int| { msg + 1 }
  }
}

** Actor class (override receive)
const class IncrActor : Actor
{
  new make(ActorPool p) : super(p) {}
  override Obj? receive(Obj? msg) { msg->increment }
}