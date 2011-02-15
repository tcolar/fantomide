using tales

@JSFiles{
	fromModels = [Blog#]
}
class Index : Page{
	
	@inject BlogService? blogService
	@inject Script? blogScript
	
	Void startMarkup(Format format, [Str:Obj] params ){
		Blog[]? blogs := Blog{}.list
		add(repeater->blogs(blogs)|Blog blog|{
			addBlogRow(blog)
		})
	}

	Void addBlogRow(Blog blog){ 
		add(label->name(blog.subject){
			attr->href("/blog/$blog.id")
		})
	}
	

	@jscript
	Void addBlog(){
		client<|
			var blog = new Blog();
			blog.subject = $("#blog-sub").val();
			blog.text = $("#blog-msg").val();
			
			blogScript.validateBlogObject(blog)
			params["blog"] = blog;
		|>
		server{
			Blog blog := params["blog"]
			blog = blogService.addBlog(blog)
			
			params["html"] = htmlFor(markup->blogs{
								addBlogRow(blog)
							})
		}
		client<|
			$("#allblogs").append($(params["html"]));
			blogScript.clearBlogFields();
		|>
	}

	
}



