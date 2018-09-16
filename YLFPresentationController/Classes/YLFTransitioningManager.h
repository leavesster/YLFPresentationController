//
//  YLFTransitioningObject.h
//  CustomPresentationController
//
//  Created by leavesster on 2018/9/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLFTransitioningManager : NSObject<UIViewControllerTransitioningDelegate>

- (instancetype)initWithViewController:(UIViewController *)vc;

#pragma mark - UIViewControllerTransitioningDelegate Properties
@property (nullable, nonatomic, strong) NSObject<UIViewControllerAnimatedTransitioning>* presentAnimation;
@property (nullable, nonatomic, strong) NSObject<UIViewControllerAnimatedTransitioning>* dismissAnimation;
@property (nullable, nonatomic, strong) NSObject<UIViewControllerInteractiveTransitioning>* presentInteractiveController;
@property (nullable, nonatomic, strong) NSObject<UIViewControllerInteractiveTransitioning>* dismissInteractiveController;

#pragma mark - View

@property (nullable, nonatomic, strong) UIView *presentedHeaderView;
@property (nullable, nonatomic, strong) UIView *presentedFooterView;

@end

NS_ASSUME_NONNULL_END
