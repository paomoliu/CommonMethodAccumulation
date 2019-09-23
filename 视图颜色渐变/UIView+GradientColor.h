//
//  UIView+GradientColor.h
//  FSMeetingClient
//
//  Created by Rachel on 2019/9/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (GradientColor)

/**
 *  设置view渐变色
 *  @param startPoint 渐变起点  (0,0)代表左上角，(0,1)代表左下角，结合起来就是竖直方向渐变
 *  @param endPoint 渐变结束点  (1,0)代表右上角，(1,1)代表右下角
 */
+ (void)fm_setGradientColor:(NSArray *)colors
                 startPoint:(CGPoint)startPoint
                   endPoint:(CGPoint)endPoint
                       view:(UIView *)view;
/**
 *  设置view透明渐变色
 */
+ (void)fm_setTransparentGradientColor:(NSArray *)colors
                            startPoint:(CGPoint)startPoint
                              endPoint:(CGPoint)endPoint
                                  view:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
