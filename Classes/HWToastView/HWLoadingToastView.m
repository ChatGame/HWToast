//
//  HWLoadingToastView.m
//  DuDuChat
//
//  Created by why on 7/2/15.
//  Copyright (c) 2015 PalmWin. All rights reserved.
//

#import "HWLoadingToastView.h"
#import "NSString+HWToast.h"
#import "HWActivityIndicatorView.h"

@interface HWLoadingToastView()
@property (nonatomic) HWToastLoadingStyle style;
@end

@implementation HWLoadingToastView

-(instancetype)initWithLoadingText:(NSString*)string andStyle:(HWToastLoadingStyle)style {
    if (self = [super init]) {
        _style = style;
        [self setupWithText:string andStyle:style];
    }
    return self;
}

-(void)setupWithText:(NSString*)text andStyle:(HWToastLoadingStyle)style {
    // build loading indicator
    HWActivityIndicatorView *indicator = [[HWActivityIndicatorView alloc] init];
    [indicator startAnimating];
    [self addSubview:indicator];

    // build label
    CGSize textSize = [text hw_sizeWithFont:self.toastFont constrainedToSize:self.toastContentSizeMaximum];
    UILabel *label = [[UILabel alloc] init];
    label.font = self.toastFont;
    label.text = text;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    [self addSubview:label];

    // setup frame accrding to type
    switch (style) {
        case HWToastLoadingStyle1: {
            indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
            // indicator
            indicator.frame = CGRectMake(self.toastContentInset.left,
                                         self.toastContentInset.top,
                                         self.toastContentSizeMaximum.width,
                                         indicator.frame.size.height);
            // label
            label.frame = CGRectMake(self.toastContentInset.left,
                                     indicator.frame.origin.y + indicator.frame.size.height + self.toastContentInset.top,
                                     self.toastContentSizeMaximum.width,
                                     textSize.height);
            // setup self
            self.frame = CGRectMake(0,
                                    0,
                                    self.toastContentSizeMaximum.width + self.toastContentInset.left + self.toastContentInset.right,
                                    label.frame.origin.y + label.frame.size.height + self.toastContentInset.bottom);
            return;
        }
            
        case HWToastLoadingStyle2: {
            indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
            // indicator
            indicator.frame = CGRectMake(self.toastContentInset.left,
                                         self.toastContentInset.top,
                                         indicator.frame.size.width,
                                         self.toastContentSizeMaximum.height);
            // label
            label.frame = CGRectMake(indicator.frame.origin.x + indicator.frame.size.width + 5,
                                     self.toastContentInset.top,
                                     textSize.width,
                                     self.toastContentSizeMaximum.height);
            // setup self
            self.frame = CGRectMake(0,
                                    0,
                                    label.frame.origin.x + label.frame.size.width + self.toastContentInset.right,
                                    label.frame.origin.y + label.frame.size.height + self.toastContentInset.bottom);
            return;
        }
    }
    
    
}

#pragma mark - Getter
-(CGSize)toastContentSizeMaximum {
    switch (self.style) {
        case HWToastLoadingStyle1: {
            CGFloat width = [[UIScreen mainScreen] bounds].size.width * 0.5;
            CGFloat height = [[UIScreen mainScreen] bounds].size.height * 0.8;
            return CGSizeMake(width, height);
        }
        case HWToastLoadingStyle2: {
            CGFloat width = [[UIScreen mainScreen] bounds].size.width * 0.8;
            CGFloat height = 30.0f;
            return CGSizeMake(width, height);
        }
    }
}

@end
