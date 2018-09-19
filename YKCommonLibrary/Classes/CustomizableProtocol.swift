//
//  CustomizableProtocol.swift
//  YKStyleKit
//
//  Created by Koray Metin on 15.09.2018.
//  Copyright © 2018 Terrace. All rights reserved.
//

import Foundation

protocol StyleProtocol {
    func appStyling()
}

protocol CustomizableProtocol: StyleProtocol {
    func setup()
}
