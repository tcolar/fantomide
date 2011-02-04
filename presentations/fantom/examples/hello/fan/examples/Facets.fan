// Facets examples

// simple marker facet with no fields
facet class Indexed {}

// struct facet with one or more const fields
facet class Table
{
  // fields must be serializable (A serializable object must support a make constructor which either takes no parameters or takes an it-block)
  const Str name := "" 
  const Bool autoCreate // required
}

// Example of use:
@Indexed
@Table { name = "Employees"; autoCreate = true }
class Employee {}

// Reflection:
class FacetReflection
{
  Str myField := ""
  
  Void example()
  {
    strIsTransient := Str#.hasFacet(Transient#)
    p := 5 //Int
    intIsSerializable := p.typeof.facet(Serializable#, false)
  }
}

// Facet inheritance
@FacetMeta { inherited = true } // Use @FacetMeta
facet class Facet1 {}

@Facet1 class class1 {}
class class2 : class1 {} // will inherit the facet @facet1 from class1