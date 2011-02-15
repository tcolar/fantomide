using tales

class Binding{
	
	Bind[] bindings := Bind[
		Bind{type=BlogService#; name="blogService"; toType="BlogServiceImpl"},
		Bind{name="blogScript"; toType = "BlogScript"; },
		Bind{name="validations"; toType = "Validations"}
	]
}