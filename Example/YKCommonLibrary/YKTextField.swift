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
        self.configurator = AppConfigurator.shared.TEXTFIELDCONFIG
    }
}
