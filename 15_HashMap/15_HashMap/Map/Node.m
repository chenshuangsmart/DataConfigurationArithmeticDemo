//
//  Node.m
//  15_HashMap
//
//  Created by chenshuang on 2020/3/1.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import "Node.h"

@implementation Node

- (instancetype)initWithKey:(id)key value:(id)value parent:(Node *)parent {
    self = [super init];
    if (self) {
        self.key = key;
        self.value = value;
        self.parent = parent;
    }
    return self;
}

// 是否是叶子节点
- (BOOL)isLeaf {
    return self.left == nil && self.right == nil;
}

- (BOOL)hasTwoChildren {
    return self.left != nil && self.right != nil;
}

- (BOOL)isLeftChild {
    return self.parent != nil && self == self.parent.left;
}

- (BOOL)isRightChild {
    return self.parent != nil && self == self.parent.right;
}

// 返回兄弟节点
- (Node *)sibling {
    if ([self isLeftChild]) {
        return self.parent.right;
    }
    
    if ([self isRightChild]) {
        return self.parent.left;
    }
    
    return nil;
}

@end
