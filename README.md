# Rates.jl

Rates.jl provides methods to convert an interest rate into a discount factor.

## Example

```julia
import Rates

r = 0.1
t = 1.5

Rates.erf(Rates.Continuous, r, t)
Rates.discountfactor(Rates.Continuous, r, t)
Rates.erf_to_rate(Rates.Continuous, exp(r*t), t) # will retrieve r
Rates.discountfactor_to_rate(Rates.Continuous, 1.0/exp(r*t), t) # will retrieve r
```

## Compounding Types

* `Rates.Continuous`

* `Rates.Simple`

* `Rates.Exponential`
