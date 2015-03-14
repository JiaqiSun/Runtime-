//
//  Dog.h
//  自动字典转模型
//
//  Created by mac on 15-3-14.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JQCoding.h"
@class Bone;
@interface Dog : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic,assign) float price;
@property (nonatomic, strong)  Bone *bone;
@end
