//
//  BaseView.swift
//  ResearchApp
//
//  Created by Koray Metin on 4.09.2018.
//  Copyright © 2018 2GO-Mobile. All rights reserved.
//

import UIKit

class BaseView: UIView {
    var view: UIView!
    var nibName: String = String()
    var didSetup = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        appStyling()
    }

    func setup() {
        view = loadViewFromNib()
        view.frame = self.bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(view)
        didSetup = true
    }

    func appStyling() {self.view.backgroundColor = .purple}

    func createNibName() -> String {
        return String(describing: type(of: self))
    }

    func loadViewFromNib() -> UIView {
        // grabs the appropriate bundle
        nibName = self.createNibName()
        print("nib", nibName)
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}
