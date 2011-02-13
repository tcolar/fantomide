using docCompiler

** Takes what is in the "examples" folder and create an html version in "html" folder
class ExamplesToHtml
{
  static const File dir := File(`./examples/`)
  static const File dest := File(`./html/`)

  Void main()
  {
    dir.walk |File f| 
    {
      process(f)
    }
  }
  
  Void process(File f)
  {
    path := f.path[1..-1].join("/")      
    if(f.isDir) 
    {
      dest.createDir(path)
    }
    else if(f.ext == "fan")
    {
      html := dest.createFile(path + ".html") 
      in := f.in; out := html.out   
      writeHeader(out, f)
      FanToHtml(in, out).parse
      out.print(htmlFooter)  
      in.close; out.close    
    }
    else
      f.copyTo(dest.createFile(path),["overwrite":true])
  }
  
  Void writeHeader(OutStream out, File f)
  {
    css := "doc.css"
    (f.path.size - 2) .times {css = "../" + css}
    out.print(
"""
   <html xmlns='http://www.w3.org/1999/xhtml'>
   <head> 
     <title>$f.name</title>
     <link rel='stylesheet' type='text/css' href='$css'/>
   </head>
   <body>""")
  }
  
  static const Str htmlFooter := "  </body></html>"
}