//
//  BaseLabel.swift
//  YKStyleKit
//
//  Created by Koray Metin on 15.09.2018.
//  Copyright © 2018 Terrace. All rights reserved.
// cc

import UIKit

/// Thin Label declaration
class ThinLabel: UILabel, StyleProtocol {

    var labelFont: UIFont!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.appStyling()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.appStyling()
    }

    func appStyling() {
        labelFont = UIFont.systemFont(ofSize: self.font.pointSize, weight: .thin)
        self.font = labelFont
        self.textColor = .gray
    }
}

/// Regular Label declaration
class RegularLabel: UILabel, StyleProtocol {

    var labelFont: UIFont!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.appStyling()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.appStyling()
    }

    func appStyling() {
        labelFont = UIFont.systemFont(ofSize: self.font.pointSize, weight: .regular)
        self.font = labelFont
        self.textColor = .darkText
    }
}

/// Bold Label declaration
class BoldLabel: UILabel, StyleProtocol {

    var labelFont: UIFont!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.appStyling()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.appStyling()
    }

    func appStyling() {
        labelFont = UIFont.systemFont(ofSize: self.font.pointSize, weight: .bold)
        self.font = labelFont
        self.textColor = .black
    }
}

