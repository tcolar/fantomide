using tales

@Serializable
class BlogSql : Sqls{

	Str getComments :=  sql<|
								select * from comments where blogId = @blogid
	  			         |>
	
}

