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

+(instancetype)ly_modelWithJSON :(id)json{
    NSDictionary *dic = json;
    return [self ly_modelWithDictonary:dic];
}
+(instancetype)ly_modelWithDictonary:(NSDictionary *)dictonary{
    
    Class object = [self class];
    NSObject *modelObject = [object new];
    
    if ([modelObject ly_modelSelectProperties:dictonary]) {
        return modelObject;
    }
    return nil;
}
-(BOOL)ly_modelSelectProperties:(NSDictionary *)dictonary{
    
    
    ClassInfo *cls = [[ClassInfo alloc]initWithClass:object_getClass(self)];
    id key, value;
    NSArray *keys = [dictonary allKeys];
    NSUInteger count = [keys count];
    for (int i = 0; i < count; i++){
        key = [keys objectAtIndex: i];
        value = [dictonary objectForKey: key];
        
        if (cls.propertyInfo[key]) {
            [self ly_modelSetPropertyWithModel:self value:value propertyInfo:cls.propertyInfo[key]];

        }
        
    }
    
//        unsigned int propertyCount = 0;
//        objc_property_t *propertys = class_copyPropertyList(self.class, &propertyCount);
//        for (unsigned int i = 0; i<propertyCount; i++) {
//    
//            unsigned int attrCount;
//            objc_property_attribute_t *attrs = property_copyAttributeList(propertys[i], &attrCount);
//    
//    
//            NSString *nameset = [NSString stringWithUTF8String:property_getName(propertys[i])];
//            NSString *setter = [NSString stringWithFormat:@"set%@%@:", [nameset substringToIndex:1].uppercaseString, [nameset substringFromIndex:1]];
//            SEL _setter =  NSSelectorFromString(setter);
//    
//    
//            __unsafe_unretained id model = (__bridge id)((__bridge void *)self);
//    
//    
//            ((void (*)(id, SEL, id))(void *) objc_msgSend)((id)model, _setter, @"我成功了");
//    
//                for (unsigned int i = 0; i<attrCount; i++) {
//                    NSLog(@"%s",attrs[i].name);
//                    if (attrs[i].name[0] == 'T') {
//                    size_t len = strlen(attrs[i].value);
//                    if (len>3) {
//                        char name[len - 2];
//                        name[len - 3] = '\0';
//                        memcpy(name, attrs[i].value + 2, len - 3);
//                    }
//                }
//            }
//        }
    
    
    return YES;


}


-(void)ly_modelSetPropertyWithModel:(id) model value:(id)value propertyInfo:(PropertyInfo *) propertyInfo{
    __unsafe_unretained id _model = model;
    
    ((void (*)(id, SEL, id))(void *) objc_msgSend)((id)_model, propertyInfo.setter, value);

    
   
    
}

-(void)ly_modelSetPropertyWithModel:(id) model value:(id)value setter:(SEL) setter{
    __unsafe_unretained id _model = model;
    
    ((void (*)(id, SEL, id))(void *) objc_msgSend)((id)_model, setter, value);
    
}


@end







