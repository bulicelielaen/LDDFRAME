//
//  ComputerManager.m
//  链式编程
//
//  Created by 李洞洞 on 6/7/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "ComputerManager.h"

@implementation ComputerManager
- (lddBlock)addA       //lddBlock  ComputerManager *(^)(NSInterger)
{
    return ^(NSInteger a1){//这表示block的参数
        _result += a1;
        return self;//这表示block的返回值
    };
}
@end
