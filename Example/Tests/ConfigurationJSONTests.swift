//
//  ConfigurationJSONTests.swift
//  YKCommonLibrary_Tests
//
//  Created by Koray Metin on 25.09.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble
import YKCommonLibrary
@testable import YKCommonLibrary_Example

class ConfigurationJSONTests: QuickSpec {

    func decode<T>(modelType: T.Type, data: Data) throws -> T where T : Decodable {
        guard let myStruct = try? JSONDecoder().decode(modelType, from: data) else {
            throw ConfiguratorError.decoderCodingKeyError
        }
        return myStruct
    }

    override func spec() {

        describe("Test FilePath's") {
            var buttonConfigPath: String?
            var labelConfigPath: String?

            var buttonConfigData: Data?
            var labelConfigData: Data?

            var buttonConfigurator: BaseButtonConfigurator?
            var labelConfigurator: LabelConfigurators?

            context("Check JSON files exist", {
                buttonConfigPath = Bundle.main.path(forResource: ConfigJSONFiles.button.rawValue, ofType: "json")
                labelConfigPath = Bundle.main.path(forResource: ConfigJSONFiles.label.rawValue, ofType: "json")
                it("buttonConfigPath is not nil!", closure: {
                    expect(buttonConfigPath).notTo(beNil())
                })
                it("labelConfigPath is not nil!", closure: {
                    expect(labelConfigPath).notTo(beNil())
                    //expect {_ = try appConfigutator.configuratorData(fileName: "YKButtonConfig")}.notTo(throwError())
                })
            })

            context("Check JSON datas are ok", {
                buttonConfigData = try? Data(contentsOf: URL(fileURLWithPath: buttonConfigPath!))
                it("buttonConfigData not to beNil", closure: {
                    expect(buttonConfigData).notTo(beNil())
                })
                labelConfigData = try? Data(contentsOf: URL(fileURLWithPath: labelConfigPath!))
                it("labelConfigData not to beNil", closure: {
                    expect(labelConfigData).notTo(beNil())
                })
            })

            context("Check configuration objects", {
                it("buttonConfigurator properties") {
                    expect { buttonConfigurator = try self.decode(modelType: BaseButtonConfigurator.self, data: buttonConfigData!) }.notTo(throwError())
                    expect(buttonConfigurator?.color?.backgroundHex).to(equal("F39203"))
                }

                it("labelConfigurator properties") {
                    expect { labelConfigurator = try self.decode(modelType: LabelConfigurators.self, data: labelConfigData!) }.notTo(throwError())
                    expect(labelConfigurator?.thin?.color?.textHex).to(equal("DDDDDD"))
                }
            })

        }

    }
}
