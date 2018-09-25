//
//  BaseLabelTests.swift
//  YKCommonLibrary_Tests
//
//  Created by Koray Metin on 19.09.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import YKCommonLibrary

class BaseLabelTests: QuickSpec {

    override func spec() {

        describe("ThinLabel") {
            context("label allocated without json", {
                var defaultThinLabel: ThinLabel!
                var dummyFont: UIFont!
                beforeEach {
                    defaultThinLabel = ThinLabel.init(frame: .zero)
                    dummyFont  = UIFont.systemFont(ofSize: 14.0, weight: .thin)
                }
                it("Font should be systemfont") {
                    expect(defaultThinLabel.font).to(equal(dummyFont), description: "Font error!")
                }
                it("Color should be darkText") {
                    expect(defaultThinLabel.textColor).to(equal(.white), description: "TextColor error")
                }
            })

        }

        describe("RegularLabel") {
            context("label allocated without json", {
                var defaultRegularLabel: RegularLabel!
                var dummyFont: UIFont!
                beforeEach {
                    defaultRegularLabel = RegularLabel.init(frame: .zero)
                    dummyFont  = UIFont.systemFont(ofSize: 14, weight: .regular)
                }
                it("Font should be systemfont") {
                    expect(defaultRegularLabel.font).to(equal(dummyFont), description: "Font is not regular!")
                }
                it("Color should be darkText") {
                    expect(defaultRegularLabel.textColor).to(equal(.white), description: "Font default text is dark!!")
                }
            })
        }

        describe("BolLabel") {
            context("label allocated without json", {
                var defaultBoldLabel: BoldLabel!
                var dummyFont: UIFont!
                beforeEach {
                    defaultBoldLabel = BoldLabel.init(frame: .zero)
                    dummyFont  = UIFont.systemFont(ofSize: 14, weight: .bold)
                }
                context("check the default properties", {
                    it("Font should be systemfont") {
                        expect(defaultBoldLabel.font).to(equal(dummyFont), description: "Font is not bold!")
                    }
                    it("Color should be darkText") {
                        expect(defaultBoldLabel.textColor).to(equal(.white), description: "Font default text is black!!")
                    }
                })
            })
        }
    }
}
