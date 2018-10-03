//
//  SplashVC.swift
//  YKCommonLibrary_Example
//
//  Created by Koray Metin on 2.10.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    let splashResource = "SplashJSON"
    
    @IBOutlet weak var splashView: SplashView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        var splash = Splash()
        if let path : String = Bundle.main.path(forResource: splashResource, ofType: "json") {
            if let data: Data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                if let customSplash = try? JSONDecoder().decode(Splash.self, from: data) {
                    splash = customSplash
                }
            }
        }
        let splashVM = SplashViewModel.init(splash: splash)
        self.splashView.renderUI(splashViewModel: splashVM)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
