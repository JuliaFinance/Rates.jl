
"""
A `Compunding` type gives information on how to map
an interest rate `r` and year fraction `y`
to a discount factor or effective rate factor.
"""
abstract type Compounding end

"""
The Effective Rate Factor under `Continuous` compounding
is defined by:

```math
exp(rt)
```

given an annual rate `r` and year fraction `t`.
"""
struct Continuous <: Compounding end

"""
The Effective Rate Factor under `Simple` compounding
is defined by:

```math
(1 + rt)
```

given an annual rate `r` and year fraction `t`.
"""
struct Simple <: Compounding end

"""
The Effective Rate Factor under `Exponential` compounding
is defined by:

```math
(1 + r)^t
```

given an annual rate `r` and year fraction `t`.
"""
struct Exponential <: Compounding end
