//
//  HWTextToastView.m
//  DuDuChat
//
//  Created by why on 7/2/15.
//  Copyright (c) 2015 PalmWin. All rights reserved.
//

#import "HWTextToastView.h"
#import "NSString+HWToast.h"

@implementation HWTextToastView

-(instancetype)initWithText:(NSString*)string {
    if (self = [super init]) {
        [self setupWithText:string];
    }
    return self;
}

-(void)setupWithText:(NSString*)text {
    // build label
    CGSize textSize = [text hw_sizeWithFont:self.toastFont constrainedToSize:self.toastContentSizeMaximum];
    UILabel *label = [[UILabel alloc] init];
    label.font = self.toastFont;
    label.text = text;
    label.textColor = [UIColor whiteColor];
    label.numberOfLines = 0;
    label.frame = CGRectMake(self.toastContentInset.left,
                             self.toastContentInset.top,
                             textSize.width,
                             MAX(30, textSize.height));
    [self addSubview:label];
    
    // setup self
    CGFloat contentWidth = label.frame.origin.x + label.frame.size.width + self.toastContentInset.right;
    CGFloat contentHeight = label.frame.origin.y + label.frame.size.height + self.toastContentInset.bottom;
    self.frame = CGRectMake(0, 0, contentWidth, contentHeight);
}

@end
