#=
# ontology.jl contains the base datatypes of the CommonSensePhysics
# project. This indludes Entities, Scenes, and Worlds.
#
# Felix Sosa - 06/16/2021
=#

### Shapes: the composite types that define geometric properties of entities

abstract type Shape{T} end

struct Circle{T} <: Shape{T}
    radius::T
end

struct Rect{T} <: Shape{T}
    width::T
    height::T
end

### Entities: the composite type that defines an observable object in a Scene

# Defines the Dynamic Type, indicating whether Entity is dynamic or static
abstract type DynamicT <: Union{Missing, Bool, AbstractVector{Bool}} end

similarTf(x::AbstractArray, T=eltype(x), f=zero) = fill!(similar(x, T), f(T))
similarTf(x, T=eltype(x), f=zero) = f(T)

Base.@kwdef struct Entity{DynamicT, MassT, ShapeT}
    dynamic::DynamicT=true
    mass::MassT=similarTf(dynamic, Float64)
    shape::ShapeT=similarTf(dynamic, Float64)
end
