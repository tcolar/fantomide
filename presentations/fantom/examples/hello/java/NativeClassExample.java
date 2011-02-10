package fan.hello;


import fan.sys.FanObj;
import fan.sys.Type;

/**
 * Fantom Native class java implementation example
 * @author thibautc
 */
public class NativeClassExample extends FanObj
{
  // constructor factory called by Foo.make
  public static NativeClassExample make(String arg)
  {
    NativeClassExample self = new NativeClassExample ();
    make$(self, arg);
    return self;
  }

  // constructor implementation called by subclasses
  public static void make$(NativeClassExample self, String arg) {}

  // boiler plate for reflection
    @Override
  public Type typeof()
  {
    if (type == null) type = Type.find("hello::NativeClassExample");
    return type;
  }
  private static Type type;

  // methods
  public long add(long a, long b) { return a + b; }

  // mutable field
  public String a() { return a; }
  public void a(String it) { a = it; }
  private String a;

  // const field
  public String b = "const";
}
