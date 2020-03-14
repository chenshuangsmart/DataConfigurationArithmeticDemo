//
//  Person.m
//  15_HashMap
//
//  Created by chenshuang on 2020/3/7.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithAge:(int)age height:(float)height name:(NSString *)name {
    self = [super init];
    if (self) {
        self.age = age;
        self.height = height;
        self.name = name;
    }
    return self;
}

/// 用来比较两个对象是否相对
- (BOOL)equals:(id)obj {
    // 内存地址
    if (obj == self) {
        return YES;
    }
    if (obj == nil || ![obj isKindOfClass:[Person class]]) {
        return NO;
    }
    // 比较成员变量
    Person *per = (Person *)obj;
    
    return per.age == self.age && per.height == self.height && per.name == self.name;
}

/// hash code
- (int)hasCode {
    NSUInteger hashCode = [NSString stringWithFormat:@"%d",self.age].hash;
    hashCode = hashCode * 31 + [NSString stringWithFormat:@"%f",self.height].hash;
    hashCode = hashCode * 31 + (self.name.length > 0 ? self.name.hash : 0);
    
    return (int)hashCode;
}

/// 年龄比较
- (int)compartTo:(Person *)per {
    return self.age - per.age;
}

@end
