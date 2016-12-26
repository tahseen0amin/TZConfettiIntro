//
//  ViewController.swift
//  TZConfettiIntro
//
//  Created by Taseen on 12/25/2016.
//  Copyright (c) 2016 Taseen. All rights reserved.
//

import UIKit
import TZConfettiIntro

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /// GET BUNDLE TO LOAD NIB
        let path = Bundle(for: CIPageView.self).path(forResource: "TZConfettiIntro", ofType: "bundle")
        let bundle = Bundle(path: path!)
        let controller = NewFeatureIntroViewController(nibName: "TZConfettiIntroViewController", bundle: bundle)
        self.navigationController?.pushViewController(controller, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

