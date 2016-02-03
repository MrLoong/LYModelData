//
//  ClassInfo.h
//  LYModelData
//
//  Created by LastDay on 16/2/1.
//  Copyright © 2016年 LastDay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassInfo : NSObject

/**
 *  属性列表
 */
@property(nonatomic,strong) NSDictionary *propertyInfo;

/**
 *  Class
 */
@property(nonatomic,assign) Class cls;

/**
 *  初始化Class信息
 *
 *  @param cls Class
 *
 *  @return 当前类型
 */
-(instancetype)initWithClass : (Class)cls;


/**
 *  建立属性信息
 */
-(void)setClassPropertyInfo;

@end
