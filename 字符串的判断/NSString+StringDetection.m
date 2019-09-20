//
//  NSString+StringDetection.m
//  FSMeetingClient
//
//  Created by Rachel on 2018/10/15.
//

#import "NSString+StringDetection.h"

@implementation NSString (StringDetection)

+ (BOOL)fm_isContainChinese:(NSString *)str {
    for (int i = 0; i < [str length]; i++) {
        int a = [str characterAtIndex:i];
        if (a > 0x4e00 && a < 0x9fff) {
            return YES;
        }
    }
    
    return NO;
}

+ (BOOL)fm_isEmptyString:(NSString *)str {
    // Get the length of characters left after removing spaces and blank lines.
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSUInteger length = [str stringByTrimmingCharactersInSet:set].length;
    
    if (!length) return YES;
    
    return NO;
}

+ (NSRange)fm_stringContainsEmoji:(NSString *)string {
    __block NSRange range = NSMakeRange(0, 0);
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         const unichar hs = [substring characterAtIndex:0];
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f9ff) {
                     range = substringRange;
                 }
             }
         } else {
             if (0x2100 <= hs && hs <= 0x27ff) {
                 range = substringRange;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 range = substringRange;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 range = substringRange;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 range = substringRange;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                 range = substringRange;
             } else if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 if (ls == 0x20e3) {
                     range = substringRange;
                 }
             }
         }
     }];
    
    return range;
}

@end
