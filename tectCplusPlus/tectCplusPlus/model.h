//
//  model.h
//  tectCplusPlus
//
//  Created by 李洞洞 on 29/6/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface model : NSObject
//@{@"word":word,@"wordChinese":wordChinese,@"wordExample":wordExample};
@property(nonatomic,copy)NSString * word;
@property(nonatomic,copy)NSString * wordChinese;
@property(nonatomic,copy)NSString * wordExample;
//@property(nonatomic,copy)NSString * wordAudio;
@end
