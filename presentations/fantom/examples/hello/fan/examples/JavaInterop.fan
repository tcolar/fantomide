// Java Interopability examples

// importing java.regex.*
using [java] java.util.regex 
// importing java.io.FileFilter
using [java] java.io::FileFilter
// importing java.io.File under the name JFile (avoids ambiguity with sys::File)
using [java] java.io::File as JFile
// annotation
using [java] java.lang::SuppressWarnings

** ** Using a java API
class UsingJavaRegex
{

  Void example()
  {
    // Using java pattern class
    Pattern wordPattern := Pattern.compile(Str<|\w+|>)
    matcher := wordPattern.matcher("I am using Fantom from Java")
    while(matcher.find) 
      echo(matcher.group)
      
    // can make use of dynamic calls too
    matcher->reset
  } 
}

** Subclassing a Java class
class SubJavaClass : JFile
{
  new make(Uri uri) : super(uri.pathStr) 
  {
    echo("New File: $uri.pathStr")
  }
}

** Implementing a java interface
class FanFilesLister
{
    @SuppressWarnings{} // Java annotation (dummy example))
    Void example()
    {
	folder := File(`/tmp/`)
        dir := JFile(folder.pathStr)
        JFile[] files := dir.listFiles(FilterImpl());
        // We can take advantage of the "real" Fantom List(instead of Java primitive list)
        files.each { echo(it.getName()) }
    }
}

internal class FilterImpl : FileFilter
{
    // Note that we use "JFIle?"  because all mapped java types are nullable (Example String[] -> Str?[]?)
    override Bool accept(JFile? f)
    {
        f.getName.endsWith(".fan")
    }
}

/*
=================== Primitives mapping ====================================
byte    sys::Int
short   sys::Int
char    sys::Int
int     sys::Int
long    sys::Int
float   sys::Float

=================== Interop summary =======================================
Java Type            Fantom Type
-----------          -----------
foo.bar.Baz          [java]foo.bar::Baz
boolean              sys::Bool
byte                 sys::Int
short                sys::Int
char                 sys::Int
int                  sys::Int
long                 sys::Int
float                sys::Float
double               sys::Float
java.lang.Object     sys::Obj
java.lang.String     sys::Str
java.lang.Boolean    sys::Bool?
java.lang.Long       sys::Int?
java.lang.Double     sys::Float?
java.math.BigDecimal sys::Decimal
Foo[]                Foo[]  // sys::List parameterized with Foo
boolean[]            [java]fanx.interop::BooleanArray
byte[]               [java]fanx.interop::ByteArray
short[]              [java]fanx.interop::ShortArray
char[]               [java]fanx.interop::CharArray
int[]                [java]fanx.interop::IntArray
long[]               [java]fanx.interop::LongArray
float[]              [java]fanx.interop::FloatArray
double[]             [java]fanx.interop::DoubleArray
Foo[][]             // unsupported for both primitivies and Objects
*/