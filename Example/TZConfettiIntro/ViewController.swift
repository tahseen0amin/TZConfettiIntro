//
//  ViewController.swift
//  TZConfettiIntro
//
//  Created by Taseen on 12/25/2016.
//  Copyright (c) 2016 Taseen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let controller = NewFeatureIntroViewController(nibName: "TZConfettiIntroViewController", bundle: Bundle.main)
        self.navigationController?.pushViewController(controller, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

