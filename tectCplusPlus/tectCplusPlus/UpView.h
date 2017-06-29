//
//  UpView.h
//  tectCplusPlus
//
//  Created by 李洞洞 on 27/6/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LDButton.h"
typedef void(^Stop) (BOOL isStop);
@interface UpView : UIView
@property(nonatomic,strong)LDButton * voiceBtn;
@property(nonatomic,strong)UILabel * timeLabel;
@property(nonatomic,strong)LDButton * questionBtn;
@property(nonatomic,strong)UILabel * wordLabel;
@property(nonatomic,strong)UILabel * wordTransitiveL;
@property(nonatomic,strong)NSTimer * timer;
@property(nonatomic,assign)int timeCount;
@property(nonatomic,assign)BOOL isStop;
@property(nonatomic,copy)Stop countStop;
- (void)startTimer;
- (void)stopTimer;
- (void)theCountdown:(Stop)stop;
@end
