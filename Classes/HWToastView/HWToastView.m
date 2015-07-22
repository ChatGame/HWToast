//
//  HWToastView.m
//  DuDuChat
//
//  Created by why on 7/2/15.
//  Copyright (c) 2015 PalmWin. All rights reserved.
//

#import "HWToastView.h"

@implementation HWToastView
- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupInitialValue];
        self.backgroundColor = self.toastBackgroundColor;
        self.layer.cornerRadius = self.toastCornerRadius;
    }
    return self;
}

-(void)setupInitialValue {
    CGFloat width = [[UIScreen mainScreen] bounds].size.width * 0.8;
    CGFloat height = [[UIScreen mainScreen] bounds].size.height * 0.8;
    _toastContentSizeMaximum = CGSizeMake(width, height);
    _toastContentInset = UIEdgeInsetsMake(10, 22, 10, 22);
    _toastFont = [UIFont systemFontOfSize:15];
    _toastBackgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    _toastCornerRadius = 6.0;
}

@end
