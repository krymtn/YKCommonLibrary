//
//  YKTextView.swift
//  YKCommonLibrary_Example
//
//  Created by Koray Metin on 23.11.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import YKCommonLibrary

class YKTextView: BaseTextView {

    override func appStyling() {
        let path : String = Bundle.main.path(forResource: "YKTextViewConfig", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let configurator = try! JSONDecoder().decode(TextViewConfigurator.self, from: data)
        self.configurator = configurator

        if let fontname = self.configurator.font {
            self.font = UIFont.init(name: fontname, size: self.font!.pointSize)
        } else {
            self.font = UIFont.init(name: "PingFangHK-Thin", size: self.font!.pointSize)
        }
    }
}
