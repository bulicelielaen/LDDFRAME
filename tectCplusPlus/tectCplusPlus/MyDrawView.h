//
//  MyDrawView.h
//  myTest
//
//  Created by xinhai on 16/6/2.
//  Copyright © 2016年 zyzx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyDrawView : UIView{
    NSMutableArray  *arrayBlock;
    NSMutableArray  *arrayAllValue;
    NSMutableArray  *arrayDate;
    float       bodyMaxHeight;
    CGPoint     m_ptAry[5];
    
    NSArray    *aryData;
}

-(void)setData:(NSArray*)data;
-(void)reload;

@end
