//
//  CustomToolBarButton.h
//  FSMeetingClient
//
//  Created by Rachel on 2017/9/5.
//
//

#import <UIKit/UIKit.h>

/// 自定义图文上下垂直排列按钮
@interface CustomToolBarButton : UIButton

/// 按钮图片位置
@property (nonatomic, assign) CGRect imageViewFrame;
/// 按钮文字位置
@property (nonatomic, assign) CGRect titleViewFrame;

@end
