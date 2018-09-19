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

public class BaseButton: UIButton, StyleProtocol {

    var type: BaseButtonType!

    var cornerRadius: CGFloat!
    var bgColor: UIColor!
    var textColor: UIColor!
    var borderColor: CGColor!
    var borderWidth: CGFloat!

    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        appStyling()
        setupButton()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.appStyling()
        setupButton()
    }

    func setupButton() {

        switch type {
        case .borderline:
            bgColor = .clear
            textColor = .black
            borderColor = UIColor.brown.cgColor
        case .shadow:
            bgColor = .clear
            textColor = .clear
            borderColor = UIColor.clear.cgColor
        default:
            bgColor = UIColor.blue
            textColor = UIColor.white
            borderColor = UIColor.clear.cgColor
        }

        self.titleLabel!.font = UIFont.systemFont(ofSize: self.titleLabel!.font.pointSize, weight: .regular)

        self .layer.masksToBounds = true
        self .layer.cornerRadius  = 5
        self .layer.borderWidth = 1
        self .layer.borderColor = self.borderColor

        self .setTitleColor(self.textColor, for: .normal)
        //self .setBackgroundImage(UIImage().colorFromImage(colorObject.ButtonColors!.buttonBackground!.UIColor), for: UIControlState.normal)
        self .setTitleColor(self.textColor, for: UIControlState.highlighted)
        //self .setBackgroundImage(UIImage().colorFromImage(colorObject.ButtonColors!.buttonBackground!.UIColor(0.8)), for: UIControlState.highlighted)
        self .setTitleColor(self.textColor, for: UIControlState.selected)
        //self .setBackgroundImage(UIImage().colorFromImage(colorObject.ButtonColors!.buttonBackground!.UIColor(0.8)), for: UIControlState.highlighted)
    }

    func appStyling() {
        self.type = BaseButtonType.normal
    }
}
