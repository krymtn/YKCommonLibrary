//
//  BaseTextFieldTests.swift
//  YKCommonLibrary_Tests
//
//  Created by Koray Metin on 21.09.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble
import YKCommonLibrary
@testable import YKCommonLibrary_Example

class BaseTextFieldTests: QuickSpec {
    override func spec() {

        describe("Declare TextField without any configuration json") {
            var ykTextField: YKTextField!
            let defaultConfigurator = TextFieldConfigurator()
            beforeEach {
                ykTextField = YKTextField.init(frame: .zero)
            }
            context("Check the values", {
                it("Textfield backgroundcolor") {
                    expect(ykTextField.backgroundColor).to(equal(defaultConfigurator.backgroundColor))
                }
            })

        }
    }
}
