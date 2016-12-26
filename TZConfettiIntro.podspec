#
# Be sure to run `pod lib lint TZConfettiIntro.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TZConfettiIntro'
  s.version          = '2.0.0'
  s.summary          = 'A short description of TZConfettiIntro.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        A Simple Intro View Controller with confetti animation. Thanks to Sudeep Agarwal, I didn't have to write code for generating confetti. I used his library (SAConfettiView) in my project
                       DESC

  s.homepage         = 'https://github.com/tahseen0amin/TZConfettiIntro'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Taseen' => 'tahseen0amin@gmail.com' }
  s.source           = { :git => 'https://github.com/tahseen0amin/TZConfettiIntro.git', :tag => s.version.to_s }
 s.social_media_url = 'https://twitter.com/taseenAmin'

  s.ios.deployment_target = '8.0'

  s.source_files = 'TZConfettiIntro/Classes/**/*'
  
   s.resource_bundles = {
     'TZConfettiIntro' => ['TZConfettiIntro/Assets/*.png','TZConfettiIntro/Assets/*.xib']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'QuartzCore'
# s.dependency 'SAConfettiView'
end
