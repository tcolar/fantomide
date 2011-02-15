using concurrent

** Actor Example
** We have several shooters all sending pucks at a goalie (at the same time !)
** As soon as a shooter has scored 3 goals, he stops
** 
** Note: Echo() output can get "scrambled" as it's not synchronized (Logger would work best)
class HockeyActorExample
{
  Void main()
  {
    pool := ActorPool()
    goalie := Goalie(pool)
    f1 :=Shooter(pool, "Wayne", goalie).send(null)
    f2 := Shooter(pool, "Mario", goalie).send(null)
    f3 := Shooter(pool, "Goardie", goalie).send(null)
    
    // Wait for shooters to be done and see how many shots they fired
    s1 := f1.get(null) as Int
    s2 := f2.get(null) as Int
    s3 := f3.get(null) as Int
    
    shots := s1 + s2 + s3    
    echo("## The goalie saved ${shots - 9} out of $shots shots.")
  }
}

** Puck const class: It's the "message" sent from the shooter to the goalie
const class Puck
{
  const Str thrownBy
  const Int number  
  
  new make(Str sender, Int nb) 
  {
    thrownBy = sender
    number = nb
  }
}
** A Shooter, shoots pucks until scoring 3
const class Shooter : Actor
{
  const Str name
  const Goalie goalie
  const Str shotsHandle
  const Str goalsHandle
  
  new make(ActorPool pool, Str name, Actor goalie) : super(pool) 
  {
    this.name = name
    this.goalie = goalie
    shotsHandle = "Shooter.shots."+name
    goalsHandle = "Shooter.goals."+name
  }
  
  override Obj? receive(Obj? msg)
  {    
    while(Actor.locals[goalsHandle] != 3)
    {
      shots := Actor.locals[shotsHandle] as Int ?: 0
      goals := Actor.locals[goalsHandle] as Int ?: 0
      Actor.locals[shotsHandle] = shots + 1
      puck := Puck(name, shots + 1)
      goal := goalie.send(puck).get(null)
      if(goal)
      {
        Actor.locals[goalsHandle] = goals + 1
        echo("Goal scored by $name on shot #"+(shots + 1))
      }
      // random pause between shots
      pause := Int.random(5..50).toStr + "ms"
      Actor.sleep( Duration(pause))      
    }
    echo("$name done: 3 goals on ${Actor.locals[shotsHandle]} shots")
    return Actor.locals[shotsHandle]
  }
}

** The goalie who stops ~90% of pucks (random)
const class Goalie : Actor
{
  const Str handle := "Goalie.saves.counter"
  
  new make(ActorPool pool) : super(pool) {}
  
  override Obj? receive(Obj? msg)
  {
    id := Actor.locals[handle] as Int ?: 0
    Actor.locals[handle]  = id + 1
    puck := msg as Puck
    saved := Int.random(0..100) <= 90
    if(saved)
      echo("Stopped puck #$id sent by ${puck.thrownBy} (#${puck.number})")  
    return ! saved
  }
}