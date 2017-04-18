/**
 Created by Sinisa Drpa on 4/5/17.

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

import JSON

extension Meter: Coding {

    public init?(json: JSON) {
        guard let v: Double = "v" <| json else {
            return nil
        }
        self.v = v
    }

    public func toJSON() -> JSON? {
        return jsonify([
            "v" |> self.v
            ])
    }
}
