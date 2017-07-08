//
//  LDCell.h
//  tectCplusPlus
//
//  Created by 李洞洞 on 26/6/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TopView,BottomView,model;

@class TopView,BottomView;

//所有的点击事件全用block回调
typedef void(^sumBtnClick)(NSString * word);
typedef void(^synchronizeBtnClick)(NSString * word);
@interface LDCell : UICollectionViewCell
@property(nonatomic,copy)sumBtnClick sumBtnClicK;
@property(nonatomic,copy)synchronizeBtnClick synchronizeBtnClick;
@property(nonatomic,strong)model * model;
@property(nonatomic,strong)TopView * topView;
@property(nonatomic,strong)BottomView * bottomView;
//所有点击事件 集中写在一个方法里 供Controller处理
- (void)inAWord:(sumBtnClick)sumBtn synchronize:(synchronizeBtnClick)synchronizeBtn;

@end
