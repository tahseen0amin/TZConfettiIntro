//
//  CIPageView.swift
//  Confeti-Intro
//
//  Created by Taseen Amin on 17/12/2016.
//  Copyright © 2016 Taazuh. All rights reserved.
//

import UIKit

public class CIPageView: UIView {
    
    @IBOutlet public var contentView : UIView?
    @IBOutlet public weak var imageView: UIImageView?
    @IBOutlet public weak var headingLabel: UILabel?
    @IBOutlet public weak var bodyLabel: UILabel?
    @IBOutlet public var confitiView : UIView?
    
    public var pageNumber:Int = 0
    public var showNextButton = false
    public var delayBeforeShowing : NSTimeInterval = 0.0
    public var nextButtonTitle = "Next"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    public convenience init(customNib: UINib?) {
        self.init()
        if customNib != nil {
            let view = customNib?.instantiateWithOwner(self, options: nil)[0] as! UIView
            contentView = view
            self.addSubViewWithConstraint(contentView!, inset: UIEdgeInsetsZero)
        } else {
            self.commonInit()
        }
        
    }
    
    private func commonInit() {
        let path = NSBundle.init(forClass: CIPageView.self).pathForResource("TZConfettiIntro", ofType: "bundle")
        let bundle = NSBundle(path: path!)
        
        let view = bundle?.loadNibNamed("CIPageView", owner: self, options: nil)![0] as! UIView
        contentView = view
        self.addSubViewWithConstraint(contentView!, inset: UIEdgeInsetsZero)
    }
    
    /// Do any time of changes here 
    public func setupPage(){
    }
    
}

extension UIView {
    
    func addSubViewWithConstraint(subview:UIView, inset:UIEdgeInsets) {
        let view = self
        view.addSubview(subview)
        subview.frame = CGRect(x: inset.left, y: inset.top, width: view.frame.size.width-inset.right, height: view.frame.size.height-inset.bottom)
        view.clipsToBounds = true
        
        view.addConstraint(NSLayoutConstraint.init(item: subview, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1, constant: inset.left))
        
        view.addConstraint(NSLayoutConstraint.init(item: subview, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1, constant: inset.right))
        
        view.addConstraint(NSLayoutConstraint.init(item: subview, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1, constant: inset.top))
        
        view.addConstraint(NSLayoutConstraint.init(item: subview, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1, constant: inset.bottom))
}

}
