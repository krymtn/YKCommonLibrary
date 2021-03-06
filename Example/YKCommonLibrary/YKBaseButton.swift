//
//  YKBaseButton.swift
//  YKCommonLibrary_Example
//
//  Created by Koray Metin on 20.09.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import YKCommonLibrary

class YKBaseButton: BaseButton {

    override func appStyling() {
        let path : String = Bundle.main.path(forResource: "YKButtonConfig", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let configurator = try! JSONDecoder().decode(BaseButtonConfigurator.self, from: data)
        self.configurator = configurator

        if let fontname = configurator.font {
            self.titleLabel!.font = UIFont.init(name: fontname, size: self.titleLabel!.font.pointSize)
        } else {
            self.titleLabel!.font = UIFont.init(name: "PingFangHK-Thin", size: self.titleLabel!.font.pointSize)
        }
    }
}
