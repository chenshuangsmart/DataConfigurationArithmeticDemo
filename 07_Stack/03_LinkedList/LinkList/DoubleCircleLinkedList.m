//
//  DoubleCircleLinkedList.m
//  03_LinkedList
//
//  Created by chenshuang on 2019/5/8.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "DoubleCircleLinkedList.h"

@implementation DoubleCircleLinkedList
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
    if (index == self.size) {   // 往最后面添加元素
        LinkNode *oldLast = _last;
        _last = [[LinkNode alloc] initWithPrev:oldLast element:element next:_first];
        if (oldLast == nil) {   // 这是链表添加的第一个元素
            _first = _last;
            _first.next = _first;
            _first.prev = _first;
        } else {    // 往一个非空链表插入新节点
            oldLast.next = _last;
            _first.prev = _last;
        }
    } else {    // 在中间插入节点
        LinkNode *next = [self node:index]; // 先获取要插入位置上的节点
        LinkNode *prev = next.prev;
        LinkNode *node = [[LinkNode alloc] initWithPrev:prev element:element next:next];
        next.prev = node;
        prev.next  = node;
        
        if (next == _first) {   // 插入到第一个位置
            _first = node;
        }
    }
    self.size++;
}

// 删除索引为index的节点
- (id)remove:(NSUInteger)index {
    if ([self rangeCheck:index]) {
        return nil;
    }
    return [self removeLinkNode:[self node:index]];
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
    
    if (index < self.size * 0.5) {
        LinkNode *node = _first;
        for (int i = 0; i < index; i++) {
            node = node.next;
        }
        return node;
    } else {
        LinkNode *node = _last;
        for (int i = self.size - 1; i > index; i--) {
            node = node.prev;
        }
        return node;
    }
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
