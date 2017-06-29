//
//  TopView.h
//  tectCplusPlus
//
//  Created by 李洞洞 on 27/6/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MiddleView.h"
#import "UpView.h"
#import "DownView.h"
@interface TopView : UIView
@property(nonatomic,strong)MiddleView * middleView;//上面放置的button有三种风格
//最上层
@property(nonatomic,strong)UpView * upView;
//最下层
@property(nonatomic,strong)DownView * downView;
@end
