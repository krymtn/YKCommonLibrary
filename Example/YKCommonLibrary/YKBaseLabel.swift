//
//  YKBaseLabel.swift
//  YKCommonLibrary_Example
//
//  Created by Koray Metin on 21.09.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import YKCommonLibrary

class YKThinLabel: ThinLabel {

    override func appStyling() {
        let path : String = Bundle.main.path(forResource: "YKLabelConfig", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let configurator = try! JSONDecoder().decode(LabelConfigurators.self, from: data)
        self.configurator = configurator.thin!

        if let fontname = self.configurator.font {
            self.font = UIFont.init(name: fontname, size: self.font.pointSize)
        } else {
            self.font = UIFont.init(name: "PingFangHK-Thin", size: self.font.pointSize)
        }
    }
}

class YKRegularLabel: RegularLabel {

    override func appStyling() {
        let path : String = Bundle.main.path(forResource: "YKLabelConfig", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let configurator = try! JSONDecoder().decode(LabelConfigurators.self, from: data)
        self.configurator = configurator.regular!

        if let fontname = self.configurator.font {
            self.font = UIFont.init(name: fontname, size: self.font.pointSize)
        } else {
            self.font = UIFont.init(name: "PingFangHK-Regular", size: self.font.pointSize)
        }
    }
}

class YKBoldLabel: BoldLabel {

    override func appStyling() {
        let path : String = Bundle.main.path(forResource: "YKLabelConfig", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let configurator = try! JSONDecoder().decode(LabelConfigurators.self, from: data)
        self.configurator = configurator.bold!

        if let fontname = self.configurator.font {
            self.font = UIFont.init(name: fontname, size: self.font.pointSize)
        } else {
            self.font = UIFont.init(name: "PingFangHK-Semibold", size: self.font.pointSize)
        }
    }
}

class YKBlockLabel: BoldLabel {
    override func appStyling() {
        let path : String = Bundle.main.path(forResource: "YKLabelConfig", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let configurator = try! JSONDecoder().decode(LabelConfigurators.self, from: data)
        self.configurator = configurator.block!

        if let fontname = self.configurator.font {
            self.font = UIFont.init(name: fontname, size: self.font.pointSize)
        } else {
            self.font = UIFont.init(name: "PingFangHK-Regular", size: self.font.pointSize)
        }
    }
}
