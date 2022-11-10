//
//  DependenciesTests.swift
//  DependenciesTests
//
//  Created by Uladzislau Komar on 6.11.22.
//

import XCTest

final class DependenciesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        XCTAssert(true)
    }
    
    func testScoreIsComputer() {
        // given
        var a = 5
        
        //when
        a += 6
        
        //then
        XCTAssertEqual(a, 11, "True")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
//            sleep(3)
        }
    }

}
