using Documenter
using DocumenterCitations
using Literate

const literate_dir = joinpath(@__DIR__, "literate")
const generated_dir = joinpath(@__DIR__, "src", "generated")

@info "Loading AlgebraicTemplate"
using AlgebraicTemplate

const no_literate = "--no-literate" in ARGS
if !no_literate
  @info "Building Literate.jl docs"

  # Set Literate.jl config if not being compiled on recognized service.
  config = Dict{String,String}()
  if !(haskey(ENV, "GITHUB_ACTIONS") || haskey(ENV, "GITLAB_CI"))
    config["nbviewer_root_url"] = "https://nbviewer.jupyter.org/github/AlgebraicJulia/AlgebraicTemplate.jl/blob/gh-pages/dev"
    config["repo_root_url"] = "https://github.com/AlgebraicJulia/AlgebraicTemplate.jl/blob/main/docs"
  end

  for (root, dirs, files) in walkdir(literate_dir)
    out_dir = joinpath(generated_dir, relpath(root, literate_dir))
    for file in files
      f, l = splitext(file)
      if l == ".jl" && !startswith(f, "_")
        Literate.markdown(joinpath(root, file), out_dir;
          config=config, documenter=true, credit=false)
        Literate.notebook(joinpath(root, file), out_dir;
          execute=true, documenter=true, credit=false)
      end
    end
  end
end

bib = CitationBibliography(
    joinpath(@__DIR__, "src", "documenter.bib");
    style=:numeric)

@info "Building Documenter.jl docs"
makedocs(
  modules=[AlgebraicTemplate],
  format=Documenter.HTML(),
  sitename="AlgebraicTemplate.jl",
  doctest=false,
  checkdocs=:none,
  pages=Any[
    "AlgebraicTemplate.jl"=>"index.md",
    "Examples"=>Any[
      "generated/literate_example.md",],
    "Library Reference"=>"api.md",],
  plugins=[bib])


@info "Deploying docs"
deploydocs(
  target="build",
  repo="github.com/AlgebraicJulia/AlgebraicTemplate.jl.git",
  branch="gh-pages")

