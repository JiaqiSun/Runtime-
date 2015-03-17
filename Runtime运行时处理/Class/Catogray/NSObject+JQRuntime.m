//
//  NSObject+Extasion.m
//  自动字典转模型
//
//  Created by mac on 15-3-13.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "NSObject+JQRuntime.h"
#import <objc/runtime.h>
@implementation NSObject (JQRuntime)



#pragma mark - 字典转换成模型

/*
 *  使用规则:
 *  在字典中存在数组的情况下,数组名称的命名 必须以 对象名+s 为标准 否则会报错
 *
 *  例 :  
 *  Book是对象 模型中含有Book类型的数组,数组命名规则必须为: NSArray *books;
 */

/**
 *  根据对象的属性来 查找字典中的Value 并 赋值 给对象属性
 *  如果对象中 包含对象 会根据 字典 创建对象, 并将对象赋给指定的属性 然后在给 新的对象赋值
 *  如果对象中包含 数组 数组的命名格式 必须的以"对象名+s"为标准 例如 对象Book 其数组名 必须为 books 否则出错
 *  @param dict 字典
 */
-(void)setDict:(NSDictionary *)dict{
    
    Class c = self.class;
    
    while (c && c !=[NSObject class]  ) {

        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList(c, &outCount);
        for (int i =0 ; i<outCount; i++) {
            Ivar ivar = ivars[i];
            
            // 此时获取的key 是带 _的 所以 要把 _去掉
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            key = [key substringFromIndex:1];
            
            id value = dict[key];
            if (!value) continue;
            
            NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
//            NSLog(@"%@",type);
            NSRange range = [type rangeOfString:@"@"];
            if (range.location != NSNotFound) {
                type = [type substringWithRange:NSMakeRange(2,type.length - 3)];
                
                if (![type hasPrefix:@"NS"]) {
                    
                    Class class = NSClassFromString(type);
                    
                    // 获取Dictionary 所对应的类 并将该类赋值给value 在setValue时,将Dog所对应的类赋值给Person
                    // 然后再给模型的模型赋值
                    value = [class objectWithDictionary:value];
//                    NSLog(@"value ---%@",value);
                }else if([type isEqual:@"NSArray"]){
                   
                    NSArray *arr = (NSArray *)value;
                    value = [NSMutableArray array];
                     NSString *className = [key substringWithRange:NSMakeRange(0, key.length -1)];
                    for (NSDictionary *dict in arr) {
                       
                        Class class = NSClassFromString([className capitalizedString]);
                        [value addObject: [class objectWithDictionary:dict]];
                        
                    }
                }
            }
//            NSLog(@"%@ %@",key,value);
            [self setValue:value forKeyPath:key];
        
        }
        free(ivars);
        c = [c superclass];
    }
    
    
}

/**
 *  动态的将 字典 转换成 对象模型
 *
 *  @param dict 字典
 *
 *  @return 该对象
 */
+(instancetype)objectWithDictionary:(NSDictionary *)dict{
    id objc = [[self alloc] init];
    [objc setDict:dict];
    return objc;
}


#pragma mark - 字典数组转换成模型数组
/**
 *  将字典中的数组 转换成 模型数组
 *
 *  @param array 字典数组
 *  @param class 要转换成那种模型
 *
 *  @return 模型数组
 */
+(NSArray *)objectWithArray:(NSArray *)array class:(Class)class{
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        id objc = [[class alloc] init];
        [objc setDict:dict];
        [arrayM addObject:objc];
    }
    return [arrayM copy];
}

+(NSArray *)objectWithArray:(NSArray *)array className:(NSString *)className{
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        Class class =NSClassFromString(className);
        id objc = [[class alloc] init];
        [objc setDict:dict];
        [arrayM addObject:objc];
    }
    return [arrayM copy];
}

+(NSArray *)objectArrayWithArray:(NSArray *)array {
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        id objc = [[self alloc] init];
        [objc setDict:dict];
        [arrayM addObject:objc];
    }
    return [arrayM copy];
}

#pragma mark - 解档 和 归档 
#pragma mark 解档
/**
 *  根据解档类的属性和忽略属性 来从指定的文件中 解档
 */
-(void)decode:(NSCoder *)decoder{
    
    Class c = self.class;
    while (c && c != [NSObject class]) {
        
   
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList(c, &outCount);
        for (int i = 0; i<outCount; i++) {
            Ivar ivar = ivars[i];
            
            // 获取到的key 带有 _
            NSString *key = [NSString  stringWithUTF8String: ivar_getName(ivar)];
            
            
            if ([self respondsToSelector:@selector(ignoredNames)]) {
                if([[self ignoredNames] containsObject:key]) continue;
            }
            
            // 从解码器中取出值
            id value = [decoder decodeObjectForKey:key];
            
            // 将值赋给对象属性
            [self  setValue:value forKeyPath:key];
        }
        free(ivars);
        c = [c superclass];
    }
}

#pragma mark 归档
/**
 *  根据归档类的属性和忽略属性 来将信息归档
 */
-(void)encode:(NSCoder *)encoder{
    Class c = self.class;
    while (c && c != [NSObject class]) {
        
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList(c, &outCount);
        for (int i = 0; i<outCount; i++) {
            Ivar ivar = ivars[i];
            
            // 获取到的key 带有 _
            NSString *key = [NSString  stringWithUTF8String: ivar_getName(ivar)];
            
            
            if ([self respondsToSelector:@selector(ignoredNames)]) {
                if([[self ignoredNames] containsObject:key]) continue;
            }
            // 从属性中取出 对象属性value
            id value = [self valueForKeyPath:key];
            
            // 将value 和 key 写入到 归档器中
            [encoder encodeObject:value forKey:key];
            
        }
        free(ivars);
        c = [c superclass];
    }
}


@end
