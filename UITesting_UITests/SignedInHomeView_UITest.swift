//
//  SignedInHomeView_UITest.swift
//  UITesting_UITests
//
//  Created by Kaushal Kumbagowdana on 6/12/23.
//

import XCTest

final class SignedInHomeView_UITest: XCTestCase {
    
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
    
    func test_SignInHomeView_showAlertButton_shouldDisplayAlert() {
        // Given
        signIn()
        
        // When
        tapAlertButton(shouldDismssAlert: false)
        
        // Then
        let alert = app.alerts.firstMatch // finds the first alert instead of basing it on alert text
        XCTAssertTrue(alert.exists) // alert should appear
    }
    
    func test_SignInHomeView_showAlertButton_shouldDisplayAlertandDismissAlert() {
        // Given
        signIn()
        
        // When
        tapAlertButton(shouldDismssAlert: true)
        
        // Then
        let doesAlertExist = app.alerts.firstMatch.waitForExistence(timeout: 5)
        XCTAssertFalse(doesAlertExist) // should not exists after clicking
    }
    
    func test_SignInHomeView_navigationLinkToDestination_shouldNavigateToDestination() {
        // Given
        signIn()
        
        // When
        tapNavigationButton(shouldToggleBack: false)
        
        // Then
        let destinationText = app.staticTexts["Destination"] // Desintation text appears
        XCTAssertTrue(destinationText.exists)
    }
    
    func test_SignInHomeView_navigationLinkToDestination_shouldNavigateToDestinationAndGoBack() {
        // Given
        signIn()
        
        // When
        tapNavigationButton(shouldToggleBack: true)
        
        // Then
            // should see the Welcome Navigation Bar
        let navBar = app.navigationBars["Welcome"]
        XCTAssertTrue(navBar.exists)
    }

}

extension SignedInHomeView_UITest {
    
    // Helper functions
    func signIn() {
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
    }
    
    func tapAlertButton(shouldDismssAlert: Bool) {
        let alertButton = app.buttons["showAlertButton"]
        alertButton.tap()
        
        if shouldDismssAlert {
            let alert = app.alerts.firstMatch // finds the first alert instead of basing it on alert text
            let alertOkButton = alert.buttons["OK"]
            let alertOkButtonExists = alertOkButton.waitForExistence(timeout: 5) // waits up to 5 seconds for element to exists; better than using sleep(1)
            XCTAssertTrue(alertOkButtonExists)
            
            alertOkButton.tap()
        }
    }
    
    func tapNavigationButton(shouldToggleBack: Bool) {
        let navLinkButton = app/*@START_MENU_TOKEN@*/.buttons["navigationLinkToDestination"]/*[[".buttons[\"Navigation\"]",".buttons[\"navigationLinkToDestination\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        navLinkButton.tap()
        
        if shouldToggleBack {
            let backButton = app.navigationBars.buttons["Welcome"] // click back button
            backButton.tap()
        }
    }
}
