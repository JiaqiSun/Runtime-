//
//  Person.h
//  自动字典转模型
//
//  Created by mac on 15-3-13.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JQCoding.h"
@class Dog;
@interface Person : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic,assign) int age;
@property (nonatomic,assign) float height;
@property (nonatomic, strong) Dog  *dog;
@property (nonatomic, strong) NSArray *books;
@property (nonatomic, strong)  UIImage *image;
//@property (nonatomic, strong) NSValue *value;
//@property (nonatomic, assign) NSInteger aa;

@end
