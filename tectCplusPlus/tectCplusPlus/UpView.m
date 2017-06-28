//
//  UpView.m
//  tectCplusPlus
//
//  Created by 李洞洞 on 27/6/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "UpView.h"
#import "masonry.h"
@interface UpView ()

@end
@implementation UpView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _voiceBtn = [[LDButton alloc]init];
        [_voiceBtn setTitle:@"Voi" forState:UIControlStateNormal];
        [_voiceBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.textAlignment = YES;
        _timeLabel.textColor = [UIColor redColor];
        _questionBtn = [[LDButton alloc]init];
        [_questionBtn setTitle:@"Qui" forState:UIControlStateNormal];
        [_questionBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self addSubview:_voiceBtn];
        [self addSubview:_timeLabel];
        [self addSubview:_questionBtn];
        
        NSString * title = [NSString stringWithFormat:@"时间: 00:%02d",10];
        self.timeLabel.text = title;
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_voiceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.mas_offset(5);
        make.width.and.height.mas_equalTo(44);
    }];
    
    [_questionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.mas_equalTo(44);
        make.right.mas_offset(-5);
        make.top.mas_offset(5);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_voiceBtn.mas_left).mas_offset(5);
        make.right.mas_equalTo(_questionBtn.mas_right).mas_offset(-5);
        make.top.mas_offset(5);
        make.height.mas_equalTo(44);
    }];
}
- (void)startTimer
{
    [self stopTimer];//CADisplayLink
    self.timeCount = 10;
    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(countDown:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];

}
- (void)stopTimer {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}
- (void)countDown:(NSTimer *)timer{
    NSString * title = [NSString stringWithFormat:@"时间: 00:%02d",self.timeCount];
    self.timeLabel.text = title;
    self.timeCount -= 1;
    self.isStop = NO;
    if (self.timeCount == 0) {
        self.isStop = YES;
        self.countStop(self.isStop);
        [self stopTimer];
      }
}

- (void)theCountdown:(Stop)stop
{
    self.countStop = stop;
}
@end
