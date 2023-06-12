//
//  UITestingBootcampView_UITest.swift
//  UITesting_UITests
//
//  Created by Kaushal Kumbagowdana on 6/11/23.
//

import XCTest

final class UITestingBootcampView_UITest: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func test_UITestingBootcampView_signUpButton_shouldNotSignIn() {
        
        let app = XCUIApplication()
        app.children(matching: .window).element(boundBy: 1).children(matching: .other).element.tap()
        app.textFields["Add your name..."].tap()
        
        let aKey = app/*@START_MENU_TOKEN@*/.keys["A"]/*[[".keyboards.keys[\"A\"]",".keys[\"A\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey.tap()
        aKey.tap()
        
        let aKey2 = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey2.tap()
        aKey2.tap()

        
    }
    
    func test_UITestingBootcampView_signUpButton_shouldSignIn() {
        
        // Given
        let addYourNameTextField = app.textFields["SignUpTextField"] // instead of using the place holder, we use the accessibilityIdentifier
        // When
        addYourNameTextField.tap() // taps on text field
        
        let aKey = app/*@START_MENU_TOKEN@*/.keys["A"]/*[[".keyboards.keys[\"A\"]",".keys[\"A\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ // User clicks on Char "A"
        aKey.tap()
        
        let aKey2 = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ // User clicks on Char "a"
        aKey2.tap()
        
        let returnButton = app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/ // User clicks on "return"
        returnButton.tap()
        
        app.buttons["SignUpButton"].tap() // User clicks on "Sign Up"
        
        let navBar = app.navigationBars["Welcome"] // find the NavBar with Welcome Label
        
        // Then
        XCTAssertTrue(navBar.exists) // check if the welcome navbar exists after signing in
            
        
    }
    



}
