//
//  UIButton+countDown.m
//  LiquoriceDoctorProject
//
//  Created by HenryCheng on 15/12/4.
//  Copyright © 2015年 iMac. All rights reserved.
//

#import "UIButton+countDown.h"
#import <objc/runtime.h>

@implementation UIButton (CountDown)
static NSString *cancelKey = @"cancelKey";


- (void)startWithTime:(NSInteger)timeLine
                title:(NSString *)title
            mainColor:(UIColor *)mColor countColor:(UIColor *)color
                block:(void(^)(NSInteger time))block {
    
    __weak typeof(self) weakSelf = self;
    //倒计时时间
    __block NSInteger timeOut = timeLine;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    __block dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //每秒执行一次
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        
        if (self.timerStop) {
            dispatch_source_cancel(_timer);
            _timer = nil;
            self.timerStop = NO;
        }
        //倒计时结束，关闭
        if (timeOut <= 0) {
            dispatch_source_cancel(_timer);
            _timer = nil;
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.backgroundColor = mColor;
                [weakSelf setTitle:title forState:UIControlStateNormal];
                weakSelf.userInteractionEnabled = YES;
            });
        } else {
            int allTime = (int)timeLine + 1;
            int seconds = timeOut % allTime;
            NSString *timeStr = [NSString stringWithFormat:@"%0.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.backgroundColor = color;
                [weakSelf setTitle:[NSString stringWithFormat:@"已发送(%@s)",timeStr] forState:UIControlStateNormal];
                weakSelf.userInteractionEnabled = NO;
                block ? block(timeOut) : nil;
                
            });
            timeOut--;
        }
    });
    dispatch_resume(_timer);
}

- (BOOL)timerStop {
    return [(NSNumber *)objc_getAssociatedObject(self, &cancelKey) integerValue];
}

- (void)setTimerStop:(BOOL)timerStop {
    objc_setAssociatedObject(self, &cancelKey, @(timerStop), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
