//
//  YLFTransitioningObject.m
//  CustomPresentationController
//
//  Created by leavesster on 2018/9/9.
//

#import "YLFTransitioningManager.h"
#import "YLFPresentationController.h"
#import "YLFDismissAnimation.h"
#import "YLFBouncePresentAnimation.h"
#import "UIViewController+YLFProperty.h"

@interface YLFTransitioningManager() <YLFPresentationProtocol>

@end

@implementation YLFTransitioningManager

- (instancetype)initWithViewController:(UIViewController *)vc
{
    if (self = [super init]) {
//        _presentAnimation = [[YLFBouncePresentAnimation alloc] init];
//        _dismissAnimation = [[YLFDismissAnimation alloc] init];
        vc.modalPresentationStyle = UIModalPresentationCustom;
        vc.transitioningDelegate = self;
        vc.YLF_manager = self;
    }
    return self;
}

#pragma mark - YLFPresentationProtocol
- (CGFloat)presentedViewRatio
{
    if (self.raitoBlock) {
        return self.raitoBlock();
    }
    return 2.0 / 3.0;
}

- (CGFloat)presentedViewHeight
{
    if (self.heightBlock) {
        return self.heightBlock();
    }
    return 0;
}

#pragma mark - UIViewControllerTransitioningDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source;
{
    return self.presentAnimation;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed;
{
    return self.dismissAnimation;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator;
{
    return self.presentInteractiveController;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator;
{
    return self.dismissInteractiveController;
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    YLFPresentationController *controller = [[YLFPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    controller.customPresentationDelegate = self;
    return controller;
}

@end
