//
//  LinkNode.m
//  03_LinkedList
//
//  Created by chenshuang on 2019/4/28.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "LinkNode.h"

@implementation LinkNode

- (instancetype)initWithElement:(id)element next:(LinkNode *)next {
    self = [super init];
    if (self) {
        self.element = element;
        self.next = next;
    }
    return self;
}

- (NSString *)description {
    [super description];
    NSMutableString *strM = [NSMutableString string];
    [strM appendString:[NSString stringWithFormat:@"[%@",self.element]];
    
    LinkNode *node = self;
    while (node.next) {
        node = node.next;
        [strM appendString:[NSString stringWithFormat:@",%@",node.element]];
    }
    
    [strM appendFormat:@"]"];
    return strM.copy;
}

@end
