**
** Class examples
**
class Class1
{
}

class Class2 : Class1/*, Audio*/
{
    
}

class Class3
{
    Void main()
    {  
        // Example of Using Type reflection  
        Type t := Class1#  
        t.make  // use default make constructor
    }
}