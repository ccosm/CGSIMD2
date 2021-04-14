# CGSIMD2

A small and very specialized package to make working with `CG[Size|Point|Vector]`-esque wrappers of two floating-point numbers easier.

This package makes vectorized operations of the `SIMD2` class available when working with the aforementioned `CoreGraphics` types.

In addition to the appropriate `SIMD2` functions, Boole-ified comparison operators are included that return numeric versions of `SIMDMask`.

Situations where you want said types to behave more interoperably are simply too common to ignore. Consider for example, the following code from a WWDC slide:

    let boundsSize: CGSize = /* ... */
    var frameToCenter: CGRect = /* ... */
    
    // center horizontally
    if (frameToCenter.size.width < boundsSize.width)
        frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2
    else
        frameToCenter.origin.x = 0

    // center vertically
    if (frameToCenter.size.height < boundsSize.height)
        frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2
    else
        frameToCenter.origin.y = 0

With overloaded operators and Boole-ified comparison operators this code reduces to:

    frameToCenter.origin = CGPoint.zero + (frameToCenter.size < boundsSize) * ((boundsSize - frameToCenter.size) / 2)

This package could be made more general but I'm limiting it for simplicity and compile-times.
