using tales

class Formats{
	Format[] formats := Format[
		/*
			- Name uniquely identifies a format
			- Exension serves two purpose
				a) To pick the default view name (which is TypeName.{extension})
				b) To auto idenitfy the format fromt he url
			- Content type is the set of allowed MIME type for this format
			- FormmatAs can be any of the following
				a) html - If the output needs to be processed as HTML (using talesId for templating)
				b) xml  - If the output needs to be processed as XML (using talesId for templating)
				c) text - If the output needs to be processed as Text(using mustache for templating)
				d) File - If the output is an binary file 
				e) objToJson - Auto formats the return object as json
		*/
		Format{name="html"; extension = "html"; contentType= ["text/html"]; formatAs = FormatAS.html},
		Format{name="xml"; extension = "xml";  contentType= ["application/xml"];  formatAs = FormatAS.xml},
		Format{name="xhtml"; extension = "html";  contentType= ["application/xhtml", "application/xhtml+xml"];  formatAs = FormatAS.html},
		Format{name="text"; extension = "txt";  contentType= ["text/plain"];  formatAs = FormatAS.text},
		Format{name="javascript"; extension = "json";  contentType= ["text/javascript"];  formatAs = FormatAS.text},
		Format{name="json"; extension = "json";  contentType= ["application/json"];  formatAs = FormatAS.text},
		Format{name="csv"; extension = "csv";  contentType= ["text/csv"];  formatAs = FormatAS.text},
		Format{name="objToJson"; extension = "js"; contentType = ["application/json"]; formatAs = FormatAS.objToJson},
		Format{name="pdf"; extension = "pdf"; contentType = ["application/pdf"]; formatAs = FormatAS.file}
	]
}