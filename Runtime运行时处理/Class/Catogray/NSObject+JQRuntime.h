//
//  NSObject+Extasion.h
//  自动字典转模型
//
//  Created by mac on 15-3-13.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extasion)

#pragma mark - 字典转换成模型
/*
 *  使用规则:
 *  在字典中存在数组的情况下,数组名称的命名 必须以 对象名+s 为标准 否则会报错
 *
 *  例 :
 *  Book是对象 模型中含有Book类型的数组,数组命名规则必须为: NSArray *books;
 */
+(instancetype)objectWithDictionary:(NSDictionary *)dict;


#pragma mark - 字典数组转换成模型数组
/**
 *  将字典中的数组 转换成 模型数组
 *
 *  @param array 字典数组
 *  @param class 要转换成那种模型
 *
 *  @return 模型数组
 */
+(NSArray *)objectWithArray:(NSArray *)array className:(NSString *)className  NS_DEPRECATED_IOS( 2_0, 2_0) ;
+(NSArray *)objectWithArray:(NSArray *)array class:(Class)class  NS_DEPRECATED_IOS(2_0, 2_0);
+(NSArray *)objectArrayWithArray:(NSArray *)array;

#pragma mark - 归档和解档处理 
/*
 * 使用规则: 
 * 在使用归档和解档的时候需要导入 JQCoding.h头文件
 * 然后直接归档解档处理就行了
 */

#pragma mark 忽略的归档和解档属性
/**
 *  忽略的属性  在归档和解档中 会存在一些属性 不必要写入归档中
 */
- (NSArray *)ignoredNames;

#pragma mark 解档操作
-(void)decode:(NSCoder *)decoder;

#pragma mark 解档操作
-(void)encode:(NSCoder *)encoder;
@end
