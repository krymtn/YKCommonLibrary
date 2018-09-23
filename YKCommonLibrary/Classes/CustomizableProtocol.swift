//
//  CustomizableProtocol.swift
//  YKStyleKit
//
//  Created by Koray Metin on 15.09.2018.
//  Copyright © 2018 Terrace. All rights reserved.
//

import Foundation

public protocol StyleProtocol {
    func appStyling()
}

public protocol CustomizableProtocol: StyleProtocol {
    func setup()
}

public protocol Colorable {
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
    var borderColor: UIColor { get }
}

public protocol Shapeable {
    var cornerRadius: CGFloat { get }
    var borderWidth: CGFloat { get }
    var font: UIFont { get }
}
