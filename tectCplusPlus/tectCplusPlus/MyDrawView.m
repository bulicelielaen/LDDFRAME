//
//  MyDrawView.m
//  myTest
//
//  Created by xinhai on 16/6/2.
//  Copyright © 2016年 zyzx. All rights reserved.
//

#import "MyDrawView.h"
#import <QuartzCore/QuartzCore.h>

@implementation MyDrawView


- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self=[super initWithCoder:aDecoder];
    
    bodyMaxHeight=0.6f;


    arrayBlock=[NSMutableArray array];
    arrayAllValue=[NSMutableArray array];
 /*
    for(int i=0;i<7;++i)
    {
        NSInteger value=10*(i+1);
        NSNumber *num=[NSNumber numberWithInteger:value];
        [arrayBlock addObject:num];
    }
    */
    arrayDate=[NSMutableArray array];
   /*
    for(int i=0;i<7;++i)
    {
        [arrayDate addObject:[NSString stringWithFormat:@"%d",20+i]];
    }
    
    [self calcAllValue];
    */
    
    return self;
}


-(void)drawRect:(CGRect)rect
{
    
    
    for(int i=0;i<arrayBlock.count;++i)
        [self drawBackground:[self getBlockFrame:i]];
    
    for(int i=0;i<arrayBlock.count;++i)
    {
        [self calcBodyBlockPoints:i];
        [self drawBlock:m_ptAry];
    }
}

-(void)drawBlock:(CGPoint*) pt
{
    
    CGFloat color[]={0x21/(float)255, 0x99/(float)255, 0x42/(float)255,1.0};
    CGContextRef conAll=UIGraphicsGetCurrentContext();
    CGContextSetStrokeColor(conAll, color);
    CGContextSetLineWidth(conAll, 1);
    CGContextSetRGBFillColor(conAll, 0x21/(float)255, 0x99/(float)255, 0x42/(float)255, 1);
    //CGContextBeginPath(conAll);
    //CGContextMoveToPoint(conAll, 200, 150);
    CGContextAddLines(conAll, pt, 5);
    CGContextDrawPath(conAll, kCGPathFillStroke);
    
    [self updateDateLabel];
    [self updateDataInfoLabel];

}

-(void)drawBackground:(CGRect) rt
{
    CGContextRef    context= UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 0xe2/(float)255, 0xe2/(float)255, 0xe2/(float)255, 1);
    CGContextFillRect(context, rt);
}

-(void)setData:(NSArray*)data
{
    aryData=data;
}

-(NSInteger)getAllNum
{
    int value=0;
    for(NSNumber *num in arrayBlock){
        value+=[num integerValue];
    }
    
    return value;
}

-(void)calcAllValue{
    int value=0;
    for(int i=0;i<arrayBlock.count;++i){
        NSNumber *num=[arrayBlock objectAtIndex:i];
        value+=[num integerValue];
        [arrayAllValue addObject:[NSNumber numberWithInteger:value]];
    }
}

-(CGRect) getBlockFrame:(NSInteger) index{
    
    CGRect frame=self.frame;
    int nBlockWidth=frame.size.width/arrayBlock.count;
    int nBetween=1;
    int nPosStart=(frame.size.width-nBlockWidth*arrayBlock.count)/2;

    return CGRectMake(index*nBlockWidth+nBetween+nPosStart, 0, nBlockWidth-nBetween, frame.size.height);
}

-(void)calcBodyBlockPoints:(NSInteger)index
{
    int nBetween=1;
    CGRect rtFrame=[self getBlockFrame:index];
    float max=rtFrame.size.height*bodyMaxHeight;
    NSInteger lastValue=[[arrayAllValue objectAtIndex:arrayBlock.count-1]integerValue];
    float dt=max/lastValue;
    
    float thisValue=[[arrayAllValue objectAtIndex:index]integerValue];
    float prevValue=0;
    if(index>0)
    {
        prevValue=[[arrayAllValue objectAtIndex:index-1]integerValue];
    }
    
    int nStartPosY=prevValue*dt;
    int nThisPosY=thisValue*dt;
    int nStartX=rtFrame.origin.x+nBetween;
    int nEndX=rtFrame.origin.x+rtFrame.size.width-nBetween;
    
    m_ptAry[0]=CGPointMake(nStartX, rtFrame.size.height-0);
    m_ptAry[1]=CGPointMake(nStartX, rtFrame.size.height-nStartPosY);
    m_ptAry[2]=CGPointMake(nEndX, rtFrame.size.height-nThisPosY);
    m_ptAry[3]=CGPointMake(nEndX, rtFrame.size.height-0);
    m_ptAry[4]=CGPointMake(nStartX, rtFrame.size.height-0);
}

-(void)reload{
    [arrayBlock removeAllObjects];
    [arrayDate removeAllObjects];
    [arrayAllValue removeAllObjects];
    for(NSDictionary *dict in aryData){
        NSInteger coins=[[dict objectForKey:@"increaseCoin"]integerValue];
        [arrayBlock addObject:[NSNumber numberWithInteger:coins]];
        NSString *date=[dict objectForKey:@"dateStr"];
        [arrayDate addObject:date];
    }

    [self calcAllValue];
    
    [self setNeedsDisplay];
    /*
    for(UIView *view in[self subviews])
    {
        [view removeFromSuperview];
    }
    
    [self updateDateLabel];
     */
}

-(void)updateDateLabel
{
    for(int i=0;i<arrayDate.count;++i)
    {
        UILabel *label=[self getDateLabel:i];
        [self addSubview:label];
    }
}

-(UILabel*)getDateLabel:(NSInteger)index{
    CGRect rtFrame=[self getBlockFrame:index];
    CGRect rtLabel=CGRectMake(rtFrame.origin.x+2, 0, rtFrame.size.width, rtFrame.size.height/6);
    UILabel *label=[[UILabel alloc]initWithFrame:rtLabel];
    label.text=[arrayDate objectAtIndex:index];
    label.textColor=[UIColor colorWithRed:0x2c/(float)255 green:0xa3/(float)255 blue:0x3f/(float)255 alpha:1];
    label.textAlignment=NSTextAlignmentLeft;

    label.font=[UIFont fontWithName:@"DINCondensed-Bold" size:12.0];

    return label;
}

-(void)updateDataInfoLabel
{
    for(int i=0;i<arrayDate.count;++i)
    {
        UILabel *label=[self getDataInfoLabel:i];
        [self addSubview:label];
    }
}

-(UILabel*)getDataInfoLabel:(NSInteger)index{
    CGRect rtFrame=[self getBlockFrame:index];
    CGRect rtLabel=CGRectMake(rtFrame.origin.x+2, rtFrame.size.height/6, rtFrame.size.width, rtFrame.size.height/3);
    UILabel *label=[[UILabel alloc]initWithFrame:rtLabel];
    int nValue=[[arrayAllValue objectAtIndex:index]intValue];
    if(index>0)
    {
        int nPrev=[[arrayAllValue objectAtIndex:index-1]intValue];
        nValue=nValue-nPrev;
    }
    label.text=[NSString stringWithFormat:@"%d",nValue];
    label.textColor=[UIColor colorWithRed:0x2c/(float)255 green:0xa3/(float)255 blue:0x3f/(float)255 alpha:1];
    label.textAlignment=NSTextAlignmentCenter;
    
    label.font=[UIFont fontWithName:@"DINCondensed-Bold" size:18.0];
    
    return label;
}

@end
