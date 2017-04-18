/**
 Created by Sinisa Drpa on 2/21/17.

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

import XCTest
@testable import MeasureTests

XCTMain([
     testCase(DegreeTests.allTests),
     testCase(DegreeJSONTests.allTests),
     testCase(FeetJSONTests.allTests)
])
