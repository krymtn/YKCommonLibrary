//
//  ConfiguratorTests.swift
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

class ConfiguratorTests: QuickSpec {
    override func spec() {
        describe("Button configuration") {
            let path : String = Bundle.main.path(forResource: "YKButtonConfig", ofType: "json")!
            it("path not to be nil") {
                expect(path).notTo(beNil())
            }
            let data = try! Data(contentsOf: URL(fileURLWithPath: path))
            let configurator = try! JSONDecoder().decode(BaseButtonConfigurator.self, from: data)
            it("button config not to be nil") {
                expect(configurator).notTo(beNil())
            }
            context("check the config values", {
                it("button background Hex") {
                    expect(configurator.color?.backgroundHex).to(equal("F39203"))
                }
                it("shadow check") {
                    expect(configurator.color?.shadowHex).to(beNil())
                }
                it("radius is nil?") {
                    expect(configurator.cornerRadius).to(equal(CGFloat(7.5)))
                }
                it("borderwith will be 1") {
                    expect(configurator.borderWidth).to(equal(CGFloat(2.0)))
                }
            })
        }

        describe("Label configuration") {
            let path : String = Bundle.main.path(forResource: "YKLabelConfig", ofType: "json")!
            it("path not to be nil") {
                expect(path).notTo(beNil())
            }
            let data = try! Data(contentsOf: URL(fileURLWithPath: path))
            let configurator = try! JSONDecoder().decode(LabelConfigurators.self, from: data)
            it("labels config not to be nil") {
                expect(configurator.thin?.color?.textHex).notTo(beNil())
                expect(configurator.regular?.color?.textHex).notTo(beNil())
                expect(configurator.bold?.shape?.fontName).to(beNil())
            }
        }
    }
}
