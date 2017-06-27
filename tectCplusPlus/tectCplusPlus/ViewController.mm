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
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)NSMutableArray * dataSource;
@property (weak, nonatomic) IBOutlet MyDrawView *drawView;
@property(nonatomic,strong)UICollectionView * collectionView;
@end
static NSString * const cellID = @"ldcell";
@implementation ViewController

#pragma mark collectionView
- (UICollectionView*)collectionView
{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout* flowLayout =
        [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        //一个item包含两个页面 倒计时结束 展示第二个页面
        flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH * 1 , SCREEN_HEIGHT - 64);
        flowLayout.minimumLineSpacing = 0;
        //flowLayout.minimumInteritemSpacing = 0;
//        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
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
    
    //应该以一个单词为
    [cell inAWord:^(NSString *word) {
        NSLog(@"%@", [NSString stringWithFormat:@"点击了综合练习 当前的单词是:%@",word]);
    } synchronize:^(NSString *word) {
        NSLog(@"点击了同步练习");
    } knowThat:^(MiddleView * middleView) {
        NSLog(@"点击了 知道");
        middleView.middleType = LDDMidleReally;
    } DontKonw:^(MiddleView * middleView) {
        NSLog(@"点击了 不知道");
        middleView.middleType = LDDNext;
    } notSure:^(MiddleView * middleView) {
        NSLog(@"点击了 不确定");
        middleView.middleType = LDDMidleReally;
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
- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        NSDictionary * dict1 = @{
                                 @"dateStr" :@"06-20",
                                 @"increaseCoin" : @(0),
                                 @"points" : @(2203),
                                 @"recordDate" : @(1497888000000),
                                 @"userId" : @(22165)
                                 };
        NSDictionary * dict2 = @{
                                 @"dateStr" :@"06-21",
                                 @"increaseCoin" : @(0),
                                 @"points" : @(2203),
                                 @"recordDate" : @(1497888000000),
                                 @"userId" : @(22165)
                                 };
        NSDictionary * dict3 = @{
                                 @"dateStr" :@"06-21",
                                 @"increaseCoin" : @(0),
                                 @"points" : @(2203),
                                 @"recordDate" : @(1497888000000),
                                 @"userId" : @(22165)
                                 };
        NSDictionary * dict4 = @{
                                 @"dateStr" :@"06-22",
                                 @"increaseCoin" : @(7),
                                 @"points" : @(2210),
                                 @"recordDate" : @(1498147200000),
                                 @"userId" : @(22165)
                                 };
        NSDictionary * dict5 = @{
                                 @"dateStr" :@"06-22",
                                 @"increaseCoin" : @(7),
                                 @"points" : @(2210),
                                 @"recordDate" : @(1498147200000),
                                 @"userId" : @(22165)
                                 };
        NSDictionary * dict6 = @{
                                 @"dateStr" :@"06-22",
                                 @"increaseCoin" : @(7),
                                 @"points" : @(2210),
                                 @"recordDate" : @(1498147200000),
                                 @"userId" : @(22165)
                                 };
        NSDictionary * dict7 = @{
                                 @"dateStr" :@"06-22",
                                 @"increaseCoin" : @(7),
                                 @"points" : @(2210),
                                 @"recordDate" : @(1498147200000),
                                 @"userId" : @(22165)
                                 };
        NSDictionary * dict8 = @{
                                 @"dateStr" :@"06-22",
                                 @"increaseCoin" : @(10),
                                 @"points" : @(2210),
                                 @"recordDate" : @(1498147200000),
                                 @"userId" : @(22165)
                                 };
        
        _dataSource = [NSMutableArray arrayWithArray:@[dict1,dict2,dict3,dict4,dict5,dict6,dict7,dict8]];
    }
    return _dataSource;
}


























































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
