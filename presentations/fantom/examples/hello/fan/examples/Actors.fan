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
    pool := ActorPool()
    actor := IncrActor(pool)
    // send now
    actor.send(2)
    // send in 10ms
    Future f := actor.sendLater(10ms, 5)
    // send after f is processed
    f2 := actor.sendWhenDone(f, 7)
    // get return value (blocking))
    val := f.get(null)
    // try to cancel f2, if not yet processed
    f2.cancel
    // stop the pool (won't accept any more messages)
    pool.stop
  }
}