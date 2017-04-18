/**
 Created by Sinisa Drpa on 2/6/17.

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

public extension Double {

    public init(_ v: Meter) {
        self.init(v.v)
    }

    public init(_ v: Nm) {
        self.init(v.v)
    }

    public init(_ v: Degree) {
        self.init(v.v)
    }

    public init(_ v: Radian) {
        self.init(v.v)
    }

    public init(_ v: FL) {
        self.init(v.v)
    }

    public init(_ v: Feet) {
        self.init(v.v)
    }

    public init(_ v: Kts) {
        self.init(v.v)
    }

    public static let epsilon: Double = 0.0001
}
