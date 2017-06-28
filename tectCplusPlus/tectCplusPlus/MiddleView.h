//
//  MiddleView.h
//  tectCplusPlus
//
//  Created by 李洞洞 on 27/6/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MiddleView;
@class UpView;
typedef NS_ENUM(NSUInteger,MiddleViewType) {
    LDDMidleKnowOrDontKnow,
    LDDMidleReally,
    LDDNext
};

typedef void(^KnowThat)(MiddleView * middleView);
typedef void(^DontKnow)(MiddleView * middleView);
typedef void(^NotSure)(MiddleView * middleView);

typedef void(^Really)(MiddleView * middleView);
typedef void(^False)(MiddleView * middleView);
typedef void(^Next)(MiddleView * middleView);

@interface MiddleView : UIView
@property(nonatomic,assign)MiddleViewType middleType;
@property(nonatomic,copy)KnowThat knowClick;
@property(nonatomic,copy)DontKnow dontKonwClick;
@property(nonatomic,copy)NotSure notSureClick;
@property(nonatomic,copy)Really reallyClick;
@property(nonatomic,copy)False falseWillClick;
@property(nonatomic,copy)Next nextClick;

- (void)knowClick:(KnowThat)know dontKonwClick:(DontKnow)dontKnow notSureClick:(NotSure)notSure reallyClick:(Really)really falseWillClick:(False)falseWill nextClick:(Next)next;
@end
