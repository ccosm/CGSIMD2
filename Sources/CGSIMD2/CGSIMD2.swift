import CoreGraphics
import simd

@usableFromInline
protocol CGSIMD2 {
    var simd: SIMD2<CGFloat.NativeType> { get }
    init(_ simd: SIMD2<CGFloat.NativeType>)
}

extension CGSIMD2 {
    @inlinable
    public static prefix func -(this: Self) -> Self {
        Self(-this.simd)
    }
    
    @inlinable
    public static func +(rhs: Self, lhs: CGSIMD2) -> Self {
        Self(rhs.simd + lhs.simd)
    }
    
    @inlinable
    public static func -(rhs: Self, lhs: CGSIMD2) -> Self {
        Self(rhs.simd - lhs.simd)
    }
    
    @inlinable
    public static func *(rhs: Self, lhs: CGSIMD2) -> Self {
        Self(rhs.simd * lhs.simd)
    }
    
    @inlinable
    public static func /(rhs: Self, lhs: CGSIMD2) -> Self {
        Self(rhs.simd / lhs.simd)
    }
    
    @inlinable
    public static func+=(rhs: inout Self, lhs: CGFloat.NativeType) {
        rhs = rhs + lhs
    }
    
    @inlinable
    public static func-=(rhs: inout Self, lhs: CGFloat.NativeType) {
        rhs = rhs - lhs
    }
    
    @inlinable
    public static func*=(rhs: inout Self, lhs: CGFloat.NativeType) {
        rhs = rhs * lhs
    }
    
    @inlinable
    public static func/=(rhs: inout Self, lhs: CGFloat.NativeType) {
        rhs = rhs / lhs
    }
    
    @inlinable
    public static func+=(rhs: inout Self, lhs: CGSIMD2) {
        rhs = rhs + lhs
    }
    
    @inlinable
    public static func-=(rhs: inout Self, lhs: CGSIMD2) {
        rhs = rhs - lhs
    }
    
    @inlinable
    public static func*=(rhs: inout Self, lhs: CGSIMD2) {
        rhs = rhs * lhs
    }
    
    @inlinable
    public static func/=(rhs: inout Self, lhs: CGSIMD2) {
        rhs = rhs / lhs
    }
    
/*
# Python 3

from itertools import product
     
template = '''
     @inlinable
     public static func {op}(rhs: {arg[0]}, lhs: {arg[1]}) -> Self {{
         Self(rhs{arg[2]} {op} lhs{arg[3]})
     }}
'''

for (op, arg) in product(['+', '-', '*', '/'], [('Self', 'CGFloat.NativeType', '.simd', ''), ('CGFloat.NativeType', 'Self', '', '.simd')]):
    print(template.format(op=op, arg=arg))
*/
    
    @inlinable
    public static func +(rhs: Self, lhs: CGFloat.NativeType) -> Self {
        Self(rhs.simd + lhs)
    }


    @inlinable
    public static func +(rhs: CGFloat.NativeType, lhs: Self) -> Self {
        Self(rhs + lhs.simd)
    }


    @inlinable
    public static func -(rhs: Self, lhs: CGFloat.NativeType) -> Self {
        Self(rhs.simd - lhs)
    }


    @inlinable
    public static func -(rhs: CGFloat.NativeType, lhs: Self) -> Self {
        Self(rhs - lhs.simd)
    }


    @inlinable
    public static func *(rhs: Self, lhs: CGFloat.NativeType) -> Self {
        Self(rhs.simd * lhs)
    }


    @inlinable
    public static func *(rhs: CGFloat.NativeType, lhs: Self) -> Self {
        Self(rhs * lhs.simd)
    }


    @inlinable
    public static func /(rhs: Self, lhs: CGFloat.NativeType) -> Self {
        Self(rhs.simd / lhs)
    }


    @inlinable
    public static func /(rhs: CGFloat.NativeType, lhs: Self) -> Self {
        Self(rhs / lhs.simd)
    }
    
/*
template = '''
@inlinable
public static func .{op}(rhs: Self, lhs: CGSIMD2) -> SIMDMask<SIMD2<CGFloat.NativeType.SIMDMaskScalar>> {{
    rhs.simd .{op} lhs.simd
}}

@inlinable
public static func {op}(rhs: Self, lhs: CGSIMD2) -> Self {{
    Self(SIMD2.zero.replacing(with: 1, where: rhs .{op} lhs))
}}
'''

for op in ['<', '<=', '>', '>=']:
    print(template.format(op=op))
*/
    
    @inlinable
    public static func .<(rhs: Self, lhs: CGSIMD2) -> SIMDMask<SIMD2<CGFloat.NativeType.SIMDMaskScalar>> {
        rhs.simd .< lhs.simd
    }

    @inlinable
    public static func <(rhs: Self, lhs: CGSIMD2) -> Self {
        Self(SIMD2.zero.replacing(with: 1, where: rhs .< lhs))
    }


    @inlinable
    public static func .<=(rhs: Self, lhs: CGSIMD2) -> SIMDMask<SIMD2<CGFloat.NativeType.SIMDMaskScalar>> {
        rhs.simd .<= lhs.simd
    }

    @inlinable
    public static func <=(rhs: Self, lhs: CGSIMD2) -> Self {
        Self(SIMD2.zero.replacing(with: 1, where: rhs .<= lhs))
    }


    @inlinable
    public static func .>(rhs: Self, lhs: CGSIMD2) -> SIMDMask<SIMD2<CGFloat.NativeType.SIMDMaskScalar>> {
        rhs.simd .> lhs.simd
    }

    @inlinable
    public static func >(rhs: Self, lhs: CGSIMD2) -> Self {
        Self(SIMD2.zero.replacing(with: 1, where: rhs .> lhs))
    }


    @inlinable
    public static func .>=(rhs: Self, lhs: CGSIMD2) -> SIMDMask<SIMD2<CGFloat.NativeType.SIMDMaskScalar>> {
        rhs.simd .>= lhs.simd
    }

    @inlinable
    public static func >=(rhs: Self, lhs: CGSIMD2) -> Self {
        Self(SIMD2.zero.replacing(with: 1, where: rhs .>= lhs))
    }

/*
from itertools import product
     
template = '''
     @inlinable
     public static func .{op}(rhs: {arg[0]}, lhs: {arg[1]}) -> SIMDMask<SIMD2<CGFloat.NativeType.SIMDMaskScalar>> {{
         rhs{arg[2]} .{op} lhs{arg[3]}
     }}
     
     @inlinable
     public static func {op}(rhs: {arg[0]}, lhs: {arg[1]}) -> Self {{
         Self(SIMD2.zero.replacing(with: 1, where: rhs .{op} lhs))
     }}
'''

for (op, arg) in product(['<', '<=', '>', '>='], [('Self', 'CGFloat.NativeType', '.simd', ''), ('CGFloat.NativeType', 'Self', '', '.simd')]):
    print(template.format(op=op, arg=arg))
*/
    
    @inlinable
    public static func .<(rhs: Self, lhs: CGFloat.NativeType) -> SIMDMask<SIMD2<CGFloat.NativeType.SIMDMaskScalar>> {
        rhs.simd .< lhs
    }
    
    @inlinable
    public static func <(rhs: Self, lhs: CGFloat.NativeType) -> Self {
        Self(SIMD2.zero.replacing(with: 1, where: rhs .< lhs))
    }


    @inlinable
    public static func .<(rhs: CGFloat.NativeType, lhs: Self) -> SIMDMask<SIMD2<CGFloat.NativeType.SIMDMaskScalar>> {
        rhs .< lhs.simd
    }
    
    @inlinable
    public static func <(rhs: CGFloat.NativeType, lhs: Self) -> Self {
        Self(SIMD2.zero.replacing(with: 1, where: rhs .< lhs))
    }


    @inlinable
    public static func .<=(rhs: Self, lhs: CGFloat.NativeType) -> SIMDMask<SIMD2<CGFloat.NativeType.SIMDMaskScalar>> {
        rhs.simd .<= lhs
    }
    
    @inlinable
    public static func <=(rhs: Self, lhs: CGFloat.NativeType) -> Self {
        Self(SIMD2.zero.replacing(with: 1, where: rhs .<= lhs))
    }


    @inlinable
    public static func .<=(rhs: CGFloat.NativeType, lhs: Self) -> SIMDMask<SIMD2<CGFloat.NativeType.SIMDMaskScalar>> {
        rhs .<= lhs.simd
    }
    
    @inlinable
    public static func <=(rhs: CGFloat.NativeType, lhs: Self) -> Self {
        Self(SIMD2.zero.replacing(with: 1, where: rhs .<= lhs))
    }


    @inlinable
    public static func .>(rhs: Self, lhs: CGFloat.NativeType) -> SIMDMask<SIMD2<CGFloat.NativeType.SIMDMaskScalar>> {
        rhs.simd .> lhs
    }
    
    @inlinable
    public static func >(rhs: Self, lhs: CGFloat.NativeType) -> Self {
        Self(SIMD2.zero.replacing(with: 1, where: rhs .> lhs))
    }


    @inlinable
    public static func .>(rhs: CGFloat.NativeType, lhs: Self) -> SIMDMask<SIMD2<CGFloat.NativeType.SIMDMaskScalar>> {
        rhs .> lhs.simd
    }
    
    @inlinable
    public static func >(rhs: CGFloat.NativeType, lhs: Self) -> Self {
        Self(SIMD2.zero.replacing(with: 1, where: rhs .> lhs))
    }


    @inlinable
    public static func .>=(rhs: Self, lhs: CGFloat.NativeType) -> SIMDMask<SIMD2<CGFloat.NativeType.SIMDMaskScalar>> {
        rhs.simd .>= lhs
    }
    
    @inlinable
    public static func >=(rhs: Self, lhs: CGFloat.NativeType) -> Self {
        Self(SIMD2.zero.replacing(with: 1, where: rhs .>= lhs))
    }


    @inlinable
    public static func .>=(rhs: CGFloat.NativeType, lhs: Self) -> SIMDMask<SIMD2<CGFloat.NativeType.SIMDMaskScalar>> {
        rhs .>= lhs.simd
    }
    
    @inlinable
    public static func >=(rhs: CGFloat.NativeType, lhs: Self) -> Self {
        Self(SIMD2.zero.replacing(with: 1, where: rhs .>= lhs))
    }
    
    @inlinable
    public func max(of other: CGSIMD2) -> Self {
        let mask = self > other
        
        return mask*self + (1 - mask)*other
    }
    
    @inlinable
    public func min(of other: CGSIMD2) -> Self {
        let mask = self < other
        
        return mask*self + (1 - mask)*other
    }
}
