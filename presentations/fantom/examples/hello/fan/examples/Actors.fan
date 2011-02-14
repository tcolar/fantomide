using concurrent

//Actors examples
class Actors
{
  Void main()
  {  // pass receive to constructor as a closure function
    actor := Actor(ActorPool()) |Int msg->Int| { msg + 1 }
  }
}

** Actor class (override receive)
const class IncrActor : Actor
{
  new make(ActorPool p) : super(p) {}
  override Obj? receive(Obj? msg) { msg->increment }
}

class ActorCalls
{
  Void main()
  {
    // send now
    //IncrActor().send(2)
    // send in 10ms
    //Future f := IncrActor().sendLater("10ms", 5)
    // send after f is processed
    //IncrActor().sendWhenDone(f, 7)
  }
}