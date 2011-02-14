// seralization examples

@Serializable
const class Rec
{
  new make(|This| f)
  {
    f(this)
    if (id <= 0) 
      throw ArgErr("id <= 0")
  }
  const Int id
}

class SerExample
{
  Void main()
  {  
    obj1 := "Rec { id = 3 }".in.readObj 
    // will fail, as id must be provided (const))
    obj2 := "Rec {}".in.readObj  
  }
}