//
//  YLFViewController.m
//  CustomPresentationController
//
//  Created by leavesster on 09/09/2018.
//  Copyright (c) 2018 leavesster. All rights reserved.
//

#import "YLFViewController.h"
#import "YLFPresentedViewController.h"
@import YLFPresentationController;

@interface YLFViewController ()
@property (weak, nonatomic) IBOutlet UIButton *customBtn;
@end

@implementation YLFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)dimissViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)customAction:(id)sender {
    YLFPresentedViewController *controller = [[YLFPresentedViewController alloc] init];
    YLFTransitioningManager *transitioningManager = [[YLFTransitioningManager alloc] initWithViewController:controller];
    transitioningManager.presentedHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    transitioningManager.presentedHeaderView.backgroundColor = [UIColor redColor];
    transitioningManager.presentedFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    transitioningManager.presentedFooterView.backgroundColor = [UIColor redColor];

    [self presentViewController:controller animated:YES completion:nil];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

@end
