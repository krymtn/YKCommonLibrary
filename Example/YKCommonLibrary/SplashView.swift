//
//  SplashView.swift
//  YKCommonLibrary_Example
//
//  Created by Koray Metin on 2.10.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class SplashView: YKBaseView {

    @IBOutlet weak var appIconImageView: UIImageView?
    @IBOutlet weak var textLabel: YKBoldLabel?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?

    override func appStyling() {
        self.view.backgroundColor = .groupTableViewBackground
    }

    func renderUI(splashViewModel: SplashViewModel) {
        if let icon = appIconImageView {
            if let image = UIImage(named: (splashViewModel.splash?.appIconPath)!) {
                icon.image = image
            }
        }
        if let label = textLabel {
            label.textColor = splashViewModel.titleColor
            label.text = splashViewModel.labelText
        }
        if let spinner = activityIndicator {
            spinner.color = splashViewModel.spinnerColor
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                spinner.stopAnimating()
            }
        }
    }
}
