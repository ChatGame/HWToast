//
//  HWPermanentViewController.m
//  HWToast
//
//  Created by why on 7/22/15.
//  Copyright (c) 2015 why. All rights reserved.
//

#import "HWPermanentViewController.h"
#import "HWToastTool+Permanent.h"

@interface HWPermanentViewController ()

@end

@implementation HWPermanentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)showPermanentToast:(id)sender {
    [HWToastTool showPermanentToastWithText:@"I'm a toast and I never dismiss!" inView:self.view];
}
- (IBAction)dismissToast:(id)sender {
    [HWToastTool dismissAllToast];
}

@end
