// JavaScript examples
using fwt
using gfx
using util::AbstractMain
using wisp
using webmod
using web

@Js
class Js1 : Window
{
  new make() : super(null, null)
  {
    content = Label { text = "Hello World - FWT compiled into JavaScript!"; it.bg = Color("#ccf") }
  }

  Void main()
  {
    open
  }
}

class JsServer : AbstractMain
{
  Int port := 8080

  override Int run()
  {
    wisp := WispService
    {
      it.port = this.port
      it.root = JsServerMod(homeDir)
    }
    return runServices([wisp])
  }
}

const class JsServerMod : WebMod
{
  new make(File dir) { scriptDir = dir }

  const File scriptDir

  override Void onGet()
  {
    name := req.modRel.path.first
    if (name == "pod")
      onPodFile
    else
      onIndex
  }

  override Void onPost()
  {
    onGet
  }

  Void onIndex()
  {
    res.headers["Content-Type"] = "text/html; charset=utf-8"
    out := res.out
    out.docType
    out.html
    out.head
    out.title.w("My Page").titleEnd
    out.includeJs(`/pod/sys/sys.js`)
    out.includeJs(`/pod/concurrent/concurrent.js`)
    out.includeJs(`/pod/web/web.js`)
    out.includeJs(`/pod/gfx/gfx.js`)
    out.includeJs(`/pod/dom/dom.js`)
    out.includeJs(`/pod/fwt/fwt.js`)
    out.includeJs(`/pod/hello/hello.js`)
    WebUtil.jsMain(out, "hello::Js1")
    out.headEnd
    out.body    
    out.bodyEnd
    out.htmlEnd
  }

  Void onPodFile()
  {
    // serve up pod resources
    File file := ("fan://" + req.uri[1..-1]).toUri.get
    if (!file.exists) { res.sendErr(404); return }
      FileWeblet(file).onService
  }
}