//
//  BaseViewTests.swift
//  YKCommonLibrary_Tests
//
//  Created by Koray Metin on 20.09.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble
import YKCommonLibrary

@testable import YKCommonLibrary_Example

class BaseViewTests: QuickSpec {

    override func spec() {
        describe("YKBaseViewTests") {
            var baseView: YKBaseView!
            beforeEach {
                baseView = YKBaseView.init(frame: .zero)
            }

            context("Check baseView properties", {
                it("baseView notTo(beNil()!)", closure: {
                    expect(baseView).notTo(beNil())
                })
                it("bgColor will be yellow") {
                    expect(baseView.view.backgroundColor).to(equal(UIColor.purple))
                }
            })
        }
    }
}
