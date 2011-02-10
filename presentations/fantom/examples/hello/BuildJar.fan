using build

**
** Build the fantom code as a standalone jar
** 
** Example of use:
** java -jar /home/thibautc/NetBeansProjects/fantomide/presentations/fantom/examples/hello/hello.jar \
** -Dfan.home=/home/thibautc/apps/fantom-1.0.57/ -Dfan.jardist=true 
**
class BuildJar : BuildScript
{
  
  @Target { help = "Build pod as a single Jar" }
  Void distJar()
  {
    builder := JarDist(this)
    builder.outFile = `./hello.jar`.toFile.normalize
    builder.podNames = Str["hello","sql","fwt","email", "concurrent", "gfx", "inet"]
    builder.mainMethod = "hello::Main.main"
    builder.run
  }
}