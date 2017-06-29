//
//  ViewController.m
//  tectCplusPlus
//
//  Created by 李洞洞 on 26/6/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "ViewController.h"
#include "QuiziiCode.h"
#import "MyDrawView.h"
#import "masonry.h"
#import "LDCell.h"
#import "MiddleView.h"
#import "UpView.h"
#import "TopView.h"
#import "model.h"
#import "MJExtension.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)NSMutableArray * dataSource;
@property (weak, nonatomic) IBOutlet MyDrawView *drawView;
@property(nonatomic,strong)UICollectionView * collectionView;
@end
static NSString * const cellID = @"ldcell";
@implementation ViewController
//定义全局变量
static int i = 0;

#pragma mark -- 假数据
- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        for (int i = 0; i<10; i++) {
            NSString * word = [NSString stringWithFormat:@"%@%d",@"word",i];
            NSString * wordChinese = [NSString stringWithFormat:@"%@%d",@"单词翻译",i];
            NSString * wordExample = [NSString stringWithFormat:@"%@%d",@"单词例句单词例句单词例句单词例句单词例句",i];
            NSDictionary * dict = @{@"word":word,@"wordChinese":wordChinese,@"wordExample":wordExample};
            model * m = [model mj_objectWithKeyValues:dict];
            [_dataSource addObject:m];
        }
    }
    return _dataSource;
}
#pragma mark collectionView
- (UICollectionView*)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout* flowLayout =
        [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH * 1 , SCREEN_HEIGHT - 64);
        flowLayout.minimumLineSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64.0)
                                             collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[LDCell class] forCellWithReuseIdentifier:cellID];
        _collectionView.pagingEnabled = YES;
        _collectionView.backgroundColor = [UIColor clearColor];
      }
    return _collectionView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self buildingMainFrame];
    
    
}
//搭建主框架
- (void)buildingMainFrame
{
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:82/255.0 green:175/255.0 blue:77/255.0 alpha:1];
    //self.navigationItem.title = @"小学(历史)三年级上册";
    [self.view addSubview:self.collectionView];
}
#pragma mark -- collectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LDCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    if (i == self.dataSource.count - 1) {
        //结束
        i = 0;
    }
    model * firstM = self.dataSource[i];
    cell.topView.upView.wordLabel.text = firstM.word;
    cell.topView.upView.wordTransitiveL.text = firstM.wordChinese;
    cell.topView.downView.exampleL.text = firstM.wordExample;
    cell.topView.downView.exampleL.hidden = YES;
    
    [cell inAWord:^(NSString *word) {
        NSLog(@"%@", [NSString stringWithFormat:@"点击了综合练习 当前的单词是:%@",word]);
    } synchronize:^(NSString *word) {
        NSLog(@"点击了同步练习");
        UIViewController * vc = [[UIViewController alloc]init];
        vc.view.backgroundColor = [UIColor lightGrayColor];
        vc.title = @"同步练习";
        [self.navigationController pushViewController:vc animated:YES];
    }];
    
    
    void (^lddFalse)() = ^(){
        cell.topView.upView.timeLabel.hidden = YES;
        [cell.topView.upView stopTimer];
        cell.topView.downView.exampleL.hidden = NO;
    };
    void(^lddTure)() = ^(){
        cell.topView.upView.timeLabel.hidden = NO;
        cell.topView.upView.timeLabel.text = [NSString stringWithFormat:@"时间: 00:%02d",10];
        [cell.topView.upView startTimer];
        cell.topView.downView.exampleL.hidden = YES;
    };
    void(^repeatCode)() = ^(){
        lddTure();
        i++;
        [self.collectionView reloadData];
    };
    [cell.topView.middleView knowClick:^(MiddleView *middleView) {
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
    
    [cell.topView.upView theCountdown:^(BOOL isStop) {//倒计时结束
       cell.topView.middleView.middleType = LDDNext;
       lddFalse();
    }];
    

    return cell;
}


































































//图形化界面
- (void)setUpUI
{
    
    [self.drawView setData:self.dataSource];
    [self.drawView reload];
    [self.view addSubview:self.drawView];
}
//- (NSMutableArray *)dataSource
//{
//    if (!_dataSource) {
//        _dataSource = [NSMutableArray array];
//        NSDictionary * dict1 = @{
//                                 @"dateStr" :@"06-20",
//                                 @"increaseCoin" : @(0),
//                                 @"points" : @(2203),
//                                 @"recordDate" : @(1497888000000),
//                                 @"userId" : @(22165)
//                                 };
//        NSDictionary * dict2 = @{
//                                 @"dateStr" :@"06-21",
//                                 @"increaseCoin" : @(0),
//                                 @"points" : @(2203),
//                                 @"recordDate" : @(1497888000000),
//                                 @"userId" : @(22165)
//                                 };
//        NSDictionary * dict3 = @{
//                                 @"dateStr" :@"06-21",
//                                 @"increaseCoin" : @(0),
//                                 @"points" : @(2203),
//                                 @"recordDate" : @(1497888000000),
//                                 @"userId" : @(22165)
//                                 };
//        NSDictionary * dict4 = @{
//                                 @"dateStr" :@"06-22",
//                                 @"increaseCoin" : @(7),
//                                 @"points" : @(2210),
//                                 @"recordDate" : @(1498147200000),
//                                 @"userId" : @(22165)
//                                 };
//        NSDictionary * dict5 = @{
//                                 @"dateStr" :@"06-22",
//                                 @"increaseCoin" : @(7),
//                                 @"points" : @(2210),
//                                 @"recordDate" : @(1498147200000),
//                                 @"userId" : @(22165)
//                                 };
//        NSDictionary * dict6 = @{
//                                 @"dateStr" :@"06-22",
//                                 @"increaseCoin" : @(7),
//                                 @"points" : @(2210),
//                                 @"recordDate" : @(1498147200000),
//                                 @"userId" : @(22165)
//                                 };
//        NSDictionary * dict7 = @{
//                                 @"dateStr" :@"06-22",
//                                 @"increaseCoin" : @(7),
//                                 @"points" : @(2210),
//                                 @"recordDate" : @(1498147200000),
//                                 @"userId" : @(22165)
//                                 };
//        NSDictionary * dict8 = @{
//                                 @"dateStr" :@"06-22",
//                                 @"increaseCoin" : @(10),
//                                 @"points" : @(2210),
//                                 @"recordDate" : @(1498147200000),
//                                 @"userId" : @(22165)
//                                 };
//        
//        _dataSource = [NSMutableArray arrayWithArray:@[dict1,dict2,dict3,dict4,dict5,dict6,dict7,dict8]];
//    }
//    return _dataSource;
//}


























































- (void)testData
{
    NSString * src = @"/Users/lidongdong/Desktop/LDDDY/bag_L.jpg.enc";
    NSRange rang = [src rangeOfString:@"/" options:NSBackwardsSearch];
    //NSLog(@"%@",NSStringFromRange(rang));207 1
    NSString * strName = [src substringFromIndex:rang.location+1];
    //NSLog(@"%@",strName);
    rang = [strName rangeOfString:@"." options:NSBackwardsSearch];
    strName = [strName substringToIndex:rang.location];
    //NSLog(@"%@",strName);
    NSString *strDir=NSTemporaryDirectory();
    strDir = [strDir stringByAppendingPathComponent:strName];
    //NSLog(@"%@",strDir);//文件名称 拼接到temp路径下
    
    QuiziiCode decode;
    decode.initQuiziiCode();
    
    NSData * data = [NSData dataWithContentsOfFile:src];
    long len = [data length];
    rang.location = 4;
    rang.length = len - 4;
    
    unsigned char *buf = new unsigned char[len - 4];
    [data getBytes:buf range:rang];
    decode.decodeBuffer(buf, len-4);
    NSData * outData = [NSData dataWithBytes:buf length:len -4];
    [outData writeToFile:strDir atomically:YES];
    NSLog(@"%@",strDir);

}


@end
