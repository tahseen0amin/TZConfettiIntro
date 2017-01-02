# TZConfettiIntro

#[![CI Status](http://img.shields.io/travis/Taseen/TZConfettiIntro.svg?style=flat)](https://travis-ci.org/Taseen/TZConfettiIntro)
[![Version](https://img.shields.io/cocoapods/v/TZConfettiIntro.svg?style=flat)](http://cocoapods.org/pods/TZConfettiIntro)
[![License](https://img.shields.io/cocoapods/l/TZConfettiIntro.svg?style=flat)](http://cocoapods.org/pods/TZConfettiIntro)
[![Platform](https://img.shields.io/cocoapods/p/TZConfettiIntro.svg?style=flat)](http://cocoapods.org/pods/TZConfettiIntro)

<p align="center">
  <img src="https://github.com/tahseen0amin/TZConfettiIntro/tree/master/Example/TZConfettiIntro.gif" alt="confetti" width="375" height="568">
</p>
## Usage
Subclass TZConfettiIntroViewController
```swift
class NewFeatureIntroViewController: TZConfettiIntroViewController
```
In viewDidLoad() method, before super.viewDidLoad(). Create CIPageView as needed. You can use the default nib or create your own nib and pass it
```swift
override func viewDidLoad() {
let page0 = CIPageView()
page0.headingLabel?.text = "FIRST PAGE"
page0.bodyLabel?.text = "You can write anything here....\n New line also looks cool"
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

self.scrollView.isScrollEnabled = false
self.nextButton.backgroundColor = UIColor.init(red: 0.75, green: 0.65, blue: 0.32, alpha: 0.8)
self.nextButton.tintColor = UIColor.white
self.pageControl.isHidden = true

}
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation

TZConfettiIntro is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

#### ⚠️ **To use with Swift 2.3 please ensure you are using == 1.0.3** ⚠️ 
#### ⚠️ **To use with Swift 3.x please ensure you are using >= 2.0.4** ⚠️ 

```ruby
pod "TZConfettiIntro"
```

## Contribution

Thanks to Sudeep Agarwal whose [SAConfettiView](https://www.google.com "SAConfettiView") made this project easy to complete. Please check his documentation to change the confetti type.


## Author

Taseen, tahseen0amin@gmail.com

## License
Copyright (c) 2017 Tasin Zarkoob
TZConfettiIntro is available under the MIT license. See the LICENSE file for more info.
