//
//  HWActivityIndicatorView.m
//  DuDuChat
//
//  Created by why on 7/3/15.
//  Copyright (c) 2015 PalmWin. All rights reserved.
//

#import "HWActivityIndicatorView.h"

static const CGFloat kDefaultSize   = 25;
static const CGFloat kLargeSize     = 50;

@implementation HWActivityIndicatorView

- (instancetype)init {
    self = [super init];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"HWToastImage.bundle/toast_loading"]];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.frame = imageView.bounds;
        imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:imageView];
        self.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    }
    return self;
}

- (void)startAnimating {
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = @(0.0f);
    animation.toValue = @(2.0f * M_PI);
    animation.duration = 1.2f;
    animation.repeatCount = CGFLOAT_MAX;
    [self.layer addAnimation:animation forKey:@"HWToastLoadingAnimation"];
}

- (void)stopAnimating {
    [self.layer removeAllAnimations];
}

- (BOOL)isAnimating {
    if (self.layer.animationKeys.count > 0) {
        return YES;
    }
    return NO;
}

#pragma mark - Provate
-(void)updateFrameWithStyle:(UIActivityIndicatorViewStyle)style {
    switch (style) {
        case UIActivityIndicatorViewStyleWhiteLarge:
            self.frame = CGRectMake(0, 0, kLargeSize, kLargeSize);
            break;
            
        default:
            self.frame = CGRectMake(0, 0, kDefaultSize, kDefaultSize);
            break;
    }
}

#pragma mark - Setter
-(void)setActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)activityIndicatorViewStyle {
    _activityIndicatorViewStyle = activityIndicatorViewStyle;
    [self updateFrameWithStyle:activityIndicatorViewStyle];
}

@end
