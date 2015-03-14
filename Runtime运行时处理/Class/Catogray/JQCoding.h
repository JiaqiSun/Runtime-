//
//  JQCoding.h
//  自动字典转模型
//
//  Created by mac on 15-3-14.
//  Copyright (c) 2015年 mac. All rights reserved.
//


#import "NSObject+JQRuntime.h"

/**
 *  使用 define CodingImpl 来替换后面的几行代码  每行要在后面加\
 
     - (id)initWithCoder:(NSCoder *)decoder
     {
        if (self = [super init]) {
        [self decode:decoder];
        }
        return self;
     }
 
     - (void)encodeWithCoder:(NSCoder *)encoder
     {
        [self encode:encoder];
     }
 */
#define CodingImpl \
- (id)initWithCoder:(NSCoder *)decoder \
{ \
if (self = [super init]) { \
[self decode:decoder]; \
} \
return self; \
} \
\
- (void)encodeWithCoder:(NSCoder *)encoder \
{ \
[self encode:encoder]; \
}