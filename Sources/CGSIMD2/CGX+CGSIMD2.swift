//
//  File.swift
//  
//
//  Created by Marcos Canel on 4/14/21.
//

import CoreGraphics

extension CGPoint: CGSIMD2 {
    @usableFromInline
    var simd: SIMD2<CGFloat.NativeType> {
        get {
            .init(CGFloat.NativeType(x), CGFloat.NativeType(y))
        }
    }
    
    @usableFromInline
    init(_ simd: SIMD2<CGFloat.NativeType>) {
        self.init(x: CGFloat.NativeType(simd.x), y: CGFloat.NativeType(simd.y))
    }
}

extension CGVector: CGSIMD2 {
    @usableFromInline
    var simd: SIMD2<CGFloat.NativeType> {
        get {
            .init(CGFloat.NativeType(dx), CGFloat.NativeType(dy))
        }
    }
    
    @usableFromInline
    init(_ simd: SIMD2<CGFloat.NativeType>) {
        self.init(dx: CGFloat.NativeType(simd.x), dy: CGFloat.NativeType(simd.y))
    }
}

extension CGSize: CGSIMD2 {
    @usableFromInline
    var simd: SIMD2<CGFloat.NativeType> {
        get {
            .init(CGFloat.NativeType(width), CGFloat.NativeType(height))
        }
    }
    
    @usableFromInline
    init(_ simd: SIMD2<CGFloat.NativeType>) {
        self.init(width: CGFloat.NativeType(simd.x), height: CGFloat.NativeType(simd.y))
    }
}
