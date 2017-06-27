//
//  MiddleView.h
//  tectCplusPlus
//
//  Created by 李洞洞 on 27/6/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,MiddleViewType) {
    LDDMidleKnowOrDontKnow,
    LDDMidleReally,
    LDDNext
};
@interface MiddleView : UIView
@property(nonatomic,assign)MiddleViewType middleType;
@end
