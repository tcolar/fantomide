using tales

class Routes
{
    Str favIcon := "/res/images/favicon.ico"

	Route[] routes := Route[
		Route{map="/blog/{id}"; to="OneBlog.index";},
		Route{map="/"; to = "Index"}
	]

}


