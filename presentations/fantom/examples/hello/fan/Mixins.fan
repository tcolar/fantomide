**
** Mixin Example
**
mixin Audio
{
  abstract Int volume
  Void incrementVolume() { volume += 1 }
  Void decrementVolume() { volume -= 1 }
  ** Return impl. description
  abstract Str description()
}

class Television : Audio
{
  override Int volume := 0
  override Str description() { return "I'm a TV!" } // return optional
}
