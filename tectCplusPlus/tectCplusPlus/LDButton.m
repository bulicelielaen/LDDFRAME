//
//  LDButton.m
//  ReactiveCoco思想封装UIButton
//
//  Created by 李洞洞 on 12/9/16.
//  Copyright © 2016年 Minte. All rights reserved.
//

#import "LDButton.h"

@implementation LDButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return self;
}
- (void)buttonClick:(LDButton *)btn
{
    if (self.block) {
        self.block(btn);
    }
}





@end
