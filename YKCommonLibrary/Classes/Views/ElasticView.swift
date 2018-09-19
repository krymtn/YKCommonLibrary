//
//  ElasticView.swift
//  ResearchApp
//
//  Created by Koray Metin on 4.09.2018.
//  Copyright © 2018 2GO-Mobile. All rights reserved.
//

import UIKit

class ElasticView: BaseView {

    override func createNibName() -> String {
        return String(describing: type(of: self)) + ((UIDevice.current.userInterfaceIdiom == .phone) ?"Phone" :"Pad")
    }

}
