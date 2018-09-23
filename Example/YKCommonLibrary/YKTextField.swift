//
//  YKTextField.swift
//  YKCommonLibrary_Example
//
//  Created by Koray Metin on 21.09.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import YKCommonLibrary

class YKTextField: BaseTextField {
    
    override func appStyling() {
        let path : String = Bundle.main.path(forResource: "YKTextFieldConfig", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let configurator = try! JSONDecoder().decode(TextFieldConfigurator.self, from: data)
        self.configurator = configurator
    }
}
