//
//  LinkedList.m
//  03_LinkedList
//
//  Created by chenshuang on 2019/4/28.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "LinkedList.h"

@implementation LinkedList

- (void)clear {
    self.size = 0;
    _first = nil;
}

- (id)get:(NSUInteger)index {
    return [self node:index];
}

- (id)set:(NSUInteger)index element:(id)element {
    LinkNode *node = [self node:index];
    id oldElement  = node.element;
    node.element = element;
    return oldElement;
}

- (void)add:(NSUInteger)index element:(id)element {
    if (index == 0) {
        _first = [[LinkNode alloc] initWithElement:element next:_first];
    } else {
        LinkNode *prevNode = [self node:index - 1];
        prevNode.next = [[LinkNode alloc] initWithElement:element next:prevNode.next];
    }
    self.size++;
}

- (id)remove:(NSUInteger)index {
    LinkNode *node = _first;
    if (index == 0) {
        _first = _first.next;
    } else {
        LinkNode *prev = [self node:index - 1];
        node = prev.next;
        prev.next = node.next;
    }
    self.size--;
    return node.element;
}

- (NSUInteger)indexOf:(id)element {
    if (element == nil) {   // 返回节点中第一个出现元素为空的节点
        LinkNode *node = _first;
        for (NSUInteger i = 0; i < self.size; i++) {
            if (node.element == nil) {
                return i;
            }
            node = node.next;
        }
    } else {
        LinkNode *node = _first;
        for (NSUInteger i = 0; i < self.size; i++) {
            if (node.element == element) {
                return i;
            }
            node = node.next;
        }
    }
    
    return NSNotFound;
}

///  获取index位置对应的节点对象
- (LinkNode *)node:(NSUInteger)index {
    if ([self rangeCheck:index]) {
        return nil;
    }
    
    LinkNode *node = _first;
    for (int i = 0; i < index; i++) {
        node = node.next;
    }
    
    return node;
}

/// 打印整个链表
- (NSString *)toString {
    NSMutableString *strM = [NSMutableString string];
    [strM appendString:[NSString stringWithFormat:@"size = %lu",self.size]];
    [strM appendString:@" ["];
    
    LinkNode *node = _first;
    for (int i = 0; i < self.size; i++) {
        if (i != 0) {
            [strM appendString:@", "];
        }
        [strM appendString:[NSString stringWithFormat:@"%@",node.element]];
        node = node.next;
    }
    [strM appendFormat:@"]"];
    return strM.copy;
}

/// 重新系统的方法
- (NSString *)description {
    [super description];
    NSMutableString *strM = [NSMutableString string];
    [strM appendString:[NSString stringWithFormat:@"size = %lu",self.size]];
    [strM appendString:@" ["];
    
    LinkNode *node = _first;
    for (int i = 0; i < self.size; i++) {
        if (i != 0) {
            [strM appendString:@", "];
        }
        [strM appendString:[NSString stringWithFormat:@"%@",node.element]];
        node = node.next;
    }
    [strM appendFormat:@"]"];
    return strM.copy;
}

@end
