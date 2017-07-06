//
//  NSObject+Extension.m
//  链式编程
//
//  Created by 李洞洞 on 6/7/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "NSObject+Extension.h"

@implementation NSObject (Extension)
+ (NSInteger)addA:(void (^)(ComputerManager *))manager
/* 
 1.外界传进来这么一段代码块
 ^(ComputerManager *manager) {
 manager.addA(2).addA(2).addA(3);
 }
 2.manager(manager1);//调用上面这段代码块 需要一个ComputerManager *manager参数 所以alloc init一个该参数类型的对象传进去
 3.类方法的返回值
 */
{
    ComputerManager * manager1 = [[ComputerManager alloc]init];
    manager(manager1);//block的调用 这个调用作用是 让外界传进来的这段代码块调用 ->引发代码块里的代码执行manager1.addA(2).addA(2).addA(3);->调起ComputerManager类里的"get"方法 进而返回自身对象 无限制往下调自身的方法
    return manager1.result;//当前->类方法的返回值
}
@end
