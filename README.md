# YLFPresentationController

[![CI Status](https://img.shields.io/travis/leavesster/YLFPresentationController.svg?style=flat)](https://travis-ci.org/leavesster/YLFPresentationController)
[![Version](https://img.shields.io/cocoapods/v/YLFPresentationController.svg?style=flat)](https://cocoapods.org/pods/YLFPresentationController)
[![License](https://img.shields.io/cocoapods/l/YLFPresentationController.svg?style=flat)](https://cocoapods.org/pods/YLFPresentationController)
[![Platform](https://img.shields.io/cocoapods/p/YLFPresentationController.svg?style=flat)](https://cocoapods.org/pods/YLFPresentationController)

This project is inspired by [PresentBottom](https://github.com/IkeBanPC/PresentBottom)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```Objective-C
UIViewController *controller = [[UIViewController alloc] init];
YLFTransitioningManager *transitioningManager = [[YLFTransitioningManager alloc] initWithViewController:controller];

[self presentViewController:controller animated:YES completion:nil];
```

## Requirements

iOS 8+

## Installation

YLFPresentationController is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
target 'Demo' do
    pod 'YLFPresentationController'
end
```

## TODO

- [ ] support custom transition

## Reference

* Blog

[ViewController Transition](https://github.com/seedante/iOS-Note/wiki/ViewController-Transition)  
[View Controller 转场](https://objccn.io/issue-5-3/)  
[WWDC 2013 Session笔记 - iOS7中的ViewController切换](https://onevcat.com/2013/10/vc-transition-in-ios7/)

* Apple

[UIViewControllerTransitionCoordinator](https://developer.apple.com/documentation/uikit/uiviewcontrollertransitioncoordinator?language=objc)  
[UIPresentationController](https://developer.apple.com/documentation/uikit/uipresentationcontroller?language=objc)  
[Creating Custom Presentations](https://developer.apple.com/library/archive/featuredarticles/ViewControllerPGforiPhoneOS/DefiningCustomPresentations.html#//apple_ref/doc/uid/TP40007457-CH25-SW1)

## License

YLFPresentationController is available under the MIT license. See the LICENSE file for more info.