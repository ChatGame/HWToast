//
//  HWToastTool+Permanent.m
//  HWToast
//
//  Created by why on 7/22/15.
//  Copyright (c) 2015 why. All rights reserved.
//

#import "HWToastTool+Permanent.h"
#import "HWToast.h"
#import "HWTextToastView.h"

static HWToastView *toastView;

@implementation HWToastTool (Permanent)

+(void)showPermanentToastWithText:(NSString*)text inView:(UIView*)baseView {
    [self dismissAllToast];
    toastView = [[HWTextToastView alloc] initWithText:text];

    [HWToast showToastWithMaker:^(HWToastMaker *maker) {
        maker.contentView = toastView;
        maker.baseView = baseView;
    }];
}

+(void)dismissAllToast {
    [toastView removeFromSuperview];
    toastView = nil;
}



@end
