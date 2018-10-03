//
//  AppConfigurator.swift
//  YKCommonLibrary_Example
//
//  Created by Koray Metin on 22.09.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import YKCommonLibrary

enum ConfiguratorError: Error {
    case fileNotFound(name: String)
    case invalidJSON
    case decoderCodingKeyError
}

enum ConfigJSONFiles: String {
    case button = "YKButtonConfig"
    case label = "YKLabelConfig"
    case textfield = "YKTextFieldConfig"
}

class AppConfigurator: UIConfigElements {
    static let shared = AppConfigurator()
    var BUTTONCONFIG: BaseButtonConfigurator!
    var LABELCONFIG: LabelConfigurators!
    var TEXTFIELDCONFIG: TextFieldConfigurator!

    func setApp() throws { // throws error
        do {
            let buttonData = try configuratorData(fileName: ConfigJSONFiles.button.rawValue)
            AppConfigurator.shared.BUTTONCONFIG = try decode(modelType: BaseButtonConfigurator.self, data: buttonData)

            let labelData = try configuratorData(fileName: ConfigJSONFiles.label.rawValue)
            AppConfigurator.shared.LABELCONFIG = try decode(modelType: LabelConfigurators.self, data: labelData)

            let textFieldData = try configuratorData(fileName: ConfigJSONFiles.textfield.rawValue)
            AppConfigurator.shared.TEXTFIELDCONFIG = try decode(modelType: TextFieldConfigurator.self, data: textFieldData)
        }
    }
}

extension AppConfigurator {

    func configuratorData(fileName: String, bundle: Bundle = Bundle.main) throws -> Data {

        guard let path : String = Bundle.main.path(forResource: fileName, ofType: "json") else {
            throw ConfiguratorError.fileNotFound(name: fileName)
        }
        guard let data: Data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            throw ConfiguratorError.invalidJSON
        }

        return data
    }

    func decode<T>(modelType: T.Type, data: Data) throws -> T where T : Decodable {
        
        guard let myStruct = try? JSONDecoder().decode(modelType, from: data) else {
            throw ConfiguratorError.decoderCodingKeyError
        }
        return myStruct
    }
}


