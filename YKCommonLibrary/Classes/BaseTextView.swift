//
//  BaseTextView.swift
//  FBSnapshotTestCase
//
//  Created by Koray Metin on 23.11.2018.
//

import UIKit

open class BaseTextView: UITextView, CustomizableProtocol {

    public var configurator = TextViewConfigurator()

    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        appStyling()
        setup()
    }

    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: nil)
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
