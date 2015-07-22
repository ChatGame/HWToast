//
//  HWToastTool.m
//  HWToast
//
//  Created by why on 7/22/15.
//  Copyright (c) 2015 why. All rights reserved.
//

#import "HWToastTool.h"
#import "HWToast.h"
#import "HWTextToastView.h"

const NSTimeInterval HWToastDefaultDuration = 2.0f;

@implementation HWToastTool

+(void)showToastWithText:(NSString*)text {
    [HWToast showToastWithMaker:^(HWToastMaker *maker) {
        maker.contentView = [[HWTextToastView alloc] initWithText:text];
        maker.duration = HWToastDefaultDuration;
    }];
}


@end
