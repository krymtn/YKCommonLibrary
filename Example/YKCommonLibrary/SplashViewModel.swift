//
//  SplashViewModel.swift
//  YKCommonLibrary_Example
//
//  Created by Koray Metin on 2.10.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

struct SplashViewModel {
    var splash: Splash?

    init(splash: Splash?) {
        self.splash = splash
    }
}

extension SplashViewModel: SplashProtocol {
    
    var labelText: String {
        guard let text = splash?.titleText else { return "DefaultApp Description..." }
        return text
    }
    var spinnerColor: UIColor {
        guard let color = splash?.spinnerHex?.UIColor else { return .purple }
        return color
    }
    var titleColor: UIColor {
        guard let color = splash?.titleHex?.UIColor else { return .black }
        return color
    }
}


