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
- (void)inAWord:(sumBtnClick)sumBtn synchronize:(synchronizeBtnClick)synchronizeBtn
{
    self.sumBtnClicK = sumBtn;
    self.synchronizeBtnClick = synchronizeBtn;
}

- (void)setModel:(model *)model
{
    _model = model;
    self.topView.upView.wordLabel.text = model.word;
    self.topView.upView.wordTransitiveL.text = model.wordChinese;
    self.topView.downView.exampleL.text = model.wordExample;
    self.topView.downView.exampleL.hidden = YES;

}

- (void)bottomViewClickEvent:(UIViewController*)Vc
{
    [self inAWord:^(NSString *word) {
        NSLog(@"%@", [NSString stringWithFormat:@"点击了综合练习 当前的单词是:%@",word]);
    } synchronize:^(NSString *word) {
        NSLog(@"点击了同步练习");
        UIViewController * vc = [[UIViewController alloc]init];
        vc.view.backgroundColor = [UIColor lightGrayColor];
        vc.title = @"同步练习";
        [Vc.navigationController pushViewController:vc animated:YES];
    }];

}

- (void)theCountdownEvent
{
    void (^lddFalse)() = ^(){
        self.topView.upView.timeLabel.hidden = YES;
        [self.topView.upView stopTimer];
        self.topView.downView.exampleL.hidden = NO;
    };
    [self.topView.upView theCountdown:^(BOOL isStop) {//倒计时结束
        self.topView.middleView.middleType = LDDNext;
        lddFalse();
    }];
}

- (void)topViewClickEvent:(int)i collectionView:(UICollectionView *)collectionV
{
    void (^lddFalse)() = ^(){
        self.topView.upView.timeLabel.hidden = YES;
        [self.topView.upView stopTimer];
        self.topView.downView.exampleL.hidden = NO;
    };
    void(^lddTure)() = ^(){
        self.topView.upView.timeLabel.hidden = NO;
        self.topView.upView.timeLabel.text = [NSString stringWithFormat:@"时间: 00:%02d",10];
        [self.topView.upView startTimer];
        self.topView.downView.exampleL.hidden = YES;
    };
    void(^repeatCode)() = ^(){
        lddTure();
        [collectionV reloadData];
    };
    [self.topView.middleView knowClick:^(MiddleView *middleView) {
        NSLog(@"我知道");
        middleView.middleType = LDDMidleReally;
        lddFalse();
        
    } dontKonwClick:^(MiddleView *middleView) {
        NSLog(@"不知道");
        middleView.middleType = LDDNext;
        lddFalse();
    } notSureClick:^(MiddleView *middleView) {
        NSLog(@"不确定");
        middleView.middleType = LDDMidleReally;
        lddFalse();
        
    } reallyClick:^(MiddleView *middleView) {//真会假会下一个之后要往下执行
        NSLog(@"真会");
        middleView.middleType = LDDMidleKnowOrDontKnow;
        repeatCode();
        
    } falseWillClick:^(MiddleView *middleView) {
        NSLog(@"假会");
        middleView.middleType = LDDMidleKnowOrDontKnow;
        repeatCode();
        
    } nextClick:^(MiddleView *middleView) {
        NSLog(@"下一个");
        middleView.middleType = LDDMidleKnowOrDontKnow;
        repeatCode();
        
    }];
    

}
@end
