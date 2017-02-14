//
//  BoggleGameUITests.swift
//  BoggleGameUITests
//
//  Created by dev1 on 1/26/17.
//  Copyright © 2017 Asynchrony. All rights reserved.
//

import XCTest

class BoggleGameUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
            
            // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let app = XCUIApplication()
        
        let letterButtonPredicate = NSPredicate(format: "label.length == 1")
        let letterButtons = app.buttons.matching(letterButtonPredicate)
        XCTAssertEqual(letterButtons.count, 16)

        let letterButtonSecond = letterButtons.element(boundBy: 1)
        XCTAssertEqual(letterButtonSecond.label.characters.count, 1)
        
//        let currentWordLabel = app.staticTexts.element(boundBy: 0)
//        letterButtonSecond.tap()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
