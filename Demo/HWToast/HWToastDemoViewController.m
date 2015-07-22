//
//  HWToastDemoViewController.m
//  HWToast
//
//  Created by why on 7/22/15.
//  Copyright (c) 2015 why. All rights reserved.
//

#import "HWToastDemoViewController.h"
#import "HWToast.h"
#import "HWTextToastView.h"
#import "HWPieChartToastView.h"
#import "HWLoadingToastView.h"

static const NSTimeInterval kDefaultDuration = 2.0f;

@interface HWToastDemoViewController ()

@end

@implementation HWToastDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Toast
- (IBAction)showTextToast:(id)sender {
    [HWToast showToastWithMaker:^(HWToastMaker *maker) {
        maker.baseView = self.view;
        maker.duration = kDefaultDuration;
        maker.contentView = [[HWTextToastView alloc] initWithText:@"Hi, I'm a text toast!"];
    }];
}

- (IBAction)showTextToastWithDisableBackground:(id)sender {
    [HWToast showToastWithMaker:^(HWToastMaker *maker) {
        maker.duration = kDefaultDuration;
        maker.contentView = [[HWTextToastView alloc] initWithText:@"Hi, I'm a text toast! You can't touch the background!"];
        maker.position = HWToastPositionBottom;
        maker.offsset = UIOffsetMake(0, -100);
    }];
}
- (IBAction)showPieChartToast:(id)sender {
    HWPieChartToastView *pView = [[HWPieChartToastView alloc] init];
    [HWToast showToastWithMaker:^(HWToastMaker *maker) {
        maker.duration = kDefaultDuration;
        maker.contentView = pView;
        maker.position = HWToastPositionTop;
        maker.offsset = UIOffsetMake(0, 100);
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        pView.progress = 0.5;
    });
}
- (IBAction)showLoadingToast1:(id)sender {
    [HWToast showToastWithMaker:^(HWToastMaker *maker) {
        maker.duration = kDefaultDuration;
        maker.contentView = [[HWLoadingToastView alloc] initWithLoadingText:@"Hi, I'm loading for you!" andStyle:HWToastLoadingStyle1];
        maker.position = HWToastPositionBottom;
        maker.offsset = UIOffsetMake(0, -100);
    }];
}
- (IBAction)showLoadingToast2:(id)sender {
    [HWToast showToastWithMaker:^(HWToastMaker *maker) {
        maker.duration = kDefaultDuration;
        maker.contentView = [[HWLoadingToastView alloc] initWithLoadingText:@"Hi, I'm loading for you!" andStyle:HWToastLoadingStyle2];
        maker.position = HWToastPositionBottom;
        maker.offsset = UIOffsetMake(0, -100);
    }];
}
- (IBAction)showTextWithBlock:(id)sender {
    [HWToast showToastWithMaker:^(HWToastMaker *maker) {
        maker.duration = kDefaultDuration;
        maker.shouldDismissOnTaped = YES;
        maker.contentView = [[HWTextToastView alloc] initWithText:@"Hi, I'm a text toast! Touch me!"];
        maker.tapCallback = ^(UIView *view){
            NSLog(@"You touched me!");
        };
    }];
}
@end
