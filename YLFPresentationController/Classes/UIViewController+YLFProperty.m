//
//  UIViewController+YLFProperty.m
//  Pods-YLFPresentationController_Example
//
//  Created by yleaf on 2018/9/16.
//

#import "UIViewController+YLFProperty.h"
#import <objc/message.h>

static void *UIViewControllerYLFTrasnsitioningKey = &UIViewControllerYLFTrasnsitioningKey;

@implementation UIViewController (YLFProperty)

- (YLFTransitioningManager *)YLF_manager
{
    return objc_getAssociatedObject(self, UIViewControllerYLFTrasnsitioningKey);
}

- (void)setYLF_manager:(YLFTransitioningManager *)YLF_manager
{
    objc_setAssociatedObject(self, UIViewControllerYLFTrasnsitioningKey, YLF_manager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
