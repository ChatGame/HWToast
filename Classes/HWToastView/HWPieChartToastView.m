//
//  HWPieChartToastView.m
//  DuDuChat
//
//  Created by why on 7/6/15.
//  Copyright (c) 2015 PalmWin. All rights reserved.
//

#import "HWPieChartToastView.h"
#import "HWPieChartProgressView.h"
#import "NSString+HWToast.h"
#import "UIView+HWToast.h"

@interface HWPieChartToastView()
@property (nonatomic, strong) HWPieChartProgressView *progressView;
@end


@implementation HWPieChartToastView

-(instancetype)init {
    if (self = [super init]) {
        // add progress view
        _progressView = [[HWPieChartProgressView alloc] init];
        [self addSubview:_progressView];
        
        // add label
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont boldSystemFontOfSize:12];
        label.textColor = [UIColor whiteColor];
        label.text = @"Loading";
        CGSize textSize = [label.text hw_sizeWithFont:label.font constrainedToSize:self.toastContentSizeMaximum];
        label.size = textSize;
        [self addSubview:label];
        
        // set frame
        CGRect textRect = CGRectMake(_progressView.right + 5, 0, textSize.width, self.toastContentSizeMaximum.height);
        CGFloat maxWidth = fmax(textRect.size.width, _progressView.size.width);
        CGFloat toastWidth = maxWidth + self.toastContentInset.left + self.toastContentInset.right;
        
        _progressView.top = self.toastContentInset.top;
        _progressView.centerX = toastWidth / 2;
        
        label.top = _progressView.bottom + self.toastContentInset.top;
        label.centerX = _progressView.centerX;

        self.size = CGSizeMake(toastWidth, label.bottom + self.toastContentInset.bottom);
    }
    return self;
}


#pragma mark - Getter
-(float)progress {
    return _progressView.progress;
}

-(void)setProgress:(float)progress {
    _progressView.progress = progress;
}

@end
