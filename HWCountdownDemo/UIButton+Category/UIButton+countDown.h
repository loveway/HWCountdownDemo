//
//  UIButton+countDown.h
//  LiquoriceDoctorProject
//
//  Created by HenryCheng on 15/12/4.
//  Copyright © 2015年 iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (countDown)

@property (nonatomic, assign) BOOL timerStop;

/**
 *  倒计时按钮
 *
 *  @param timeLine 倒计时总时间
 *  @param title    还没倒计时的title
 *  @param mColor   还没倒计时的颜色
 *  @param color    倒计时中的颜色
 */
- (void)startWithTime:(NSInteger)timeLine
                title:(NSString *)title
            mainColor:(UIColor *)mColor
           countColor:(UIColor *)color
                block:(void(^)(NSInteger time))block;
@end
