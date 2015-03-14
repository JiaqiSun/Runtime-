//
//  Dog.m
//  自动字典转模型
//
//  Created by mac on 15-3-14.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "Dog.h"

@implementation Dog

-(NSString *)description{

    return [NSString stringWithFormat:@"name: %@ price: %f bone: %@",self.name,self.price,self.bone];
}

CodingImpl
@end
