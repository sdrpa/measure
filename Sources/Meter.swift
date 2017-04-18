/**
 Created by Sinisa Drpa on 1/20/17.

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

public struct Meter: NumericType {

    public var v: Double

    public init(_ v: Double) {
        self.v = v
    }

    public init(_ v: Int) {
        self.init(Double(v))
    }

    public var description: String {
        return String(format: "%.1f", self.v)
    }
}

public extension Meter {

    public init(_ v: Feet) {
        self.init(v.v*0.3048)
    }

    public init(_ v: Nm) {
        self.init(Double(v*1852))
    }

    public init(_ v: Radian) {
        self.init(v.v)
    }
}

public extension Meter {

    public init(integerLiteral: IntegerLiteralType) {
        self.init(Double(integerLiteral))
    }

    public init(floatLiteral: FloatLiteralType) {
        self.init(Double(floatLiteral))
    }
}
