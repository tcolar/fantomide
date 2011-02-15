using tales

@Serializable
class Echo : Page
{
  // domReady() is called when the page loads
  @jscript
  Void domReady()
  { 
    client<|
      $("#echo").click(function(){
        current.say();
      });
    |>
  }

  // annotated with "@jscript". This means that this method is both a server and client method.   
  @jscript
  Void say()
  {
    client<|
      //Client code written in javascript      
      params["text"] = $("#input").val();
    |>
    server{
      //Server code written in fantom	
      params["output"] = "You said " + params["text"] + " at " 
      + DateTime.now.toLocale("hh:mm a")
    }
    client<|
      $("#output").text(params["output"]);
    |>
  }
  Void startMarkup()
  {
  }
}