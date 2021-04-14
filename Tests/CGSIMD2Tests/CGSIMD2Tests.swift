    import XCTest
    @testable import CGSIMD2

    final class CGSIMD2Tests: XCTestCase {
        func testPointPointAddition() {
            let x = CGPoint.zero
            let y = CGPoint.zero
            let z = x + y
            
            assert(z == .zero)
        }
        
        func testPointSizeAddition() {
            let x = CGPoint.zero
            let y = CGSize.zero
            let z = x + y
            
            assert(type(of: z) == CGPoint.self)
            assert(z == .zero)
        }
        
        func testPointScalarAddition() {
            let x = CGPoint.zero + 0
            
            assert(type(of: x) == CGPoint.self)
            assert(x == .zero)
        }
        
        func testScalarPointAddition() {
            let x = 0 + CGPoint.zero
            
            assert(type(of: x) == CGPoint.self)
            assert(x == .zero)
        }
        
        func testBooleLessThan() {
            let x = CGPoint(x: 1, y: 2)
            let y = CGPoint(x: 0, y: 3)
            let z = x < y
            
            assert(z.x == 0)
            assert(z.y == 1)
        }
        
        func testBooleLessThanScalar() {
            let x = CGPoint(x: -1, y: 1)
            let y = x < 0
            
            assert(y.x == 1)
            assert(y.y == 0)
        }
        
        func testBooleLessThanScalarReversed() {
            let x = CGPoint(x: -1, y: 1)
            let y = 0 < x
            
            assert(y.x == 0)
            assert(y.y == 1)
        }
        
        func testReadmeExample() {
            let boundsSize = CGSize(width: 100, height: 100)
            var frameToCenterOld = CGRect(x: 10, y: 20, width: 30, height: 40)
            
            // center horizontally
            if frameToCenterOld.size.width < boundsSize.width {
                frameToCenterOld.origin.x = (boundsSize.width - frameToCenterOld.size.width) / 2
            } else {
                frameToCenterOld.origin.x = 0
            }

            // center vertically
            if frameToCenterOld.size.height < boundsSize.height {
                frameToCenterOld.origin.y = (boundsSize.height - frameToCenterOld.size.height) / 2
            } else {
                frameToCenterOld.origin.y = 0
            }
            
            var frameToCenterNew = CGRect(x: 10, y: 20, width: 30, height: 40)

            frameToCenterNew.origin = CGPoint.zero + (frameToCenterNew.size < boundsSize) * ((boundsSize - frameToCenterNew.size) / 2)
            
            assert(frameToCenterOld == frameToCenterNew)
        }
    }
