//
//  NSObject+LYModel.m
//  LYModelData
//
//  Created by LastDay on 16/1/28.
//  Copyright © 2016年 LastDay. All rights reserved.
//

#import "NSObject+LYModel.h"
#import <objc/message.h>

@implementation NSObject(LYModel)

+(instancetype)LYModelWithJSON :(id)json{
    NSDictionary *dic = json;
    return [self LYModelWithDictonary:dic];
}

+(instancetype)LYModelWithDictonary:(NSDictionary *)dictonary{
    
    Class object = [self class];
    NSObject *modelObject = [object new];
    
    if ([modelObject LYModelSelectProperties:dictonary]) {
        return modelObject;
    }
    return nil;
}


-(BOOL)LYModelSelectProperties:(NSDictionary *)dictonary{
    
    
    ClassInfo *cls = [[ClassInfo alloc]initWithClass:object_getClass(self)];
    id key, value;
    NSArray *keys = [dictonary allKeys];
    NSUInteger count = [keys count];
    for (int i = 0; i < count; i++){
        key = [keys objectAtIndex: i];
        value = [dictonary objectForKey: key];
        
        if (cls.propertyInfo[key]) {
            [self LYModelSetPropertyWithModel:value propertyInfo:cls.propertyInfo[key]];
        }
    }
    return YES;
}
-(id)LYModelToJson{
    id jsonObject = [self LYModelToJsonObject];
    return jsonObject;
}

-(id)LYModelToJsonObject{
    
    Class cls = self.class;
    unsigned int countProperty = 0;
    objc_property_t *propertys = class_copyPropertyList(cls,&countProperty);
    NSMutableDictionary *dic = [NSMutableDictionary new];
    
    for (unsigned int i = 0; i<countProperty; i++) {
        PropertyInfo *propertyInfo = [[PropertyInfo alloc] initWithProperty:propertys[i]];
        if (propertyInfo.propertyName!=nil) {
            dic[propertyInfo.propertyName] = [self LYModelSetJsonWith: propertyInfo];
        }
    }
    return dic;
}

-(void)LYModelSetPropertyWithModel:(id)value propertyInfo:(PropertyInfo *) propertyInfo{
    ((void (*)(id, SEL, id))(void *) objc_msgSend)((id)self, propertyInfo.setter, value);
}

-(id)LYModelSetJsonWith:(PropertyInfo *)propertyInfo{
    id value = ((id (*)(id, SEL))(void *) objc_msgSend)((id)self, propertyInfo.getter);
    return value;
}

@end







