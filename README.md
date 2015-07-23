# HWToast

## What

HWToast can display a toast with custom views in a flexible way.

![](http://ww2.sinaimg.cn/large/61d238c7gw1eucpnw205oj21kw0gb444.jpg)

## How

### HWToastMaker

You can make a toast easily with a maker:

    [HWToast showToastWithMaker:^(HWToastMaker *maker) {
        // Superview of the toast. If the baseView is nil, the toast will be added to a new window over the screen.
        maker.baseView = nil;

        // The toast view. It could be a text toast(HWTextToastView) 、 a loading toast(HWLoadingToastView) or other HWToastView.
        maker.contentView = [[HWTextToastView alloc] initWithText:text];

        // The toast will disappear after duration. Default value is 0 and it will be on the screen permanently.
        maker.duration = 0.2f;

        // Should it be dismissed on taped. Default is NO.
        maker.shouldDismissOnTaped = YES;

        // Whether the dismiss will be animated.
        maker.dismissAnimated = YES;

        // The callback will be called after the toast been taped.
        maker.tapCallback = ^(UIView *view){
            NSLog(@"You touched me!");
        };

        // The toast's position according to baseView
        maker.position = HWToastPositionBottom;

        // The offset relative to the position.
        maker.offsset = UIOffsetMake(0, -100);
    }];

You can also abstract the maker block into class methods:

    @implementation HWToastTool

    +(void)showToastWithText:(NSString*)text {
        [HWToast showToastWithMaker:^(HWToastMaker *maker) {
            maker.contentView = [[HWTextToastView alloc] initWithText:text];
            maker.duration = 2.0f;
        }];
    }

    @end

And call like this:

    [HWToastTool showToastWithText:@"Hi, I'm a toast from HWToastTool!"];


### HWToastView

You can make your custome toast view inheriting from HWToastView.

Just like `HWTextToastView` 、 `HWLoadingToastView` and `HWPieChartToastView`.