//
//  UIImage+CreateByView.m
//  FSMeetingClient
//
//  Created by Rachel on 2019/5/6.
//

#import "UIImage+CreateByView.h"

@implementation UIImage (CreateByView)

+ (UIImage *)fm_imageByView:(UIView *)view {
    UIGraphicsBeginImageContext(view.bounds.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
