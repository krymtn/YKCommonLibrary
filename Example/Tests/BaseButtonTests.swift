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
import UIKit
@testable import YKCommonLibrary_Example
import YKCommonLibrary

class BaseButtonTests: QuickSpec {

    override func spec() {
        describe("Borderline button") {
            var borderlineButton: YKBaseButton!
            beforeEach { borderlineButton = YKBaseButton.init(frame: .zero) }
            context("Check the values if button is initilized", {
                it("bordercolor should be white") {
                    expect(borderlineButton.layer.borderColor).to(equal(UIColor.white.cgColor))
                }
            })
        }
    }
}


