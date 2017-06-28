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
//在外界确定了中间View的风格的时间点 就要确定中间Button的类型和排布 中间按钮的组件交给中间组件自己处理比较合适 然后回调给C 让C协调上\下的View刷新
- (void)setMiddleType:(MiddleViewType)middleType
{
    _middleType = middleType;
    CGFloat width = [UIScreen mainScreen].bounds.size.width / 3.0;
    CGFloat height = 60;
    NSArray * titles = @[@"我知道",@"不确定",@"不知道"];
    if (middleType == LDDMidleKnowOrDontKnow) {//这么干 有点频繁创建对象 销毁对象 有点毁性能
        //只要设置了这个风格 定时器就得开了 组件间的通信
        
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        for (int i = 0; i<3; i++) {//但是点击事件不太好往外搞了 面向接口编程 而且C处理的事件过多 易乱
            LDButton * btn = [[LDButton alloc]initWithFrame:CGRectMake(i * width, 0, width, height)];
            btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
            btn.layer.borderWidth = 0.2;
            [btn setTitle:titles[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            [self addSubview:btn];
            btn.block = ^(UIButton * btn){
                if ([btn.currentTitle isEqualToString:@"我知道"]) {
                    self.knowClick(self);
                }
                if ([btn.currentTitle isEqualToString:@"不确定"]) {
                    self.notSureClick(self);
                }
                if ([btn.currentTitle isEqualToString:@"不知道"]) {
                    self.dontKonwClick(self);
                }
            };
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
            btn.block = ^(UIButton * btn){
                if ([btn.currentTitle isEqualToString:@"真会"]) {
                    self.reallyClick(self);
                }
                if ([btn.currentTitle isEqualToString:@"假会"]) {
                    self.falseWillClick(self);
                }
            };
        }
    }
    if (middleType == LDDNext) {
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        LDButton * btn = [[LDButton alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)];
        [btn setTitle:@"下一个" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self addSubview:btn];
        btn.block = ^(UIButton * btn){
            self.nextClick(self);
        };
        
    }
}

- (void)knowClick:(KnowThat)know dontKonwClick:(DontKnow)dontKnow notSureClick:(NotSure)notSure reallyClick:(Really)really falseWillClick:(False)falseWill nextClick:(Next)next
{
    self.knowClick = know;
    self.dontKonwClick = dontKnow;
    self.notSureClick = notSure;
    self.reallyClick = really;
    self.falseWillClick = falseWill;
    self.nextClick = next;
}

@end
