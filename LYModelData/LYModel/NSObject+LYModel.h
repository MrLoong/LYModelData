//
//  NSObject+LYModel.h
//  LYModelData
//
//  Created by LastDay on 16/1/28.
//  Copyright © 2016年 LastDay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "ClassInfo.h"
#import "PropertyInfo.h"

@interface NSObject(LYModel)

/**
 *  JSON转化为Model
 *
 *  @return 返回当前创建的实例，失败返回
 */
+(instancetype)ly_modelWithJSON:(id) json;

/**
 *  映射到实例属性的一个键值字典。
 *
 *  @return 返回NSdictonary创建的实例，失败返回
 */
+(instancetype)ly_modelWithDictonary:(NSDictionary *)dictonary;

/**
 *  遍历属性信息
 *
 *  @return 是否成功 YES 或 NO
 */
-(BOOL)ly_modelSelectProperties:(NSDictionary *)dictonary;

@end
