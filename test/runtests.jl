
import Rates
using Test

@testset "Continuous Compounding" begin
    r = 0.1
    t = 1.5

    @test Rates.erf(Rates.Continuous, r, t) ≈ exp(r*t)
    @test Rates.discountfactor(Rates.Continuous, r, t) ≈ 1.0/exp(r*t)
    @test Rates.erf_to_rate(Rates.Continuous, exp(r*t), t) ≈ r
    @test Rates.discountfactor_to_rate(Rates.Continuous, 1.0/exp(r*t), t) ≈ r
    @test_throws AssertionError Rates.discountfactor(Rates.Continuous, r, -0.1)
    @test_throws AssertionError Rates.discountfactor_to_rate(Rates.Continuous, 1.0, -0.1)
end

@testset "Simple Compounding" begin
    r = 0.1
    t = 1.5

    @test Rates.erf(Rates.Simple, r, t) ≈ 1+r*t
    @test Rates.discountfactor(Rates.Simple, r, t) ≈ 1.0/(1+r*t)
    @test Rates.erf_to_rate(Rates.Simple, 1+r*t, t) ≈ r
    @test Rates.discountfactor_to_rate(Rates.Simple, 1.0/(1+r*t), t) ≈ r
    @test_throws AssertionError Rates.discountfactor(Rates.Simple, r, -0.1)
    @test_throws AssertionError Rates.discountfactor_to_rate(Rates.Simple, 1.0, -0.1)
end

@testset "Exponential Compounding" begin
    r = 0.1
    t = 1.5

    @test Rates.erf(Rates.Exponential, r, t) ≈ (1+r)^t
    @test Rates.discountfactor(Rates.Exponential, r, t) ≈ 1.0/((1+r)^t)
    @test Rates.erf_to_rate(Rates.Exponential, (1+r)^t, t) ≈ r
    @test Rates.discountfactor_to_rate(Rates.Exponential, 1.0/((1+r)^t), t) ≈ r
    @test_throws AssertionError Rates.discountfactor(Rates.Exponential, r, -0.1)
    @test_throws AssertionError Rates.discountfactor_to_rate(Rates.Exponential, 1.0, -0.1)
end

