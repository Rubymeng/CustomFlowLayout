//
//  ProductCoat.m
//  CustomFlowLayout
//
//  Created by tyhmeng on 16/10/27.
//  Copyright © 2016年 tyhmeng. All rights reserved.
//

#import "ProductCoat.h"

@implementation ProductCoat


- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)productCoatWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

@end
