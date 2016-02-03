//
//  PropertyInfo.h
//  LYModelData
//
//  Created by LastDay on 16/2/1.
//  Copyright © 2016年 LastDay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>


@interface PropertyInfo : NSObject

/**
 * property结构体
 */
@property(nonatomic,assign) objc_property_t property;


/**
 *  属性名
 */
@property(nonatomic,strong) NSString *propertyName;


/**
 *  属性类型
 */
@property(nonatomic,assign) Class typeClass;


/**
 *  建立属性
 */
@property(nonatomic,assign) SEL setter;


/**
 *   初始化属性信息
 *
 *  @param property 属性
 *
 *  @return 当前类型
 */
-(instancetype)initWithProperty:(objc_property_t)property;

@end
