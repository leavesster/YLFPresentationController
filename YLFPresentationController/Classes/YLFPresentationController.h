//
//  YLFPresentationController.h
//  CustomPresentationController
//
//  Created by leavesster on 2018/9/9.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YLFPresentationStyle) {
    YLFPresentationStyleBottom,
    YLFPresentationStyleTop,
};


@protocol YLFPresentationProtocol <NSObject>

@optional
- (UIView *)presentedHeaderView;
- (UIView *)presentedFooterView;

/** 0.0 - 1.0 */
- (CGFloat)presentedViewRatio;
- (CGFloat)presentedViewHeight;

@end

@interface YLFPresentationController : UIPresentationController

@property (nonatomic, assign) YLFPresentationStyle customPresentationStyle;
@property (nonatomic, weak) id<YLFPresentationProtocol> customPresentationDelegate;

@end
