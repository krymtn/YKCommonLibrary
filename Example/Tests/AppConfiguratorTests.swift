//
//  AppConfiguratorTests.swift
//  YKCommonLibrary_Tests
//
//  Created by Koray Metin on 22.09.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble
import YKCommonLibrary
@testable import YKCommonLibrary_Example

class AppConfiguratorTests: QuickSpec {
    override func spec() {
        describe("AppConfigurator initilized") {
            let appConfigurator = AppConfigurator()
            it("appconfirator", closure: {
                expect(appConfigurator).notTo(beNil())
            })


            describe("Generic Decodable Tests", {
                context("Load Button config json is valid?", {
                    let data = try! appConfigurator.configuratorData(fileName: "YKButtonConfig")
                    appConfigurator.BUTTONCONFIG = try! appConfigurator.decode(modelType: BaseButtonConfigurator.self, data: data)
                    it("data") {
                        expect {_ = try appConfigurator.configuratorData(fileName: "YKButonConfig")}.to(throwError(ConfiguratorError.invalidJSON))
                    }

                    it("configurator") {
                        //expect {_ = try appConfigurator.decode(modelType: BaseButtonConfigurator.self, data: data)}.to(throwError(errorType: ConfiguratorError.self))
                    }

                    
                    describe("Represent the BUTTONCONFIG properties", {
                        it("background should be F39203") {
                            expect(appConfigurator.BUTTONCONFIG.color?.backgroundHex).to(equal("F39203"))
                        }
                    })
                })
            })
        }
    }
}
