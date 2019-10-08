//
//  CustomToolBarButton.m
//  FSMeetingClient
//
//  Created by Rachel on 2017/9/5.
//
//

#import "CustomToolBarButton.h"

@implementation CustomToolBarButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.frame = self.titleViewFrame;
    self.imageView.frame = self.imageViewFrame;
    
    CGPoint labelCenter = self.titleLabel.center;
    labelCenter.x = self.frame.size.width / 2;
    self.titleLabel.center = labelCenter;

    CGPoint imageCenter = self.imageView.center;
    imageCenter.x = self.frame.size.width / 2;
    self.imageView.center = imageCenter;
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
