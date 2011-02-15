using tales

@Table{name="comments"}
class Comment : Entity{
	Int? id
	Int? blogId
	
	@Column{name="text"}
	Str? comment
}