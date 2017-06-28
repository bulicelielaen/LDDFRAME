//
//  TopView.m
//  tectCplusPlus
//
//  Created by 李洞洞 on 27/6/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "TopView.h"
#import "masonry.h"

@interface TopView ()

@end
@implementation TopView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        self.layer.borderColor = [UIColor greenColor].CGColor;
        self.layer.borderWidth = 1;
        
        _middleView = [[MiddleView alloc]init];
        [self addSubview:_middleView];
        
        _upView = [[UpView alloc]init];
        [self addSubview:_upView];
        
        //_downView = [[DownView alloc]init];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_middleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_offset(0);
        make.height.mas_equalTo(60);
        make.centerY.mas_offset(-10);
    }];
    
    [_upView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_offset(0);
        make.top.mas_offset(0);
        make.bottom.mas_equalTo(_middleView.mas_top);
    }];
}
@end
