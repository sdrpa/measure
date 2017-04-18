/**
 Created by Sinisa Drpa on 2/13/17.

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
// http://www.sunearthtools.com/dp/tools/conversion.php
// https://www.maptools.com/tutorials/lat_lon/formats

import Foundation

public extension Degree {

    // 79.982N
    public init?(dd string: String) {
        guard string.hasSuffix("N") || string.hasSuffix("S") || string.hasSuffix("W") || string.hasSuffix("E") else {
            return nil
        }
        guard let v = Double(string.substring(start: 0, end: string.characters.count - 1)) else {
            return nil
        }
        self.init(Degree.shouldAddNegativePrefix(string) ? -v : v)
    }

    // 420941N | 0212413E
    // 420941.12N | 0212413.12E
    public init?(dms string: String) {

        var v: Double?
        if string.hasSuffix("N") || string.hasSuffix("S") {
            guard let d = Double(string.substring(start: 0, end: 2)),
                let m = Double(string.substring(start: 2, end: 4)),
                let s = Double(string.substring(start: 4, end: string.characters.count - 1)) else {
                    return nil
            }
            v = d + m/60 + s/3600

        } else if string.hasSuffix("W") || string.hasSuffix("E") {
            guard let d = Double(string.substring(start: 0, end: 3)),
                let m = Double(string.substring(start: 3, end: 5)),
                let s = Double(string.substring(start: 5, end: string.characters.count - 1)) else {
                    return nil
            }
            v = d + m/60 + s/3600
        } else {
            return nil
        }

        guard let value = v else {
            return nil
        }
        self.init(Degree.shouldAddNegativePrefix(string) ? -value : value)
    }

    fileprivate static func shouldAddNegativePrefix(_ string: String) -> Bool {
        return string.hasSuffix("W") || string.hasSuffix("S")
    }
}

fileprivate extension String {

    fileprivate func substring(start: Int, end: Int) -> String {
        let start = self.index(self.startIndex, offsetBy: start)
        let end = self.index(self.startIndex, offsetBy: end)
        return self.substring(with: start..<end)
    }
}
