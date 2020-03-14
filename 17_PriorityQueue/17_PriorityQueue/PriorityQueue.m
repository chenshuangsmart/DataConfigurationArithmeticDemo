//
//  PriorityQueue.m
//  17_PriorityQueue
//
//  Created by chenshuang on 2020/3/14.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import "PriorityQueue.h"
#import "BinaryHeap.h"

@implementation PriorityQueue {
    BinaryHeap *_heap;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _heap = [[BinaryHeap alloc] init];
    }
    return self;
}

- (int)size {
    return _heap.size;
}

- (BOOL)isEmpty {
    return _heap.isEmpty;
}

- (void)clear {
    [_heap clear];
}

- (void)enQueue:(id)element {
    [_heap add:element];
}

- (id)deQueue {
    return [_heap remove];
}

- (id)front {
    return _heap.get;
}

@end
