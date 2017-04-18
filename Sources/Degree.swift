/**
 Created by Sinisa Drpa on 1/19/17.

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

public struct Degree: NumericType, CustomStringConvertible {

    public var v: Double

    public init(_ v: Double) {
        self.v = v
    }

    public init(_ v: Degree) {
        self.v = v.v
    }

    public init(_ v: Int) {
        self.init(Double(v))
    }

    public init(_ v: Radian) {
        self.init(v.v * 180.0 / Double.pi)
    }

    public var description: String {
        return String(format: "%.3f", self.v)
    }
}

public extension Degree {

    public func wrapping(lowerBound: Double, upperBound: Double) -> Degree {
        let wrapped = self.v.wrapping(lowerBound: lowerBound, upperBound: upperBound)
        return Degree(wrapped)
    }

    /**
     * Length (angular) of a shortest way between two angles.
     * It will be in range [0, 180].
     */
    public func distance(to beta: Degree) -> Degree {
        let phi = abs(beta - self) % Degree(360.0)  // This is either the distance or 360 - distance
        let distance = (phi > 180) ? (360 - phi) : phi
        return Degree(distance)
    }
}

public extension Degree {

    /// Degrees, Minutes and Seconds - DDD°MM′SS.S″
    /// 32°18′23.1″ 122°36′52.5″
    public func toDMS() -> String {
        let decimal = Double(abs(self))

        let degrees = floor(decimal)
        let minutes = floor(60 * (decimal - degrees))
        let seconds = 3600 * (decimal - degrees) - 60 * minutes

        return String(format: "%0.f°%0.f′%.3f″", degrees, minutes, seconds)
    }

    /// Degrees and Decimal Minutes - DDD° MM.MMM′
    /// 32°18.385′ 122°36.875′
    public func toDDM() -> String {
        let dec = Double(abs(self))

        let d = floor(dec)
        let m = floor(60 * (dec - d))
        let s = 3600 * (dec - d) - 60 * m
        let dm = m + s/60

        return String(format: "%0.f°%.3f′", d, dm)
    }

    /// Decimal Degrees - DDD.DDDDD°
    /// 32.30642° 122.61458°
    public func toDD() -> String {
        return String(format: "%.3f°", self.v)
    }
}

public extension Degree {

    public init(integerLiteral: IntegerLiteralType) {
        self.init(Double(integerLiteral))
    }

    public init(floatLiteral: FloatLiteralType) {
        self.init(Double(floatLiteral))
    }
}
