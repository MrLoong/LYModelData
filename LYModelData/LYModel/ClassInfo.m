//
//  ClassInfo.m
//  LYModelData
//
//  Created by LastDay on 16/2/1.
//  Copyright © 2016年 LastDay. All rights reserved.
//

#import "ClassInfo.h"
#import "PropertyInfo.h"
#import <objc/runtime.h>

@implementation ClassInfo

-(instancetype)initWithClass : (Class)cls{
    
    self.cls = cls;
    [self setClassPropertyInfo];
    
    return self;
}


-(void)setClassPropertyInfo{
    Class cls = self.cls;
    
    unsigned int countProperty = 0;
    
    objc_property_t *propertys = class_copyPropertyList(cls,&countProperty);
    NSMutableDictionary *dic = [NSMutableDictionary new];
    
    for (unsigned int i = 0; i<countProperty; i++) {
        PropertyInfo *propertyInfo = [[PropertyInfo alloc] initWithProperty:propertys[i]];
        if (propertyInfo.propertyName!=nil) {
            dic[propertyInfo.propertyName] = propertyInfo;
        }
    }
    self.propertyInfo = dic;
    free(propertys);
}


@end
