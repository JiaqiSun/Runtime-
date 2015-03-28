

#import "NSArray+JQLog.h"

@implementation NSArray (JQLog)


-(NSString *)descriptionWithLocale:(id)locale{


    void(^printDict)(NSDictionary *dict,NSMutableString *stringM) = ^(NSDictionary *dict,NSMutableString *stringM) {
        [stringM appendString:@"\t{\n"];
        __block int index = 0;
        [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            [stringM appendFormat:@"\t%@",((dict.count -1) == index)? ([NSString stringWithFormat:@"\t%@ = %@\n",key,obj]) : ([NSString stringWithFormat:@"\t%@ = %@ ,\n",key,obj])];
            index++ ;
        }];
        [stringM appendFormat:@"\t},\n"];
    };
    
    NSMutableString *stringM = [NSMutableString stringWithFormat:@"(\n"];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[NSDictionary class]]) {
            printDict(obj,stringM);
        }else{
             [stringM appendFormat:@"\t%@",((self.count-1 == idx )? ([NSString stringWithFormat:@"%@\n",obj]) : [NSString stringWithFormat:@"%@,\n",obj])];
        }
    }];
    [stringM appendString:@")\n"];
    return [stringM copy];
}

@end


@interface NSDictionary (JQLog)

@end

@implementation NSDictionary (JQLog)

-(NSString *)descriptionWithLocale:(id)locale{
    void(^printArr)(NSArray *arr,NSMutableString *stringM) = ^(NSArray *arr,NSMutableString *stringM) {
        [arr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//            [stringM appendString:@"("];
        }];
    };
    
     NSMutableString *stringM = [NSMutableString stringWithFormat:@"{\n"];
    __block int index = 0;
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        if ([obj isKindOfClass:[NSArray class]]) {
            printArr(obj,stringM);
        }else{
            [stringM appendFormat:@"%@",(self.count-1 == index )? ([NSString stringWithFormat:@"\t%@ : %@\n",key,obj]) : ([NSString stringWithFormat:@"\t%@ : %@ ,\n",key,obj])];
        }
        
        index++ ;
    }];
    [stringM appendString:@"}\n"];
    return [stringM copy];
}


@end