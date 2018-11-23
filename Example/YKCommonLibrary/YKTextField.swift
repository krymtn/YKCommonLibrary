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

        if let fontname = self.configurator.font {
            self.font = UIFont.init(name: fontname, size: self.font!.pointSize)
        } else {
            self.font = UIFont.init(name: "PingFangHK-Thin", size: self.font!.pointSize)
        }
    }
}
