//
//  QueueStack.m
//  03_LinkedList
//
//  Created by chenshuang on 2019/5/13.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "QueueStack.h"
#import "Stack.h"

@implementation QueueStack {
    Stack *_inStack;
    Stack *_outStack;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _inStack = [[Stack alloc] init];
        _outStack = [[Stack alloc] init];
    }
    return self;
}

/// 元素的数量
- (int)size {
    return _inStack.size + _outStack.size;
}

/// 是否为空
- (BOOL)isEmpty {
    return _inStack.isEmpty && _outStack.isEmpty;
}

/// 清空
- (void)clear {
    while (_inStack.top) {
        [_inStack pop];
    }
    while (_outStack.top) {
        [_outStack pop];
    }
}

/// 入队
- (void)enQueue:(id)element {
    [_inStack push:element];
}

/// 出队
- (id)deQueue {
    if (!_outStack.isEmpty) {
        return [_outStack pop];
    }
    while (_inStack.top) {  // 将inStack的元素全部压入outStack
        [_outStack push:[_inStack pop]];
    }
    // 再弹出outStack栈顶元素
    return [_outStack pop];
}

/// 获取队列的头元素
- (id)front {
    if (!_outStack.isEmpty) {
        return _outStack.top;
    }
    while (_inStack.top) {  // 将inStack的元素全部压入outStack
        [_outStack push:[_inStack pop]];
    }
    // 再弹出outStack栈顶元素
    return _outStack.top;
}

@end
