//
//  Queue.m
//  03_LinkedList
//
//  Created by chenshuang on 2019/5/13.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "Queue.h"
#import "LinkedList.h"

@implementation Queue {
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
    return [_linkList isEmpty];
}

/// 清空
- (void)clear {
    [_linkList clear];
}

/// 入队
- (void)enQueue:(id)element {
    [_linkList add:element];
}

/// 出队
- (id)deQueue {
    return [_linkList remove:0];
}

/// 获取队列的头元素
- (id)front {
    return [_linkList get:0];
}

@end
