//
//  BaseLabel.swift
//  YKStyleKit
//
//  Created by Koray Metin on 15.09.2018.
//  Copyright © 2018 Terrace. All rights reserved.
// cc

import UIKit

/// Thin Label declaration
open class ThinLabel: UILabel, StyleProtocol, CustomizableProtocol {

    public var configurator = LabelConfigurator()

    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        appStyling()
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        appStyling()
        setup()
    }

    open func setup() {
        self.font = configurator.font
        self.textColor = configurator.textColor
        self.backgroundColor = configurator.backgroundColor
    }

    open func appStyling() { }
}

/// Regular Label declaration
open class RegularLabel: UILabel, StyleProtocol {

    public var configurator = LabelConfigurator()

    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        appStyling()
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        appStyling()
        setup()
    }

    open func setup() {
        self.font = configurator.font
        self.textColor = configurator.textColor
        self.backgroundColor = configurator.backgroundColor
    }

    open func appStyling() { }
}

/// Bold Label declaration
open class BoldLabel: UILabel, StyleProtocol {

    public var configurator = LabelConfigurator()

    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        appStyling()
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        appStyling()
        setup()
    }

    open func setup() {
        self.font = configurator.font
        self.textColor = configurator.textColor
        self.backgroundColor = configurator.backgroundColor
    }

    open func appStyling() { }
}

