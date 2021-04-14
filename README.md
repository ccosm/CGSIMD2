# CGSIMD2

A small and very specialized package to make working with `CG[Size|Point|Vector]`-esque wrappers of two floating-point numbers easier.

This package makes vectorized operations of the `SIMD2` class available when working with the aforementioned `CoreGraphics` types.

Situations where you want said types to behave more interoperably are simply too common to ignore.

In addition to the appropriate `SIMD2` functions, Boole-ified comparison operators are included that return numeric versions of `SIMDMask`.

This package could be made more general but I'm limiting it for simplicity and compile-times.
