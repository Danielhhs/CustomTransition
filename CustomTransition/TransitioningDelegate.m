//
//  TransitioningDelegate.m
//  CustomTransition
//
//  Created by Huang Hongsen on 4/28/16.
//  Copyright © 2016 cn.daniel. All rights reserved.
//

#import "TransitioningDelegate.h"
#import <DHAnimation/DHAnimation.h>
@interface TransitioningDelegate() <UIViewControllerAnimatedTransitioning>
@property (nonatomic, strong) DHTwistTransitionRenderer *renderer;
@property (nonatomic) BOOL presenting;
@end

static TransitioningDelegate *sharedInstance;

@implementation TransitioningDelegate

+ (TransitioningDelegate *) generalDelegate
{
    if (sharedInstance == nil) {
        sharedInstance = [[TransitioningDelegate alloc] init];
    }
    return sharedInstance;
}

- (id<UIViewControllerAnimatedTransitioning>) animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    self.presenting = YES;
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>) animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.presenting = NO;
    return self;
}

#pragma mark - UIViewControllerAnimatedTransitioning
- (CGFloat) transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.f;
}

- (void) animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    NSLog(@"fromViewController = %@", fromViewController);
    NSLog(@"toViewController = %@", toViewController);
    NSLog(@"fromView = %@", fromView);
    NSLog(@"toView = %@", toView);
    if (_presenting) {
        [[transitionContext containerView] addSubview:toViewController.view];
        [fromViewController beginAppearanceTransition:!self.presenting animated:YES];
    } else {
        [toViewController beginAppearanceTransition:!self.presenting animated:YES];
    }
    self.renderer = [[DHTwistTransitionRenderer alloc] init];
    DHTransitionSettings *settings = [DHTransitionSettings defaultSettings];
    settings.fromView = fromViewController.view;
    settings.toView = toViewController.view;
    settings.containerView = [transitionContext containerView];
    settings.duration = [self transitionDuration:transitionContext];
    settings.timingFunction = DHTimingFunctionLinear;
    settings.animationDirection = AnimationDirectionBottomToTop;
    settings.completion = ^{
        if (self.presenting == NO) {
            [fromViewController.view removeFromSuperview];
            [toViewController endAppearanceTransition];
        } else {
            [fromViewController endAppearanceTransition];
        }
        
        
        [transitionContext completeTransition:YES];
    };
    [self.renderer performAnimationWithSettings:settings];
}

@end
