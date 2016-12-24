//
//  CIPageView.swift
//  Confeti-Intro
//
//  Created by Taseen Amin on 17/12/2016.
//  Copyright © 2016 Taazuh. All rights reserved.
//

import UIKit

public class CIPageView: UIView {
    
    @IBOutlet var contentView : UIView?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet var confitiView : UIView?
    
    var pageNumber:Int = 0
    var showNextButton = false
    var delayBeforeShowing : TimeInterval = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.commonInit()
    }
    
    public func commonInit() {
        let view = Bundle.main.loadNibNamed("CIPageView", owner: self, options: nil)![0] as! UIView
        contentView = view
        self.addSubViewWithConstraint(subview: contentView!, inset: .zero)
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
        
        view.addConstraint(NSLayoutConstraint.init(item: subview, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: inset.left))
        
        view.addConstraint(NSLayoutConstraint.init(item: subview, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: inset.right))
        
        view.addConstraint(NSLayoutConstraint.init(item: subview, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: inset.top))
        
        view.addConstraint(NSLayoutConstraint.init(item: subview, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: inset.bottom))
}

}
