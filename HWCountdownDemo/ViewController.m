//
//  ViewController.m
//  HWCountdownDemo
//
//  Created by HenryCheng on 16/1/4.
//  Copyright © 2016年 www.igancao.com. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+countDown.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *countdownBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}
- (IBAction)countdownBtnClick:(UIButton *)sender {
    [_countdownBtn startWithTime:5 title:@"获取验证码" countDownTitle:@"s" mainColor:[UIColor colorWithRed:84/255.0 green:180/255.0 blue:98/255.0 alpha:1.0f] countColor:[UIColor lightGrayColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
