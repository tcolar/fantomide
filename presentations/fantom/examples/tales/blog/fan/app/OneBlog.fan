using tales

@JSFiles{
	fromModels = [Blog#]
}
class OneBlog : Page{
	@inject Sqls? blogSql 
	@inject BlogService? blogService
	@inject Script? blogScript
	
	@inject PageMap? pageMap
	
	Int? id{ 
			set {
					if(pageMap != null){
						pageMap["OneBlog.id"] = it;
					}
				} 
				get{
					if(pageMap != null){
						Int? val := pageMap["OneBlog.id"]
						return val == null?null:val
					}
					else{
						return null
					}
				}
		  }
	
	
	
	Void index(Int? id){
		this.id = id
		
		Blog blog := Blog{it.id = id}.one
		blog.comments = Comment{}.queryList(blogSql->getComments, ["blogid": blog.id])
		
		add(label->title("Blog - $blog.subject"))
		add(label->blogsub("$blog.subject"))
		add(label->text("$blog.text"))

		add(repeater->comment(blog.comments)|Comment comment|{
			addCommentRow(comment)
		})
		
		
	}

	
	Void addCommentRow(Comment comment){  //Same code reused to add ajax row.
		add(label->text(comment.comment))
	}
	
	
	@jscript
	Void addComment(){
		client<|
			params["comment"] = $("#comment-text").val();
		|>
		server{
			Comment comment := blogService.addComment(params["comment"], this.id)
			
			Str html := htmlFor(markup->comment{
								addCommentRow(comment)
							})
			params["html"] = html
		}
		client<|
			$("#allcomments").append($(params["html"]));
			blogScript.clearCommentFields();
		|>
	}
}