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
    }
}

class YKRegularLabel: RegularLabel {

    override func appStyling() {
        let path : String = Bundle.main.path(forResource: "YKLabelConfig", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let configurator = try! JSONDecoder().decode(LabelConfigurators.self, from: data)
        self.configurator = configurator.regular!
    }
}

class YKBoldLabel: BoldLabel {

    override func appStyling() {
        let path : String = Bundle.main.path(forResource: "YKLabelConfig", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let configurator = try! JSONDecoder().decode(LabelConfigurators.self, from: data)
        self.configurator = configurator.bold!
    }
}

class YKBlockLabel: BoldLabel {
    override func appStyling() {
        let path : String = Bundle.main.path(forResource: "YKLabelConfig", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let configurator = try! JSONDecoder().decode(LabelConfigurators.self, from: data)
        self.configurator = configurator.block!
    }
}
