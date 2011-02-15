using tales

@jscript
class BlogScript : Script{
	@inject Script? validations
	
	
	Void clearBlogFields(){
		client<|
			$("#blog-sub").val('');
			$("#blog-msg").val('');
		|>
	}
	
	Void clearCommentFields(){
		client<|
			$("#comment-text").val("");
		|>
	}
	
	
	Bool? validateBlog(Str? title, Str? text){
		client<|
			return validations.notEmpty(title) && 
					validations.notEmpty(text) &&
				 	validations.lessThan(title, 40) && 
					validations.lessThan(text, 2000)
		|>
		return null 
	}
	
	
	Bool? validateBlogObject(Blog? blog){
		client<|
			return this.validateBlog(blog.subject, blog.text)
		|>
		
		return null
	}
	
}