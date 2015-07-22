//
//  HWToast.m
//  DuDuChat
//
//  Created by why on 7/1/15.
//  Copyright (c) 2015 PalmWin. All rights reserved.
//

#import "HWToast.h"
#import "NSTimer+HWToast.h"
#import <objc/runtime.h>

// associative reference keys
static char kToastTapCallbackKey;   // tap action handler
static char kToastWindowKey;        // if the base view is nil, the toast will be added to a UIWindow


// const
static const NSTimeInterval kAnimationDuration  = 0.233f;

#pragma mark - HWToastView category

@implementation HWToastView(HWToast)

-(void)hw_handleTapGesture:(UITapGestureRecognizer *)recognizer {
    HWToastTapBlock callback = objc_getAssociatedObject(self, &kToastTapCallbackKey);
    if (callback) {
        callback(self);
        callback = nil;
    }
}

@end

#pragma mark - HWToast

@implementation HWToast

+(HWToastView*)showToastWithMaker:(void(^)(HWToastMaker *maker))block {
    HWToastMaker *maker = [[HWToastMaker alloc] init];
    block(maker);
    NSParameterAssert(maker.contentView);
    HWToastView *toastView = maker.contentView;
    UIView *baseView = maker.baseView;

    // add toast view to baseView
    if (baseView) {
        [baseView addSubview:toastView];
    } else {
        UIWindow *formerKeyWindow = [[UIApplication sharedApplication] keyWindow];
        UIWindow *toastWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        toastWindow.windowLevel = UIWindowLevelStatusBar;
        [toastWindow makeKeyAndVisible];
        [formerKeyWindow makeKeyWindow];
        [toastWindow addSubview:toastView];
        objc_setAssociatedObject(toastView, &kToastWindowKey, toastWindow, OBJC_ASSOCIATION_RETAIN);
        baseView = toastWindow;
    }
    
    // adjust position
    CGFloat baseViewWidth  = baseView.frame.size.width;
    CGFloat baseViewHeight = baseView.frame.size.height;
    CGFloat toastX = 0;
    CGFloat toastY = 0;
    CGFloat toastWidth = toastView.frame.size.width;
    CGFloat toastHeight = toastView.frame.size.height;;
    switch (maker.position) {
        case HWToastPositionCenter: {
            toastX = baseViewWidth / 2 - toastWidth / 2;
            toastY = baseViewHeight / 2 - toastHeight / 2;
            break;
        }
        case HWToastPositionTop: {
            toastX = baseViewWidth / 2 - toastWidth / 2;
            toastY = 0;
            break;
        }
        case HWToastPositionBottom: {
            toastX = baseViewWidth / 2 - toastWidth / 2;
            toastY = baseViewHeight - toastHeight;
            break;
        }
        case HWToastPositionLeft: {
            toastX = 0;
            toastY = baseViewHeight / 2 - toastHeight / 2;
            break;
        }
        case HWToastPositionRight: {
            toastX = baseViewWidth - toastWidth;
            toastY = baseViewHeight / 2 - toastHeight / 2;
            break;
        }
    }
    
    // adjust offset
    toastX = toastX + maker.offsset.horizontal;
    toastY = toastY + maker.offsset.vertical;
    toastView.frame = CGRectMake(toastX, toastY, toastWidth, toastHeight);
    
    // need animated
    BOOL animated = maker.dismissAnimated;
    
    // dismiss timer
    if (maker.duration > 0) {
        __weak UIView *dismissView = toastView;
        [NSTimer scheduledTimerWithTimeInterval:maker.duration block:^{
            [HWToast dismissToast:dismissView animated:animated];
        } repeats:NO];
    }
    
    // dismiss on tap
    HWToastTapBlock completionBlock = [maker.tapCallback copy];
    if (maker.shouldDismissOnTaped) {
        if (completionBlock == nil) {
            completionBlock = ^(HWToastView *view){
                [HWToast dismissToast:view animated:animated];
            };
        } else {
            completionBlock = ^(HWToastView *view){
                completionBlock(view);
                [HWToast dismissToast:view animated:animated];
            };
        }
    }
    
    if (completionBlock) {
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:toastView action:@selector(hw_handleTapGesture:)];
        [toastView addGestureRecognizer:recognizer];
        toastView.userInteractionEnabled = YES;
        toastView.exclusiveTouch = YES;
        objc_setAssociatedObject(toastView, &kToastTapCallbackKey, completionBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return toastView;
}


+(void)dismissToast:(UIView *)toastView animated:(BOOL)animated {
    [UIView animateWithDuration:animated ? kAnimationDuration : 0.0f
                          delay:0.0
                        options:(UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState)
                     animations:^{
                         toastView.alpha = 0.0;
                     } completion:^(BOOL finished) {
                         [toastView removeFromSuperview];
                     }];
}


@end
