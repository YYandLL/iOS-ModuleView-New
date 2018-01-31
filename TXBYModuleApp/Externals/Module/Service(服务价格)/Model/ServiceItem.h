//
//  ServiceItem.h
//  sdfyy
//
//  Created by 919575700@qq.com on 10/19/15.
//  Copyright (c) 2015 eeesys. All rights reserved.
//  服务价格模型

#import <Foundation/Foundation.h>

@interface ServiceItem : NSObject

#pragma mark - 列表
/**
 *  主键
 */
@property (nonatomic, copy) NSString *ID;

/**
 *  名称
 */
@property (nonatomic, copy) NSString *name;

/**
 *  单位
 */
@property (nonatomic, copy) NSString *unit;

/**
 *  价格
 */
@property (nonatomic, copy) NSString *price;

#pragma mark - 详情
/**
 *  医疗服务编号
 */
@property (nonatomic, copy) NSString *Code;

/**
 *  项目名称
 */
@property (nonatomic, copy) NSString *ServiceName;

/**
 *  计价单位
 */
@property (nonatomic, copy) NSString *Until;

/**
 *  价格(元)
 */
@property (nonatomic, copy) NSString *Prices;

/**
 *  项目内涵
 */
@property (nonatomic, copy) NSString *ServiceBody;

/**
 *  除外内容
 */
@property (nonatomic, copy) NSString *ServiceContent;

/**
 *  说明
 */
@property (nonatomic, copy) NSString *Note;

/**
 *  模型中增加详情数据
 */
- (instancetype)detailWithDict:(NSDictionary *)dict;

@end