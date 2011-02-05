using build

class Build : BuildPod
{
  new make()
  {
    podName = "hello"
    summary = "hello world example"
    depends = ["sys 1.0+", "sql 1.0", "fwt 1.0", "email 1.0"]
    srcDirs = [`fan/`, `test/`, `fan/examples/`]
    javaDirs = [`java/`]
  }
}