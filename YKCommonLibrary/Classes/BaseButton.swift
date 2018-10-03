//
//  BaseButton.swift
//  YKStyleKit
//
//  Created by Koray Metin on 15.09.2018.
//  Copyright © 2018 Terrace. All rights reserved.
//

import UIKit

public enum BaseButtonType {
    case normal
    case borderline
    case shadow
}

//typealias BaseButtonProperties = (bgColor: UIColor, textColor: UIColor, borderColor: CGColor, borderWidth: CGFloat)

open class BaseButton: UIButton, CustomizableProtocol {

    public var configurator = BaseButtonConfigurator()

    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        appStyling()
        setup()
    }
    
    public init(frame: CGRect, config: BaseButtonConfigurator = BaseButtonConfigurator()) {
        super.init(frame: frame)
        configurator = config
        appStyling()
        setup()
    }

    open func setup() {

        self.titleLabel!.font = configurator.font

        self.layer.masksToBounds = true
        self.layer.cornerRadius  = configurator.cornerRadius
        self.layer.borderWidth = configurator.borderWidth
        self.layer.borderColor = configurator.borderColor.cgColor

        self.setTitleColor(configurator.textColor, for: .normal)
        self.setBackgroundImage(configurator.backgroundColor.colorFromImage(), for: .normal)
    }

    open func appStyling() {}
}

