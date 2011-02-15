using tales

@jscript
class Blog : Entity{
	Int? id
	Str? subject
	Str? text
	Comment[]? comments
}