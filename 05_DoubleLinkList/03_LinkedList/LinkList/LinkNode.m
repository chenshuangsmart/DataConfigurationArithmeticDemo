//
//  LinkNode.m
//  03_LinkedList
//
//  Created by chenshuang on 2019/4/28.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "LinkNode.h"

@implementation LinkNode

- (instancetype)initWithPrev:(LinkNode *)prev element:(id)element next:(LinkNode *)next {
    self = [super init];
    if (self) {
        self.element = element;
        self.next = next;
        self.prev = prev;
    }
    return self;
}

- (NSString *)description {
    [super description];
    NSMutableString *strM = [NSMutableString string];
    
    if (self.prev != nil) {
        [strM appendString:[NSString stringWithFormat:@"%@",self.prev.element]];
    } else {
        [strM appendString:@"null"];
    }
    
    [strM appendString:@"_"];
    [strM appendString:[NSString stringWithFormat:@"%@",self.element]];
    [strM appendString:@"_"];
    
    if (self.next != nil) {
        [strM appendString:[NSString stringWithFormat:@"%@",self.next.element]];
    } else {
        [strM appendString:@"null"];
    }
    
    return strM.copy;
}

@end
