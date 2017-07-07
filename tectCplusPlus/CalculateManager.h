//
//  CalculateManager.h
//  tectCplusPlus
//
//  Created by 李洞洞 on 7/7/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculateManager : NSObject
@property(nonatomic,assign)int result;//保存计算结果
- (instancetype)calculate:(int(^)(int))calc;
@end
