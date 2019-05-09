//
//  SingleCircleLinkedList.m
//  03_LinkedList
//
//  Created by chenshuang on 2019/5/8.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "SingleCircleLinkedList.h"

@implementation SingleCircleLinkedList

#pragma mark - override

- (void)clear {
    self.size = 0;
    _first = nil;
    _last = nil;
}

- (id)get:(NSUInteger)index {
    return [self node:index].element;
}

- (id)set:(NSUInteger)index element:(id)element {
    LinkNode *node = [self node:index];
    id oldElement  = node.element;
    node.element = element;
    return oldElement;
}

/// 在索引为index处插入元素值为element的节点
- (void)add:(NSUInteger)index element:(id)element {
    [self rangeCheck:index];
    
    if (index == 0) {
        LinkNode *newFirst = [[LinkNode alloc] initWithElement:element next:_first];
        // 拿到最后一个节点
        LinkNode *last = self.size == 0 ? newFirst : [self node:self.size - 1];
        last.next = newFirst;
        _first = newFirst;
    } else {
        LinkNode *prev = [self node:index - 1];
        prev.next = [[LinkNode alloc] initWithElement:element next:prev.next];
    }
    self.size++;
}

// 删除索引为index的节点
- (id)remove:(NSUInteger)index {
    if ([self rangeCheck:index]) {
        return nil;
    }
    
    LinkNode *node = _first;
    
    if (index == 0) {
        if (self.size == 1) {
            _first = nil;
        } else {
            LinkNode *last = [self node:self.size - 1];
            _first = _first.next;
            last.next = _first;
        }
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

#pragma mark - public

/// reset
- (void)reset {
    self.current = self.first;
}

/// 下一个
- (id)next {
    if (self.current == nil) {
        return nil;
    }
    self.current = self.current.next;
    return self.current.element;
}

/// remove
- (id)remove {
    if (self.current == nil) {
        return nil;
    }
    LinkNode *next = self.current.next;
    id element = [self removeLinkNode:self.current];
    
    if (self.size == 0) {
        self.current = nil;
    } else {
        self.current = next;
    }
    
    return element;
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

#pragma mark - private

// 删除node节点
- (id)removeLinkNode:(LinkNode *)node {
    if (self.size == 1) {
        _first = nil;
        _last = nil;
    } else {
        LinkNode *prev = node.prev;
        LinkNode *next = node.next;
        prev.next = next;
        next.prev = prev;
        
        if (node == _first) {   // idnex == 0
            _first = next;
        }
        
        if (node == _last) {    // index == size
            _last = prev;
        }
    }
    
    self.size--;
    return node.element;
}

#pragma mark - description

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
        [strM appendString:node.description];
        node = node.next;
    }
    [strM appendFormat:@"]"];
    return strM.copy;
}

@end
