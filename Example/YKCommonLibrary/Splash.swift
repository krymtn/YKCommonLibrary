//
//  Splash.swift
//  YKCommonLibrary_Example
//
//  Created by Koray Metin on 2.10.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

protocol SplashProtocol {
    var labelText: String { get }
    var spinnerColor: UIColor { get }
    var titleColor: UIColor { get }
}

class Splash : Decodable {
    var appIconPath: String = "default_appIcon"
    var isLaunchButtonEnabled: Bool = false
    var spinnerHex: String?
    var titleHex: String?
    var titleText: String?

    enum CodingKeys: String, CodingKey {
        case titleText = "text"
        case titleHex = "textColor"
    }

    init() { }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        titleText = try container.decodeIfPresent(String.self, forKey: .titleText)
        titleHex = try container.decodeIfPresent(String.self, forKey: .titleHex)
    }
}


