mixin BlogService
{
	abstract Blog addBlog(Blog blog)
	abstract Comment addComment(Str comment, Int blogId)
}
