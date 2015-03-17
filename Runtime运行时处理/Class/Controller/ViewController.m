//
//  ViewController.m
//  自动字典转模型
//
//  Created by mac on 15-3-13.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+JQRuntime.h"
#import "Dog.h"
#import "Bone.h"
#import "Book.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self arrayToModel];
}
-(void)coding{

    Bone *bone = [[Bone alloc ] init];
    bone.name = @"1213";
    bone.weight = 20.0f;
    
    //    [NSKeyedArchiver archiveRootObject:bone toFile:@"/Users/mac/Desktop/dog.hm"];
    
    Bone *p = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/mac/Desktop/dog.hm"];
    NSLog(@"%@",p);
}

-(void)dictArrayToModelArray{

    
    NSDictionary *dict1 = @{
                            @"name" : @"jack",
                            @"age" : @20,
                            @"height" : @"1.55",
                            @"dog" : @{
                                    @"name" : @"wangcai",
                                    @"price" : @"100",
                                    @"bone" : @{
                                            @"name" : @"狗骨头",
                                            @"weight" : @"200"
                                            }
                                    },
                            @"books" : @[
                                    @{
                                        @"name" : @"好书",
                                        @"price" : @10.6,
                                        @"publisher" : @"清华大学出版社"
                                        },
                                    @{
                                        @"name" : @"坏书",
                                        @"price" : @14.6,
                                        @"publisher" : @"北京大学出版社"
                                        }
                                    ],
                            
                            @"money" : @"100"
                            };
    
    NSDictionary *dict2 = @{
                            @"name" : @"ROOl",
                            @"age" : @20,
                            @"height" : @"1.55",
                            @"dog" : @{
                                    @"name" : @"wangcai",
                                    @"price" : @"100",
                                    @"bone" : @{
                                            @"name" : @"狗骨头",
                                            @"weight" : @"200"
                                            }
                                    },
                            @"books" : @[
                                    @{
                                        @"name" : @"好书",
                                        @"price" : @10.6,
                                        @"publisher" : @"清华大学出版社"
                                        },
                                    @{
                                        @"name" : @"坏书",
                                        @"price" : @14.6,
                                        @"publisher" : @"北京大学出版社"
                                        }
                                    ],
                            
                            @"money" : @"100"
                            };
    
    NSDictionary *dict3 = @{
                            @"name" : @"jack",
                            @"age" : @20,
                            @"height" : @"1.55",
                            @"dog" : @{
                                    @"name" : @"wangcai",
                                    @"price" : @"100",
                                    @"bone" : @{
                                            @"name" : @"狗骨头",
                                            @"weight" : @"200"
                                            }
                                    },
                            @"books" : @[
                                    @{
                                        @"name" : @"好书",
                                        @"price" : @10.6,
                                        @"publisher" : @"清华大学出版社"
                                        },
                                    @{
                                        @"name" : @"坏书",
                                        @"price" : @14.6,
                                        @"publisher" : @"北京大学出版社"
                                        }
                                    ],
                            
                            @"money" : @"100"
                            };
    
    NSDictionary *dict4 = @{
                            @"name" : @"jack",
                            @"age" : @20,
                            @"height" : @"1.55",
                            @"dog" : @{
                                    @"name" : @"wangcai",
                                    @"price" : @"100",
                                    @"bone" : @{
                                            @"name" : @"狗骨头",
                                            @"weight" : @"200"
                                            }
                                    },
                            @"books" : @[
                                    @{
                                        @"name" : @"好书",
                                        @"price" : @10.6,
                                        @"publisher" : @"清华大学出版社"
                                        },
                                    @{
                                        @"name" : @"坏书",
                                        @"price" : @14.6,
                                        @"publisher" : @"北京大学出版社"
                                        }
                                    ],
                            
                            @"money" : @"100"
                            };
    
    NSDictionary *dict5 = @{
                            @"name" : @"jack",
                            @"age" : @20,
                            @"height" : @"1.55",
                            @"dog" : @{
                                    @"name" : @"wangcai",
                                    @"price" : @"100",
                                    @"bone" : @{
                                            @"name" : @"狗骨头",
                                            @"weight" : @"200"
                                            }
                                    },
                            @"books" : @[
                                    @{
                                        @"name" : @"好书",
                                        @"price" : @10.6,
                                        @"publisher" : @"清华大学出版社"
                                        },
                                    @{
                                        @"name" : @"坏书",
                                        @"price" : @14.6,
                                        @"publisher" : @"北京大学出版社"
                                        }
                                    ],
                            
                            @"money" : @"100"
                            };
    
    NSArray *arr = @[dict1,dict2,dict3,dict4,dict5];
//    NSArray *persons = [NSArray objectWithArray:arr class:[Person class]];
    NSArray *persons = [Person objectArrayWithArray:arr];
    [persons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"-----------");
        NSLog(@"%@",obj);
    }];
    

}
-(void)arrayToModel{
    NSArray *arr =@[
                    @{
                        @"name" : @"好书",
                        @"price" : @10.6,
                        @"publisher" : @"清华大学出版社"
                        },
                    @{
                        @"name" : @"坏书",
                        @"price" : @14.6,
                        @"publisher" : @"北京大学出版社"
                        }];
    
    // 已过时
//    NSArray *b = [NSArray objectWithArray:arr className:@"Book"] ;
    
    NSArray *b = [Person objectArrayWithArray:arr];

    [b enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"%@",obj);
    }];
   
    
    
}

-(void)dictToModal{
        NSDictionary *dict = @{
                               @"name" : @"jack",
                               @"age" : @20,
                               @"height" : @"1.55",
                               @"dog" : @{
                                       @"name" : @"wangcai",
                                       @"price" : @"100",
                                       @"bone" : @{
                                               @"name" : @"狗骨头",
                                               @"weight" : @"200"
                                               }
                                       },
                               @"books" : @[
                                       @{
                                           @"name" : @"好书",
                                           @"price" : @10.6,
                                           @"publisher" : @"清华大学出版社"
                                           },
                                       @{
                                           @"name" : @"坏书",
                                           @"price" : @14.6,
                                           @"publisher" : @"北京大学出版社"
                                           }
                                       ],
    
                                @"money" : @"100"
                               };
        Person *p =[Person objectWithDictionary:dict];
//
    [NSKeyedArchiver archiveRootObject:p toFile:@"/Users/mac/Desktop/dog.hm"];
    
//    Person *p = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/mac/Desktop/dog.hm"];
    NSLog(@"%@",p);
    
//    NSLog(@"%@",p);
    //        NSLog(@"%@",p.dog.name);
    //        NSLog(@"%@",p.dog.bone.name);


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
