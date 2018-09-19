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
            var thinLabel: ThinLabel!
            var dummyFont: UIFont!
            beforeEach {
                thinLabel = ThinLabel.init(frame: .zero)
                dummyFont  = UIFont.systemFont(ofSize: thinLabel.font.pointSize, weight: .thin)
            }
            context("check the default properties", {
                it("Font should be systemfont") {
                    expect(thinLabel.labelFont).to(equal(dummyFont), description: "Font is not thin!")
                }
                it("Color should be darkText") {
                    expect(thinLabel.textColor).to(equal(.gray), description: "Font default text is .gray!!")
                }
            })
        }

        describe("RegularLabel") {
            var regularLabel: RegularLabel!
            var dummyFont: UIFont!
            beforeEach {
                regularLabel = RegularLabel.init(frame: .zero)
                dummyFont  = UIFont.systemFont(ofSize: regularLabel.font.pointSize, weight: .regular)
            }
            context("check the default properties", {
                it("Font should be systemfont") {
                    expect(regularLabel.labelFont).to(equal(dummyFont), description: "Font is not regular!")
                }
                it("Color should be darkText") {
                    expect(regularLabel.textColor).to(equal(.darkText), description: "Font default text is dark!!")
                }
            })
        }

        describe("BolLabel") {
            var boldLabel: BoldLabel!
            var dummyFont: UIFont!
            beforeEach {
                boldLabel = BoldLabel.init(frame: .zero)
                dummyFont  = UIFont.systemFont(ofSize: boldLabel.font.pointSize, weight: .bold)
            }
            context("check the default properties", {
                it("Font should be systemfont") {
                    expect(boldLabel.labelFont).to(equal(dummyFont), description: "Font is not bold!")
                }
                it("Color should be darkText") {
                    expect(boldLabel.textColor).to(equal(.black), description: "Font default text is black!!")
                }
            })
        }
    }
}
