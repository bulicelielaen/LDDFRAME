//
//  CalculateManager.m
//  tectCplusPlus
//
//  Created by 李洞洞 on 7/7/17.
//  Copyright © 2017年 Minte. All rights reserved.

//  例如masonry中 像这样equalTo(self.view)通过’()’去调用函数,一般调用完返回的还是这个对象本身,就是函数式编程.

#import "CalculateManager.h"

@implementation CalculateManager

- (instancetype)calculate:(int (^)(int))calc   //block有返回值 是因为需要保存每次计算的结果值  有参数是 需要外界传入需要计算的值 整个对象方法 以block为参数是让外界在这个block里写代码 高聚合  整个对象方法 返回instancetype是因为返回CalculateManager类本身 才能继续调用该类的其他方法 如result的get方法 这也是用对象方法 不用类方法的缘故 类方法不能掉当前类的属性的get方法等
{
    _result = calc(_result);
    return self;
}
@end
