//
//  BaseTextField.swift
//  YKStyleKit
//
//  Created by Koray Metin on 15.09.2018.
//  Copyright © 2018 Terrace. All rights reserved.
//

import UIKit

open class BaseTextField: UITextField, StyleProtocol, CustomizableProtocol {

    public var configurator = TextFieldConfigurator()

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
        self.textColor = configurator.textColor
        self.backgroundColor = configurator.backgroundColor
    }
    open func appStyling() { }
}
