package fan.hello;

/**
 * Peer impl. for NativeExample
 * @author thibautc
 */
public class NativeExamplePeer 
{
  public static NativeExamplePeer make(NativeExamplePeer self) { return new NativeExamplePeer(); }

  // instance methods always take implicit self
  public String a(NativeExamplePeer self, boolean x) { return "a"; }

  // static methods are just normal statics with matching signatures
  public static void b(long x) {}
}
