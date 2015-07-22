//
//  NSString+HWToast.m
//  DuDuChat
//
//  Created by why on 7/2/15.
//  Copyright (c) 2015 PalmWin. All rights reserved.
//

#import "NSString+HWToast.h"

@implementation NSString (HWToast)

- (CGSize)hw_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)constrainedSize {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle};
    CGRect boundingRect = [self boundingRectWithSize:constrainedSize
                                             options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                          attributes:attributes context:nil];
    return boundingRect.size;
}
@end
