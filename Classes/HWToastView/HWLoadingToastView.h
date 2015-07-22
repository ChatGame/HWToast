//
//  HWLoadingToastView.h
//  DuDuChat
//
//  Created by why on 7/2/15.
//  Copyright (c) 2015 PalmWin. All rights reserved.
//

#import "HWToastView.h"


typedef NS_ENUM(NSUInteger, HWToastLoadingStyle) {
    HWToastLoadingStyle1,
    /*
     +---------+
     |   X X   |
     |    X    |
     |   X X   |
     |Loading..|
     +---------+
     */
    HWToastLoadingStyle2,
    /*
     +---------------+
     |  X  Loading...|
     +---------------+
     */
};

@interface HWLoadingToastView : HWToastView

-(instancetype)initWithLoadingText:(NSString*)string andStyle:(HWToastLoadingStyle)style;

@end
