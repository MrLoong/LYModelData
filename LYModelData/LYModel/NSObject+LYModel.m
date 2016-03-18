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

+(instancetype)LDModelWithJSON :(id)json{
    NSDictionary *dic = json;
    return [self LDModelWithDictonary:dic];
}

+(instancetype)LDModelWithDictonary:(NSDictionary *)dictonary{
    
    Class object = [self class];
    NSObject *modelObject = [object new];
    
    if ([modelObject LDModelSelectProperties:dictonary]) {
        return modelObject;
    }
    return nil;
}


-(BOOL)LDModelSelectProperties:(NSDictionary *)dictonary{
    
    
    ClassInfo *cls = [[ClassInfo alloc]initWithClass:object_getClass(self)];
    id key, value;
    NSArray *keys = [dictonary allKeys];
    NSUInteger count = [keys count];
    for (int i = 0; i < count; i++){
        key = [keys objectAtIndex: i];
        value = [dictonary objectForKey: key];
        
        if (cls.propertyInfo[key]) {
            [self LDModelSetPropertyWithModel:self value:value propertyInfo:cls.propertyInfo[key]];
        }
    }
    return YES;


}
-(id)LDModelToJson{
    id jsonObject = [self modelToJsonObject:self];
    return jsonObject;
}

-(id)modelToJsonObject:(NSObject *)model{
    
    Class cls = self.class;
    unsigned int countProperty = 0;
    objc_property_t *propertys = class_copyPropertyList(cls,&countProperty);
    NSMutableDictionary *dic = [NSMutableDictionary new];
    
    for (unsigned int i = 0; i<countProperty; i++) {
        PropertyInfo *propertyInfo = [[PropertyInfo alloc] initWithProperty:propertys[i]];
        if (propertyInfo.propertyName!=nil) {
            dic[propertyInfo.propertyName] = [self ly_modelSetJsonObjectWith:model propertyInfo:propertyInfo];
        }
    }
    return dic;
}

-(void)LDModelSetPropertyWithModel:(id) model value:(id)value propertyInfo:(PropertyInfo *) propertyInfo{
    ((void (*)(id, SEL, id))(void *) objc_msgSend)((id)model, propertyInfo.setter, value);
}

-(id)ly_modelSetJsonObjectWith:(id)model propertyInfo:(PropertyInfo *)propertyInfo{
    id v = ((id (*)(id, SEL))(void *) objc_msgSend)((id)model, propertyInfo.getter);
    return v;
}



@end







