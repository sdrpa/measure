/**
 Created by Sinisa Drpa on 8/6/16.

 Measure is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License or any later version.

 Measure is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with Measure.  If not, see <http://www.gnu.org/licenses/>
 */

import Foundation
import FoundationKit

public protocol NumericType: ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral, SignedNumber, Comparable, Hashable, CustomStringConvertible {

    var v: Double { set get }

    var isNaN: Bool { get }
    init(_ v: Double)
}

extension NumericType {

    public var hashValue: Int {
        get { return self.v.hashValue }
    }

    public var description: String {
        return String(format: "%.1f", self.v)
    }

    public var isNaN: Bool {
        return self.v.isNaN
    }

    public func truncatingRemainder<T :NumericType>(dividingBy other: T) -> T {
        return T(self.v.truncatingRemainder(dividingBy: other.v))
    }
}

public func % <T :NumericType> (lhs: T, rhs: T) -> T {
    return T(lhs.v.truncatingRemainder(dividingBy: rhs.v))
}

public func +<T: NumericType>(lhs: T, rhs: T) -> T {
    return T(lhs.v + rhs.v)
}

public func -<T: NumericType>(lhs: T, rhs: T) -> T {
    return T(lhs.v - rhs.v)
}

public func *<T: NumericType>(lhs: T, rhs: T) -> T {
    return T(lhs.v * rhs.v)
}

public func /<T: NumericType>(lhs: T, rhs: T) -> T {
    return T(lhs.v / rhs.v)
}

public func <<T: NumericType>(lhs: T, rhs: T) -> Bool {
    return lhs.v < rhs.v
}

public func ==<T: NumericType>(lhs: T, rhs: T) -> Bool {
    return lhs.v == rhs.v
}

public func ~=<T: NumericType>(lhs: T, rhs: T) -> Bool {
    return abs(lhs.v - rhs.v) < Double.epsilon
}

public prefix func -<T: NumericType>(number: T) -> T {
    return T(-number.v)
}

public func +=<T: NumericType>(lhs: inout T, rhs: T) {
    lhs.v = lhs.v + rhs.v
}

public func -=<T: NumericType>(lhs: inout T, rhs: T) {
    lhs.v = lhs.v - rhs.v
}

// MARK: -

public func abs<T: NumericType>(_ v: T) -> T {
    return T.init(abs(v.v))
}

public func round<T: NumericType>(_ v: T) -> T {
    return T.init(round(v.v))
}

public func log<T: NumericType>(_ v: T) -> T {
    return T.init(log(v.v))
}

public func sqrt<T: NumericType>(_ v: T) -> T {
    return T.init(sqrt(v.v))
}

// MARK: -

public func sin<T: NumericType>(_ v: T) -> T {
    return T.init(sin(v.v))
}

public func asin<T: NumericType>(_ v: T) -> T {
    return T.init(asin(v.v))
}

public func cos<T: NumericType>(_ v: T) -> T {
    return T.init(cos(v.v))
}

public func acos<T: NumericType>(_ v: T) -> T {
    return T.init(acos(v.v))
}

public func atan2<T: NumericType>(_ x: T, _ y: T) -> T {
    return T.init(atan2(x.v, y.v))
}

public func tan<T: NumericType>(_ v: T) -> T {
    return T.init(tan(v.v))
}
