//
//  Book.m
//  自动字典转模型
//
//  Created by mac on 15-3-13.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "Book.h"

@implementation Book

-(NSString *)description{
    return [NSString stringWithFormat:@"%@ %f %@",self.name,self.price,self.publisher];
}

CodingImpl
@end
