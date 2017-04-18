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

public struct FL: NumericType {

    public var v: Double

    public init(_ v: Double) {
        self.v = v
    }

    public init(_ v: Int) {
        self.init(Double(v))
    }
}

public extension FL {

    public init(_ v: Feet) {
        self.init(floor(v.v/100))
    }
}

public extension FL {

    public init(integerLiteral: IntegerLiteralType) {
        self.init(Double(integerLiteral))
    }

    public init(floatLiteral: FloatLiteralType) {
        self.init(Double(floatLiteral))
    }
}
