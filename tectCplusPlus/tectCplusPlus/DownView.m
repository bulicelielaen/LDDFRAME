//
//  DownView.m
//  tectCplusPlus
//
//  Created by 李洞洞 on 29/6/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "DownView.h"
#import "masonry.h"
@implementation DownView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _exampleL = [[UILabel alloc]init];
        _exampleL.numberOfLines = 0;
        [self addSubview:_exampleL];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_exampleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.mas_offset(5);
        make.right.mas_offset(-5);
    }];
}
@end
