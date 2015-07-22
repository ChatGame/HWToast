//
//  NSTimer+HWTOast.m
//  HWToast
//
//  Created by why on 7/22/15.
//  Copyright (c) 2015 why. All rights reserved.
//

#import "NSTimer+HWToast.h"

@implementation NSTimer (HWToast)
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats {
    void (^block)() = [inBlock copy];
    NSTimer * timer = [self scheduledTimerWithTimeInterval:inTimeInterval target:self selector:@selector(__executeTimerBlock:) userInfo:block repeats:inRepeats];
    return timer;
}

+ (void)__executeTimerBlock:(NSTimer *)inTimer; {
    if([inTimer userInfo]) {
        void (^block)() = (void (^)())[inTimer userInfo];
        block();
    }
}
@end
