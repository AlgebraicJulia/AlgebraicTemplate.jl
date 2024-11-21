module Xdoc

export @xdoc

using Markdown

function create_xdoc_expr(t)
  name, source, desc, variable, expr = t
  Base.remove_linenums!(expr)

  exprdef = sprint.(Base.show_unquoted, expr.args)
  exprdef = join(map(exprdef) do line; "    $line
                 " end, "\n")

  docstring = Markdown.parse("""

  # $name 
  
  [Source]($source)

  $desc

  ## Model
  
  $exprdef

  """)
  quote
    export $variable
    $variable = $expr
    @doc $docstring $variable
  end
end

""" xdoc pattern

It is generally useful to have ready-at-hand definition of a model, however a natural way of retrieving the definition is by calling the model in the REPL. While human-readable modeling is a design principle in AlgebraicJulia, an expression in the REPL may return information not necessary for a quick overview. Moreover, it should be available through Julia's documentation system.

Decapodes.jl and GATlab.jl both implement a way to specify the documentation for a model at the time of defining it. For GATlab.jl, this is done without the need of a new macro. For Decapodes.jl, we use a `@docapode` macro to specify decapode expressions for models along with their sources, a description about them, and the variable that the model will be bound to.

The "xdoc" pattern mimics the @docapode macro, set with the variable "x" for whichever modeling this package be intended. We define it here for your convenience.

"""
macro xdoc(name, source, desc, variable, expr)
  create_xdoc_expr((name, source, desc, variable, expr)) |> esc
end

@xdoc("Sample Expression"
,"https://github.com/AlgebraicJulia"
,"A sample expression created with an 'Xdoc' pattern. This allows you to bind an expression to a variable while also defining it within its documentation."
,sample_expr
,begin
  foo = 1
  bar = 2

  foobar = foo + bar
end)
  

end
