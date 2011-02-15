using tales

class Main 
{
   Void main(Str[] args)
   {
		Int port := 80
		if(args.size >0){
			port = args[0].toInt
		}
		args = Str[,]
		
		Str? podName 
		
		if(typeof->sourceFile == "Main.fan"){
			podName = this.typeof.pod.name
		}
		else{
			File f := File( (typeof->sourceFile)->toUri)
			podName = f.parent.parent.name
		}
		
		tales::Run.start(typeof->sourceFile, podName, port)
   }
}

