//
//  DrugMenuItem.m
//  sdfyy
//
//  Created by 919575700@qq.com on 10/19/15.
//  Copyright (c) 2015 eeesys. All rights reserved.
//

#import "DrugMenuItem.h"
#import "DrugList.h"

@implementation DrugMenuItem

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"items":[DrugList class]};
}

@end