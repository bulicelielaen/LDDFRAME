//
//  LDCell.h
//  tectCplusPlus
//
//  Created by 李洞洞 on 26/6/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MiddleView;
//所有的点击事件全用block回调
typedef void(^sumBtnClick)(NSString * word);
typedef void(^synchronizeBtnClick)(NSString * word);

//他们点击了之后需要改变中间控件上的风格 所以需要链式编程
typedef void(^KnowThat)(MiddleView * middleView);
typedef void(^DontKnow)(MiddleView * middleView);
typedef void(^NotSure)(MiddleView * middleView);

@interface LDCell : UICollectionViewCell


@property(nonatomic,copy)sumBtnClick sumBtnClicK;
@property(nonatomic,copy)synchronizeBtnClick synchronizeBtnClick;

@property(nonatomic,copy)KnowThat knowClick;
@property(nonatomic,copy)DontKnow dontKonwClick;
@property(nonatomic,copy)NotSure notSureClick;


//所有点击事件 集中写在一个方法里 供Controller处理
- (void)inAWord:(sumBtnClick)sumBtn synchronize:(synchronizeBtnClick)synchronizeBtn knowThat:(KnowThat)know DontKonw:(DontKnow)dontKonw notSure:(NotSure)notSure;

@end
