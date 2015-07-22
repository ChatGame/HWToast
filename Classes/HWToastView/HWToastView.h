//
//  HWToastView.h
//  DuDuChat
//
//  Created by why on 7/2/15.
//  Copyright (c) 2015 PalmWin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWToastView : UIView

/**
 *  Fontsize of text in toast view
 */
@property (nonatomic, strong) UIFont *toastFont;

/**
 *  Max size of the toast content. Default is 80% of screen size.
 */
@property (nonatomic, assign) CGSize toastContentSizeMaximum;

/**
 *  Content inset of content in content view. Default is 10 point for each of the edges.
 */
@property (nonatomic, assign) UIEdgeInsets toastContentInset;


/**
 *  Toast's background color.
 */
@property (nonatomic, strong) UIColor *toastBackgroundColor;


/**
 *  Toast's corner radius.
 */
@property (nonatomic, assign) CGFloat toastCornerRadius;



@end
