module ParabolicTrigonometry

# The equation number below refer to [G. Dattoli, M. Migliorati,
# M. Quattromini, and P. E. Ricci, arXiv:1102.1563v1
# [math-ph]](https://arxiv.org/abs/1102.1563v1).

# eqn. (1b)
export gudemann
"""
    gudemann(ϕ)

The Gudemann function `gd`, defined by `tan(gd(ϕ)) = tanh(ϕ)`.
"""
gudemann(ϕ) = atan(tanh(ϕ))

# cosp(0) = 1
# sinp(0) = 0
# cosp(ϕ)^2 + sin(ϕ) = 1
# cosp(ϕ)' = - 1 / (sinp(ϕ) + 2 cosp(ϕ)^2)
# sinp(ϕ)' = 2 cosp(ϕ) / (sinp(ϕ) + 2 cosp(ϕ)^2)

# eqn. (15a)
export cosp
"""
    cosp(ϕ)

The parabolic cosine function `cosp`, related to `cos` and `cosh`. See
[G. Dattoli, M. Migliorati, M. Quattromini, and P. E. Ricci,
arXiv:1102.1563 [math-ph]](https://arxiv.org/abs/1102.1563) for a
definition.

The parabolic cosine function satisfies

    cosp(0) = 1
    sinp(0) = 0
    cosp(ϕ)^2 + sin(ϕ) = 1
    cosp(ϕ)' = - 1 / (sinp(ϕ) + 2 cosp(ϕ)^2)
    sinp(ϕ)' = 2 cosp(ϕ) / (sinp(ϕ) + 2 cosp(ϕ)^2)
"""
function cosp(ϕ)
    t = (4 - 3ϕ) / 2
    u = sqrt(1 + t^2)
    return cbrt(u + t) - cbrt(u - t)
end

# See also eqn. (15b). Unfortunately (15b) is wrong, and we use a
# different (correct) expression instead.
export sinp
"""
    sinp(ϕ)

The parabolic sine function `sinp`, related to `sin` and `sinh`. See
[G. Dattoli, M. Migliorati, M. Quattromini, and P. E. Ricci,
arXiv:1102.1563 [math-ph]](https://arxiv.org/abs/1102.1563) for a
definition.

The parabolic sine function satisfies

    cosp(0) = 1
    sinp(0) = 0
    cosp(ϕ)^2 + sin(ϕ) = 1
    cosp(ϕ)' = - 1 / (sinp(ϕ) + 2 cosp(ϕ)^2)
    sinp(ϕ)' = 2 cosp(ϕ) / (sinp(ϕ) + 2 cosp(ϕ)^2)
"""
function sinp(ϕ)
    return 1 - cosp(ϕ)^2
end

end
