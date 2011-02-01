// To change this License template, choose Tools / Templates
// and edit Licenses / FanDefaultLicense.txt
//
// History:
//   31-Jan-2011 thibautc Creation
//

**
** Various other examples
**
class OtherThings
{
    ** Field with manual getter/setter
    Int id := 0
    {
      get { echo("get id"); return &id }
      set { echo("set id"); &id = it }
    }
}