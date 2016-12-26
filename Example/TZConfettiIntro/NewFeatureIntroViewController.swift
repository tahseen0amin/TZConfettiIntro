//
//  NewFeatureIntroViewController.swift
//  TZConfettiIntro
//
//  Created by Taseen Amin on 25/12/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import TZConfettiIntro

class NewFeatureIntroViewController: TZConfettiIntroViewController {
    
    override func viewDidLoad() {
        let page0 = CIPageView()
        page0.headingLabel?.text = "FIRST PAGE"
        page0.showNextButton = true
        page0.delayBeforeShowing = 2.0
        
        
        let page1 = CIPageView()
        page1.headingLabel?.text = "SECOND PAGE"
        page1.showNextButton = true
        page1.delayBeforeShowing = 2.0
        
        let page2 = CIPageView(customNib: UINib.init(nibName: "CustomPageView", bundle: nil))
        page2.headingLabel?.text = "THIRD PAGE"
        page2.showNextButton = true
        self.pages = [page0, page1, page2]
        
        super.viewDidLoad()
        
        self.scrollView.scrollEnabled = false
        self.nextButton.backgroundColor = UIColor.blueColor()
        self.nextButton.tintColor = UIColor.whiteColor()
        self.pageControl.hidden = true
    }

}
