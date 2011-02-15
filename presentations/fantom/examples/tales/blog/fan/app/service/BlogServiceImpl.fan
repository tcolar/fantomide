using tales

@Serializable
class BlogServiceImpl : BlogService{
	override Blog addBlog(Blog blogInfo){
		Blog blog := Blog{
			it.subject = blogInfo.subject
			it.text = blogInfo.text
		}.create
		
		return blog
	}
	
	override Comment addComment(Str text, Int blogId){
		Comment comment := Comment{it.blogId = blogId; it.comment = text}.create
		return comment
	}
}