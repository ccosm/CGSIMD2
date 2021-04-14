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
        self.init(x: simd.x, y: simd.y)
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
        self.init(dx: simd.x, dy: simd.y)
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
        self.init(width: simd.x, height: simd.y)
    }
}
