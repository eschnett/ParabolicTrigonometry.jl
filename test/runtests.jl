using ForwardDiff
using ParabolicTrigonometry
using Test

const ϕs = [-4:4; 8 * rand(100) .- 4]

@testset "Simple tests" begin
    @test cosp(0) == 1
    @test sinp(0) == 0
    @test isapprox(cosp(big(0)), 1; atol=eps(BigFloat))
    @test isapprox(sinp(big(0)), 0; atol=eps(BigFloat))
end

@testset "Consistency conditions" begin
    for ϕ in ϕs
        @test isapprox(cosp(ϕ)^2 + sinp(ϕ), 1; atol=10 * eps())
    end
end

sinp′(x) = ForwardDiff.derivative(sinp, x)
cosp′(x) = ForwardDiff.derivative(cosp, x)

@testset "Derivatives" begin
    for ϕ in ϕs
        @test isapprox(cosp′(ϕ), -1 / (sinp(ϕ) + 2 * cosp(ϕ)^2); atol=10 * eps())
        @test isapprox(sinp′(ϕ), 2 * cosp(ϕ) / (sinp(ϕ) + 2 * cosp(ϕ)^2); atol=10 * eps())
    end
end
