//
//  LDCell.m
//  tectCplusPlus
//
//  Created by 李洞洞 on 26/6/17.
//  Copyright © 2017年 Minte. All rights reserved.
//






/**
 分层解耦 有没有必要把每层都独立抽取出来 在当前类尽量少的写代码 cell里的点击事件 必然要传到Controller去处理 block 这cell上的点击事件 多
 */
#import "LDCell.h"
#import "masonry.h"
#import "BottomView.h"
#import "TopView.h"
@interface LDCell ()
@property(nonatomic,strong)TopView * topView;
@property(nonatomic,strong)BottomView * bottomView;
@property(nonatomic,strong)UIButton * sumBtn;
@property(nonatomic,strong)UIView * spaceView;
@property(nonatomic,strong)UIButton * synchronizeBtn;
@end
@implementation LDCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        _topView = [[TopView alloc]init];
         [self.contentView addSubview:_topView];
        _topView.middleView.middleType = LDDMidleKnowOrDontKnow;//默认
        [_topView.upView startTimer];
        
        for (int i = 0; i < _topView.middleView.subviews.count; i++) {
            LDButton * btn = _topView.middleView.subviews[i];
            btn.block = ^(UIButton * btn){
                if ([btn.currentTitle isEqualToString:@"我知道"]) {
                    self.knowClick(_topView.middleView);
                }
                if ([btn.currentTitle isEqualToString:@"不确定"]) {
                    self.notSureClick(_topView.middleView);
                }
                if ([btn.currentTitle isEqualToString:@"不知道"]) {
                    self.dontKonwClick(_topView.middleView);
                }
                
            };
        }
        
#pragma mark -- 分层解耦
        _bottomView = [[BottomView alloc]init];
        [self.contentView addSubview:_bottomView];
        __weak typeof(self) weakSelf = self;
        _bottomView.sumBtn.block = ^(UIButton *btn){
            weakSelf.sumBtnClicK(@"666");
        };
        _bottomView.synchronizeBtn.block = ^(UIButton*btn){
            weakSelf.synchronizeBtnClick(@"666");
        };
        
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(5);
        make.right.mas_offset(-5);
        make.bottom.mas_offset(-5);
        make.height.mas_equalTo(30);
    }];
    
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(5);
        make.top.mas_offset(5);
        make.right.mas_offset(-5);
        make.bottom.mas_equalTo(_bottomView.mas_top).mas_offset(-5);
    }];
}

- (void)inAWord:(sumBtnClick)sumBtn synchronize:(synchronizeBtnClick)synchronizeBtn knowThat:(KnowThat)know DontKonw:(DontKnow)dontKonw notSure:(NotSure)notSure
{
    self.sumBtnClicK = sumBtn;
    self.synchronizeBtnClick = synchronizeBtn;
    self.knowClick = know;
    self.dontKonwClick = dontKonw;
    self.notSureClick = notSure;
    
}
@end
