//
//  BaseButtonTests.swift
//  YKCommonLibrary_Example
//
//  Created by Koray Metin on 19.09.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import YKCommonLibrary

class YKButton: BaseButton {
    override func appStyling() {
        self.type = .borderline
    }
}

class BaseButtonTests: QuickSpec {

    override func spec() {
        describe("Borderline button") {
            var borderlineButton: YKButton!
            let dummyType: BaseButtonType = .borderline
            beforeEach {
                borderlineButton = YKButton.init(frame: .zero)
            }

            context("Check the values if button is initilized", {
                it("Type should be bordeline"){
                    expect(borderlineButton.type).to(equal(dummyType))
                }
                it("bordercolor should be brown"){
                    expect(borderlineButton.layer.borderColor).to(equal(UIColor.brown.cgColor), description: "Border not brown")
                }
            })
        }
    }
}

