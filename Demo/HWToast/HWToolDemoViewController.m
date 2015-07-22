//
//  HWHudDemoViewController.m
//  HWToast
//
//  Created by why on 7/22/15.
//  Copyright (c) 2015 why. All rights reserved.
//

#import "HWToolDemoViewController.h"
#import "HWToastTool.h"

@interface HWToolDemoViewController ()

@end

@implementation HWToolDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)showTextToast:(id)sender {
    [HWToastTool showToastWithText:@"Hi, I'm a toast from HWToastTool!"];
}

@end
