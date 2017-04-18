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
@testable import Measure

class DegreeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFromDMS() {
        // N
        if let v = Degree(dms: "420941N")?.v {
            XCTAssertEqualWithAccuracy(42.161389, v, accuracy: 10e-6)
        } else {
            XCTFail()
        }
        if let v = Degree(dms: "420941.278N")?.v {
            XCTAssertEqualWithAccuracy(42.161466, v, accuracy: 10e-6)
        } else {
            XCTFail()
        }
        // E
        if let v = Degree(dms: "0212413E")?.v {
            XCTAssertEqualWithAccuracy(21.403611, v, accuracy: 10e-6)
        } else {
            XCTFail()
        }
        if let v = Degree(dms: "0212413.356E")?.v {
            XCTAssertEqualWithAccuracy(21.403710, v, accuracy: 10e-6)
        } else {
            XCTFail()
        }
        // S
        if let v = Degree(dms: "420941S")?.v {
            XCTAssertEqualWithAccuracy(-42.161389, v, accuracy: 10e-6)
        } else {
            XCTFail()
        }
        // W
        if let v = Degree(dms: "0212413W")?.v {
            XCTAssertEqualWithAccuracy(-21.403611, v, accuracy: 10e-6)
        } else {
            XCTFail()
        }
    }

    func testFromDD() {
        if let v = Degree(dd: "79.982N")?.v {
            XCTAssertEqualWithAccuracy(79.982, v, accuracy: 10e-6)
        } else {
            XCTFail()
        }
        if let v = Degree(dd: "79.982S")?.v {
            XCTAssertEqualWithAccuracy(-79.982, v, accuracy: 10e-6)
        } else {
            XCTFail()
        }

        if let v = Degree(dd: "79.982W")?.v {
            XCTAssertEqualWithAccuracy(-79.982, v, accuracy: 10e-6)
        } else {
            XCTFail()
        }
        if let v = Degree(dd: "79.982E")?.v {
            XCTAssertEqualWithAccuracy(79.982, v, accuracy: 10e-6)
        } else {
            XCTFail()
        }
    }

    func testToDMS() {
        let degree = Degree(40.76)
        XCTAssertEqual("40°45′36.000″", degree.toDMS())
    }

    func testToDDM() {
        let degree = Degree(40.76)
        XCTAssertEqual("40°45.600′", degree.toDDM())
    }

    func testToDD() {
        let degree = Degree(40.76)
        XCTAssertEqual("40.760°", degree.toDD())
    }

    func testDistance() {
        XCTAssertEqual(Degree(25), Degree(350).distance(to: Degree(15)))
        XCTAssertEqual(Degree(25), Degree(15).distance(to: Degree(350)))
        XCTAssertEqual(Degree(60), Degree(250).distance(to: Degree(190)))
    }

    static var allTests = [
        ("testFromDMS", testFromDMS),
        ("testFromDD", testFromDD),
        ("testToDMS", testToDMS),
        ("testToDDM", testToDDM),
        ("testToDD", testToDD)
    ]
}
