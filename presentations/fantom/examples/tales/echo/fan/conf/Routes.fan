using tales
class Routes
{
  Str favIcon := "/res/images/favicon.ico"

  Route[] routes := Route[
    Route{map="/echo/.*"; to = "Echo"},      
    Route{map="/"; to = "Index"}
  ]

}


