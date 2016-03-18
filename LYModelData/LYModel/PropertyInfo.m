//
//  PropertyInfo.m
//  LYModelData
//
//  Created by LastDay on 16/2/1.
//  Copyright © 2016年 LastDay. All rights reserved.
//

#import "PropertyInfo.h"

@implementation PropertyInfo

-(instancetype)initWithProperty:(objc_property_t)property{
    _property = property;
    
    const char *name = property_getName(property);
    if (name) {
        _propertyName = [NSString stringWithUTF8String:name];
    }
    

    unsigned int attrCount;
    objc_property_attribute_t *attrs = property_copyAttributeList(property, &attrCount);

    
    
    for (unsigned int i = 0; i<attrCount; i++) {
        if (attrs[i].name[0] == 'T') {
            size_t len = strlen(attrs[i].value);
            if (len>3) {
                char name[len - 2];
                name[len - 3] = '\0';
                memcpy(name, attrs[i].value + 2, len - 3);
                _typeClass = objc_getClass(name);
            }
        }
    }
    NSString *setter = [NSString stringWithFormat:@"set%@%@:", [_propertyName substringToIndex:1].uppercaseString, [_propertyName substringFromIndex:1]];
    _setter =  NSSelectorFromString(setter);
    _getter = NSSelectorFromString(_propertyName);
    
    return self;
    
}

@end
