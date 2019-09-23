//
//  UIColor+ColorConversion.h
//  FSMeetingClient
//
//  Created by Rachel on 2018/9/11.
//

#import <UIKit/UIKit.h>

@interface UIColor (ColorConversion)

/**
 *  通过rgb十六进制字符串转换成UIColor
 *
 *  @param hexString 16进制字符串（可以以0x开头，可以以#开头，也可以就是6位的16进制）
 *  @return 16进制字符串对应的颜色
 */
+ (UIColor *)fm_rgbByHexString:(NSString *)hexString;
/**
 *  通过rgb十六进制字符串转换成UIColor
 *
 *  @param hexString 16进制字符串（可以以0x开头，可以以#开头，也可以就是6位的16进制）
 *  @param opacity 透明度
 *  @return 16进制字符串对应的颜色
 */
+ (UIColor *)fm_rgbByHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end
