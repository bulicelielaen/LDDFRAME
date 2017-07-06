//
//  NSObject+Extension.h
//  链式编程
//
//  Created by 李洞洞 on 6/7/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ComputerManager.h"
@interface NSObject (Extension)
+ (NSInteger)addA:(void(^)(ComputerManager* manager))manager;
@end
