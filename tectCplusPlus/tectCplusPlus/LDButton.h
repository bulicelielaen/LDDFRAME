//
//  LDButton.h
//  ReactiveCoco思想封装UIButton
//
//  Created by 李洞洞 on 12/9/16.
//  Copyright © 2016年 Minte. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^LD)(UIButton *);

@interface LDButton : UIButton

@property(nonatomic,copy)LD block;


@end
