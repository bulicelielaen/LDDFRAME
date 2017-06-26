//
//  LDCell.m
//  tectCplusPlus
//
//  Created by 李洞洞 on 26/6/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "LDCell.h"

@implementation LDCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
        _label.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_label];
    }
    return self;
}
@end
