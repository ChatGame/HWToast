//
//  HWToastMaker.h
//  DuDuChat
//
//  Created by why on 7/1/15.
//  Copyright (c) 2015 PalmWin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class HWToastView;

typedef void(^HWToastTapBlock)(HWToastView *toastView);

typedef NS_ENUM(NSUInteger, HWToastPosition) {
    HWToastPositionCenter,  // default position
    HWToastPositionTop,
    HWToastPositionBottom,
    HWToastPositionLeft,
    HWToastPositionRight
};


@interface HWToastMaker : NSObject

/**
 *  The toast will be added to baseView. If baseView is nil, the toast will be shown in center of the screen and background is non-clickable.
 */
@property (nonatomic, strong) UIView *baseView;

/**
 *  The content view you want to show in toast.
 */
@property (nonatomic, strong) HWToastView *contentView;

/**
 *  The toast will disappear after duration. Set duration to 0 to keep it on the screen permanently.
 */
@property (nonatomic, assign) NSTimeInterval duration;

/**
 *  Should it be dismissed on taped. Default is NO.
 */
@property (nonatomic, assign) BOOL shouldDismissOnTaped;

/**
 *  Whether the dismiss will be animated.
 */
@property (nonatomic, assign) BOOL dismissAnimated;

/**
 *  The callback will be called after the toast been taped.
 */
@property (nonatomic, strong) HWToastTapBlock tapCallback;

/**
 *  The offset to basic position.
 */
@property (nonatomic, assign) UIOffset offsset;

/**
 *  The toast's position according to baseView
 */
@property (nonatomic, assign) HWToastPosition position;

@end
