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

    func decode<T>(modelType: T.Type, data: Data) throws -> T where T : Decodable {
        guard let myStruct = try? JSONDecoder().decode(modelType, from: data) else {
            throw ConfiguratorError.decoderCodingKeyError
        }
        return myStruct
    }

    override func spec() {
        describe("Button") {
            context("button allocated without json", {
                var defaultButton: YKBaseButton!
                let defaultConfigurator = BaseButtonConfigurator()
                beforeEach {
                    defaultButton = YKBaseButton.init(frame: .zero)
                }
                it("bordercolor should be white") {
                  expect(defaultButton.layer.borderColor).to(equal(defaultConfigurator.borderColor.cgColor))
                }
            })
            context("button allocated local json", {
                var buttonConfigPath: String?
                var buttonConfigData: Data?
                var customButton: YKBaseButton!
                var configurator: BaseButtonConfigurator!
                beforeEach {
                    buttonConfigPath = Bundle.main.path(forResource: ConfigJSONFiles.button.rawValue, ofType: "json")!
                    buttonConfigData = try! Data(contentsOf: URL(fileURLWithPath: buttonConfigPath!))
                    configurator = try! self.decode(modelType: BaseButtonConfigurator.self, data: buttonConfigData!)
                    customButton = YKBaseButton.init(frame: .zero, config: configurator)
                }
                it("border color", closure: {
                    expect(customButton.layer.borderColor).to(equal(configurator.borderColor.cgColor))
                })

            })
        }
    }
}


