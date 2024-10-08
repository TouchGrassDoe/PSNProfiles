//
//  PSNProfiles__app_UITestsLaunchTests.swift
//  PSNProfiles (app)UITests
//
//  Created by Aaron Doe on 07/10/2024.
//

import XCTest

final class PSNProfiles__app_UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
