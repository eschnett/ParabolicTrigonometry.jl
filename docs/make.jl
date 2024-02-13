# Generate documentation with this command:
# (cd docs && julia make.jl)

push!(LOAD_PATH, "..")

using Documenter
using ParabolicTrigonometry

makedocs(; sitename="ParabolicTrigonometry", format=Documenter.HTML(), modules=[ParabolicTrigonometry])

deploydocs(; repo="github.com/eschnett/ParabolicTrigonometry.jl.git", devbranch="main", push_preview=true)
