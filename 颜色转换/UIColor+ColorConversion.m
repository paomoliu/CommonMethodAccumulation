//
//  UIColor+ColorConversion.m
//  FSMeetingClient
//
//  Created by Rachel on 2018/9/11.
//

#import "UIColor+ColorConversion.h"

@implementation UIColor (ColorConversion)

+ (UIColor *)fm_rgbByHexString:(NSString *)hexString {
    return [self fm_rgbByHexString:hexString alpha:1.0];
}

+ (UIColor *)fm_rgbByHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    NSString *string = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([string length] < 6) {
        return [UIColor blackColor];
    }
    if ([string hasPrefix:@"0X"]) {
        string = [string substringFromIndex:2];
    }
    if ([string hasPrefix:@"#"]) {
        string = [string substringFromIndex:1];
    }
    if ([string length] != 6) {
        return [UIColor blackColor];
    }
    
    unsigned long red = strtoul([[string substringWithRange:NSMakeRange(0, 2)] UTF8String], 0, 16);
    unsigned long green = strtoul([[string substringWithRange:NSMakeRange(2, 2)] UTF8String], 0, 16);
    unsigned long blue = strtoul([[string substringWithRange:NSMakeRange(4, 2)] UTF8String], 0, 16);
    
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

@end
