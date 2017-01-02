//
//  ConfettiItroViewController.swift
//  Confeti-Intro
//
//  Created by Taseen Amin on 18/12/2016.
//  Copyright © 2016 Taazuh. All rights reserved.
//

import UIKit

open class TZConfettiIntroViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet public weak var scrollView: UIScrollView!
    @IBOutlet public weak var pageControl: UIPageControl!
    @IBOutlet public weak var nextButton: UIButton! {
        didSet {
            self.nextButton.isHidden = true
            self.nextButton.addTarget(self, action: #selector(self.nextClicked), for: .touchUpInside)
        }
    }
    public var pages : [CIPageView]! = []
    
    public var currentPage : CIPageView! {
        didSet {
            self.setupPage()
        }
    }
    
    private var confettiView : SAConfettiView!
    public var confettiType : ConfettiType = ConfettiType.Confetti
    open var showConfetti = true
    
    public class func getControllerObject() -> TZConfettiIntroViewController {
        let nameNib = "TZConfettiIntroViewController"
        let path = Bundle(for: TZConfettiIntroViewController.self).path(forResource: "TZConfettiIntro", ofType: "bundle")
        let bundle = Bundle(path: path!)
        let object = TZConfettiIntroViewController.init(nibName: nameNib, bundle: bundle)
        return object
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        self.setupScrollView()
        self.confettiView = SAConfettiView(frame: self.scrollView.bounds)
        self.scrollView.addSubview(self.confettiView)
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if showConfetti {
            self.confettiView.type = self.confettiType
            self.confettiView.startConfetti()
        }
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupScrollView() {
        self.scrollView.delegate = self
        self.scrollView.isScrollEnabled = true
        self.scrollView.isPagingEnabled = true
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.showsHorizontalScrollIndicator = false
        self.pageControl.numberOfPages = self.pages.count
        self.pageControl.currentPage = 0
        //add pages
        var index = 0
        while index < self.pages.count {
            self.scrollView.addSubview(self.pages[index])
            self.pages[index].pageNumber = index
            index += 1
        }
        self.view.sendSubview(toBack: self.scrollView)
        self.currentPage = self.pages[0]
    }
    
    
    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let size = scrollView.bounds.size
        let pageCount = CGFloat(self.pages.count)
        self.scrollView.contentSize = CGSize(width: size.width*pageCount, height: size.height)
        self.scrollView.contentInset = UIEdgeInsets.zero
        for p1 in pages {
            p1.frame = CGRect(x: size.width*CGFloat(p1.pageNumber), y: 0, width: size.width, height: size.height)
        }
    }
    
    //MARK: Scrollview
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageControl.currentPage = Int(currentPage)
        self.currentPage = self.pages[Int(currentPage)]
    }
    
    private func setupPage(){
        self.nextButton.isHidden = true
        self.nextButton.setTitle("", for: .normal)
        if self.currentPage.showNextButton {
            self.perform(#selector(self.shownextButton), with: nil, afterDelay: self.currentPage.delayBeforeShowing)
        }
    }
    
    @objc private func shownextButton(){
        self.nextButton.isHidden = false
        self.nextButton.setTitle(self.currentPage.nextButtonTitle, for: .normal)
    }
    
    public func skipOrLastPageButtonClicked(){
        if self.navigationController != nil {
            self.navigationController!.popViewController(animated: true)
        } else if self.presentingViewController != nil {
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc private func nextClicked(){
        
        if self.currentPage.pageNumber == self.pages.count-1 {
            // finish button clicked
            self.skipOrLastPageButtonClicked()
        } else {
            let nextPageIndex = self.currentPage.pageNumber + 1
            // Change the indicator
            self.pageControl.currentPage = nextPageIndex
            self.currentPage = self.pages[nextPageIndex]
            self.scrollView.scrollRectToVisible(self.currentPage.frame, animated: true)
        }
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // update the frame of confetti View
        var frame = self.confettiView.frame
        frame.origin = scrollView.contentOffset
        self.confettiView.frame = frame
    }
    
    public func startConfetti(){
        if self.confettiView.isActive() == false {
            self.confettiView.startConfetti()
        }
    }
    
    public func stopConfetti(){
        self.confettiView.stopConfetti()
    }

}
