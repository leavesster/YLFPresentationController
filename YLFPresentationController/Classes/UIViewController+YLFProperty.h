//
//  UIViewController+YLFProperty.h
//  Pods-YLFPresentationController_Example
//
//  Created by yleaf on 2018/9/16.
//

#import <UIKit/UIKit.h>
#import "YLFTransitioningManager.h"

@interface UIViewController (YLFProperty)
@property (nullable, nonatomic, strong) YLFTransitioningManager *YLF_manager;
@end
