//
//  UIView+GradientColor.m
//  FSMeetingClient
//
//  Created by Rachel on 2019/9/23.
//

#import "UIView+GradientColor.h"

@implementation UIView (GradientColor)

+ (void)fm_setGradientColor:(NSArray *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint view:(UIView *)view {
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.startPoint = startPoint;      // (0,0)代表左上角，(0,1)代表左下角
    layer.endPoint = endPoint;          // (0,0)(0,1)结合起来就是竖直方向渐变
    layer.colors = colors;
    layer.frame = view.layer.bounds;
    [view.layer insertSublayer:layer atIndex:0];
}

+ (void)fm_setTransparentGradientColor:(NSArray *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint view:(UIView *)view {
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.startPoint = startPoint;
    layer.endPoint = endPoint;
    layer.colors = colors;
    layer.frame = view.layer.bounds;
    [view.layer setMask:layer];
}

@end
