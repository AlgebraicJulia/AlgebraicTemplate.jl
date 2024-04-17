""" Some description of this package
"""
module AlgebraicTemplate

export hello

using Catlab

# refer to this module for self-documenting functions
include("Xdoc.jl")


""" hello(name::String)

Returns the string "Hello, <name>!" where `<name>` is replaced with the provided parameter
"""
hello(name::String) = string("Hello, ", name, "!")

end
