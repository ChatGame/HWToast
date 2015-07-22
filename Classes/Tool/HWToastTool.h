//
//  HWToastTool.h
//  HWToast
//
//  Created by why on 7/22/15.
//  Copyright (c) 2015 why. All rights reserved.
//

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT const NSTimeInterval HWToastDefaultDuration;

@interface HWToastTool : NSObject

+(void)showToastWithText:(NSString*)text;

@end
