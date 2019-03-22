# Rates.jl

[![License][license-img]](LICENSE)
[![travis][travis-img]][travis-url]
[![codecov][codecov-img]][codecov-url]

[license-img]: http://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat
[travis-img]: https://img.shields.io/travis/JuliaFinance/Rates.jl/master.svg?label=Linux+/+macOS
[travis-url]: https://travis-ci.org/JuliaFinance/Rates.jl
[codecov-img]: https://img.shields.io/codecov/c/github/JuliaFinance/Rates.jl/master.svg?label=codecov
[codecov-url]: http://codecov.io/github/JuliaFinance/Rates.jl?branch=master

Rates.jl provides methods to convert an interest rate into a discount factor.

## Example

```julia
import Rates

r = 0.1 # an interest rate of 10%
t = 1.5 # one and a half year (yearfraction)

Rates.erf(Rates.Continuous, r, t)
Rates.discountfactor(Rates.Continuous, r, t)
Rates.erf_to_rate(Rates.Continuous, exp(r*t), t) # will retrieve r
Rates.discountfactor_to_rate(Rates.Continuous, 1.0/exp(r*t), t) # will retrieve r
```

## Compounding Types

* `Rates.Continuous`

* `Rates.Simple`

* `Rates.Exponential`
