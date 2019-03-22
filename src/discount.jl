
@inline function check_positive_maturity(t::AbstractFloat)
    @assert t >= 0 "The effective rate factor for negative maturity is undefined."
end

"""
    erf(compounding, rate, yearfraction)

The *Effective Rate Factor* is the result of an investment
of 1 unit of a currency for a fixed interest rate `rate`
and period `yearfraction`.

Given an Effective Rate Factor `erf`, the associated discount
factor can be calculated as `1.0/erf`.
"""
function erf
end

function erf(::Continuous, r::AbstractFloat, t::AbstractFloat)
    check_positive_maturity(t)
    return t == 0.0 ? 1.0 : exp(r*t)
end

function erf(::Simple, r::AbstractFloat, t::AbstractFloat)
    check_positive_maturity(t)
    return t == 0.0 ? 1.0 : 1.0 + r*t
end

function erf(::Exponential, r::AbstractFloat, t::AbstractFloat)
    check_positive_maturity(t)
    return t == 0.0 ? 1.0 : (1.0 + r)^t
end

"""
    discountfactor(compounding, rate, yearfraction)

The *Discount Factor* is the amount of currency one must
hold now to receive 1 unit of currency after a period
given by `yearfraction`, when investing using
and interest rate given by `rate`.
"""
function discountfactor
end

discountfactor(c::Compounding, r::AbstractFloat, t::AbstractFloat) = 1.0 / erf(c, r, t)

"""
    erf_to_rate(compounding, erf, yearfraction)

Converts an Effective Rate Factor `erf` to an Interest Rate.
"""
function erf_to_rate
end

function erf_to_rate(::Continuous, factor::AbstractFloat, t::AbstractFloat)
    check_positive_maturity(t)
    return log(factor) / t
end

function erf_to_rate(::Simple, factor::AbstractFloat, t::AbstractFloat)
    check_positive_maturity(t)
    return (factor-1.0)/t
end

function erf_to_rate(::Exponential, factor::AbstractFloat, t::AbstractFloat)
    check_positive_maturity(t)
    return factor^(1.0/t) - 1.0
end

"""
    discountfactor_to_rate(compounding, discountfactor, yearfraction)

Converts a Discount Factor `discountfactor` to an Interest Rate.
"""
function discountfactor_to_rate(c::Compounding, discountfactor::AbstractFloat, t::AbstractFloat)
    return erf_to_rate(c, 1.0 / discountfactor, t)
end

# allows `erf(Exponential, 0.1, 1.0)` syntax.
for fun in (:erf, :discountfactor, :erf_to_rate, :discountfactor_to_rate)
    @eval begin
        function ($fun)(::Type{T}, a::AbstractFloat, b::AbstractFloat) where {T<:Compounding}
            return ($fun)(T(), a, b)
        end
    end
end
