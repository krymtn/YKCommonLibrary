//
//  BrandView.swift
//  ResearchApp
//
//  Created by Koray Metin on 4.09.2018.
//  Copyright © 2018 2GO-Mobile. All rights reserved.
//


import UIKit

class BrandView: BaseView {

    override func createNibName() -> String {
        return "WasteApps.Twente" + String(describing: type(of: self))
    }

}
