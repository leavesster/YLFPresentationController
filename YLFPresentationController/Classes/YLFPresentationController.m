//
//  YLFPresentationController.m
//  CustomPresentationController
//
//  Created by leavesster on 2018/9/9.
//

#import "YLFPresentationController.h"

@interface YLFPresentationController()
@property (nonatomic, assign) CGFloat presentedViewHeight;
@property (nonatomic, strong) UIView *overlayView;
@property (nonatomic, strong) UIView *customPresentedView;
@end

@implementation YLFPresentationController

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController
{
    self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
    return self;
}

#pragma mark - Property
- (UIView *)overlayView
{
    if (!_overlayView) {
        _overlayView = [[UIView alloc] initWithFrame:self.containerView.bounds];
        _overlayView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        _overlayView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissPresentedViewController:)];
        [_overlayView addGestureRecognizer:tap];
    }
    return _overlayView;
}

#pragma mark - Protocol

- (UIView *)presentedHeaderView
{
    if ([self.customPresentationDelegate respondsToSelector:@selector(presentedHeaderView)]) {
        return [self.customPresentationDelegate presentedHeaderView];
    }
    return nil;
}

- (UIView *)presentedFooterView
{
    if ([self.customPresentationDelegate respondsToSelector:@selector(presentedFooterView)]) {
        return [self.customPresentationDelegate presentedFooterView];
    }
    return nil;
}

- (CGFloat)presentedViewRatio
{
    if ([self.customPresentationDelegate respondsToSelector:@selector(presentedViewRatio)]) {
        return [self.customPresentationDelegate presentedViewRatio];
    }
    return 1;
}

- (CGFloat)presentedViewHeight
{
    if ([self.customPresentationDelegate respondsToSelector:@selector(presentedViewHeight)] && [self.customPresentationDelegate presentedViewHeight] > 0) {
        return [self.customPresentationDelegate presentedViewHeight];
    }
    return CGRectGetHeight(self.containerView.bounds) * fminf(fmaxf([self presentedViewRatio], 0), 1);
}

#pragma mark - Private

- (void)dismissPresentedViewController:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark - Override
#pragma mark -

#pragma mark - UIContentContainer Protocol

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator
{
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
}

#pragma mark - Transition
- (void)presentationTransitionWillBegin
{
//    UIView *snapView = [self.presentingViewController.view snapshotViewAfterScreenUpdates:YES];
//    [self.containerView addSubview:snapView];
    
    [self.containerView addSubview:self.overlayView];

    self.overlayView.alpha = 0;
    id <UIViewControllerTransitionCoordinator> transitionCoordinator = [self.presentingViewController transitionCoordinator];
    [transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.overlayView.alpha = 1;
    } completion:nil];
}

- (void)presentationTransitionDidEnd:(BOOL)completed
{
    
}

- (void)dismissalTransitionWillBegin
{
    id <UIViewControllerTransitionCoordinator> transitionCoordinator = [self.presentingViewController transitionCoordinator];
    [transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.overlayView.alpha = 0;
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    }];
}

- (void)dismissalTransitionDidEnd:(BOOL)completed
{
    if (completed) {
        [self.overlayView removeFromSuperview];
    }
}

#pragma mark - Presentation Attributes

- (UIView *)customPresentedView
{
    if (!_customPresentedView) {
        UIView *headerV = [self presentedHeaderView];
        UIView *footerV = [self presentedFooterView];

        _customPresentedView = [[UIView alloc] initWithFrame:[self frameOfPresentedViewInContainerView]];
        CGRect bounds = _customPresentedView.bounds;
        if (headerV) {
            [_customPresentedView addSubview:headerV];
            headerV.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
            CGRect rect = bounds;
            rect.size.height = CGRectGetHeight(headerV.bounds);
            headerV.frame = rect;
        }
        {
            [_customPresentedView addSubview:self.presentedViewController.view];
            CGRect rect = bounds;
            rect.origin.y = CGRectGetHeight(headerV.bounds);
            rect.size.height = CGRectGetHeight(rect) - CGRectGetHeight(headerV.bounds) - CGRectGetHeight(footerV.bounds);
            self.presentedViewController.view.frame = rect;
        }
        if (footerV) {
            [_customPresentedView addSubview:footerV];
            footerV.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
            CGRect rect = bounds;
            rect.origin.y = CGRectGetHeight(rect) - CGRectGetHeight(footerV.bounds);
            rect.size.height = CGRectGetHeight(footerV.bounds);
            footerV.frame = rect;
        }
    }
    return _customPresentedView;
}

- (UIView *)presentedView
{
    return self.customPresentedView;
}

//- (BOOL)shouldRemovePresentersView
//{
//    return YES;
//}

- (BOOL)shouldPresentInFullscreen
{
    return CGRectGetHeight(self.containerView.bounds) == self.presentedViewHeight;
}

#pragma mark - layout

- (CGRect)frameOfPresentedViewInContainerView
{
    CGRect rect = self.containerView.bounds;
    CGFloat height = self.presentedViewHeight + CGRectGetHeight([self presentedFooterView].bounds) + CGRectGetHeight([self presentedHeaderView].bounds);

    switch (self.customPresentationStyle) {
        case YLFPresentationStyleBottom:
        {
            rect.origin.y = CGRectGetHeight(rect) - height;
            rect.size.height = height;
            break;
        }
        case YLFPresentationStyleTop:
        {
            rect.size.height = height;
            break;
        }
    }
    return rect;
}

- (void)containerViewWillLayoutSubviews
{
    [super containerViewWillLayoutSubviews];
}

- (void)containerViewDidLayoutSubviews
{
    [super containerViewDidLayoutSubviews];
}


@end
