//
//  Person.m
//  自动字典转模型
//
//  Created by mac on 15-3-13.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "Person.h"

@implementation Person

-(NSString *)description{
    NSMutableString *print = [NSMutableString stringWithFormat:@"\n name: %@\n height: %f\n age: %d\n image: %@\n dog: %@\n ",self.name,self.height,self.age,self.image, self.dog];
    for (int i = 0; i<self.books.count; i++) {
         [print appendFormat:@"book: %@ \n" ,self.books[i]];
    }
    return print;
}

CodingImpl
@end
