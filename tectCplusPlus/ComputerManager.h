//
//  ComputerManager.h
//  链式编程
//
//  Created by 李洞洞 on 6/7/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ComputerManager;
typedef ComputerManager * (^lddBlock)(NSInteger);
@interface ComputerManager : NSObject
@property(nonatomic,assign)NSInteger result;
- (ComputerManager*(^)(NSInteger))addA;

- (NSInteger)hahaha:(NSInteger)a;//如果有参数 外界点语法就调不出来 没参数 相当于get方法
@end
