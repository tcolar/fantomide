using tales

@jscript
class Validations : Script{
	Bool? lessThan(Str? text, Int? val){
		client<|
			if(! text){
				return false;
			}
			else{
				return text.length < val;
			}
		|>
		
		return null
	} 
	
	Bool? notEmpty(Str? text){
		client<|
			if(! text){
				return false
			}
			return (text.length != 0)
		|>
		return null
	}
}