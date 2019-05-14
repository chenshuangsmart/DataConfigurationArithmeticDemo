//
//  Deque.m
//  03_LinkedList
//
//  Created by chenshuang on 2019/5/14.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "Deque.h"
#import "LinkedList.h"

@implementation Deque {
    LinkedList *_linkList;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _linkList = [[LinkedList alloc] init];
    }
    return self;
}

/// 元素的数量
- (int)size {
    return _linkList.size;
}

/// 是否为空
- (BOOL)isEmpty {
    return _linkList.isEmpty;
}

/// 清空
- (void)clear {
    [_linkList clear];
}

/// 从后面入队
- (void)enQueueRear:(id)element {
    [_linkList add:element];
}

/// 从后面出队
- (id)deQueueRear {
    return [_linkList remove:_linkList.size - 1];
}

/// 从前面入队
- (void)enQueueFront:(id)element {
    [_linkList add:0 element:element];
}

/// 从前面出队
- (id)deQueueFront {
    return [_linkList remove:0];
}

/// 获取队列的头元素
- (id)front {
    return [_linkList get:0];
}

/// 获取队列的尾元素
- (id)rear {
    return [_linkList get:_linkList.size - 1];
}

@end
