//
//  BaseTextField.swift
//  YKStyleKit
//
//  Created by Koray Metin on 15.09.2018.
//  Copyright © 2018 Terrace. All rights reserved.
//

import UIKit

open class BaseTextField: UITextField, CustomizableProtocol {

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

        self.layer.masksToBounds = true
        self.layer.cornerRadius = configurator.cornerRadius
        self.layer.borderWidth = configurator.borderWidth
        self.layer.borderColor = configurator.borderColor.cgColor
    }
    open func appStyling() { }
}
