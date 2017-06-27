//
//  BottomView.m
//  tectCplusPlus
//
//  Created by 李洞洞 on 27/6/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "BottomView.h"
#import "masonry.h"

@interface BottomView ()

@end
@implementation BottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        self.layer.borderColor = [UIColor greenColor].CGColor;
        self.layer.borderWidth = 1;
        _sumBtn = [[LDButton alloc]init];
        [self addSubview:_sumBtn];
        [_sumBtn setTitle:@"综合练习" forState:UIControlStateNormal];
        [_sumBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        _spaceView = [[UIView alloc]init];
        _spaceView.backgroundColor = [UIColor greenColor];
        [self addSubview:_spaceView];
        _synchronizeBtn = [[LDButton alloc]init];
        [self addSubview:_synchronizeBtn];
        [_synchronizeBtn setTitle:@"同步练习" forState:UIControlStateNormal];
        [_synchronizeBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [_synchronizeBtn sizeToFit];
        [_sumBtn sizeToFit];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [_sumBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(5);
        make.bottom.mas_offset(-5);
        make.right.mas_offset(-5);
    }];
    
    [_spaceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(5);
        make.bottom.mas_offset(-5);
        make.width.mas_equalTo(1);
        make.right.mas_equalTo(_sumBtn.mas_left).mas_offset(-5);
    }];
    
    [_synchronizeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(5);
        make.bottom.mas_offset(-5);
        make.right.mas_equalTo(_spaceView.mas_left).mas_offset(-5);
    }];
}


@end
