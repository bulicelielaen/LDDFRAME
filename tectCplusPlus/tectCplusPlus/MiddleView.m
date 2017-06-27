//
//  MiddleView.m
//  tectCplusPlus
//
//  Created by 李洞洞 on 27/6/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "MiddleView.h"
#import "LDButton.h"
@implementation MiddleView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.layer.borderColor = [UIColor greenColor].CGColor;
        self.layer.borderWidth = 0.5;
    }
    return self;
}
//在外界确定了中间View的风格的时间点 就要确定中间Button的类型和排布
- (void)setMiddleType:(MiddleViewType)middleType
{
    _middleType = middleType;
    CGFloat width = [UIScreen mainScreen].bounds.size.width / 3.0;
    CGFloat height = 60;
    NSArray * titles = @[@"我知道",@"不确定",@"不知道"];
    if (middleType == LDDMidleKnowOrDontKnow) {//这么干 有点频繁创建对象 销毁对象 有点毁性能
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        for (int i = 0; i<3; i++) {//但是点击事件不太好往外搞了 面向接口编程 而且C处理的事件过多 易乱
            LDButton * btn = [[LDButton alloc]initWithFrame:CGRectMake(i * width, 0, width, height)];
            btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
            btn.layer.borderWidth = 0.2;
            [btn setTitle:titles[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [self addSubview:btn];
        }
    }
    
    if (middleType == LDDMidleReally) {
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        CGFloat width = [UIScreen mainScreen].bounds.size.width / 2.0;
        CGFloat height = 60;
        NSArray * titles = @[@"真会",@"假会"];
        for (int i = 0; i<2; i++) {//但是点击事件不太好往外搞了 面向接口编程 而且C处理的事件过多 易乱
            LDButton * btn = [[LDButton alloc]initWithFrame:CGRectMake(i * width, 0, width, height)];
            btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
            btn.layer.borderWidth = 0.25;
            [btn setTitle:titles[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [self addSubview:btn];
        }
    }
    if (middleType == LDDNext) {
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        LDButton * btn = [[LDButton alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)];
        [btn setTitle:@"下一个" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self addSubview:btn];
        
    }
    
}
@end
