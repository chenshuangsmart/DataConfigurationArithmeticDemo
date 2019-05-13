//
//  QueueStack.h
//  03_LinkedList
//
//  Created by chenshuang on 2019/5/13.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 用栈实现队列操作
 */
@interface QueueStack : NSObject

/// 元素的数量
- (int)size;

/// 是否为空
- (BOOL)isEmpty;

/// 清空
- (void)clear;

/// 入队
- (void)enQueue:(id)element;

/// 出队
- (id)deQueue;

/// 获取队列的头元素
- (id)front;

@end

NS_ASSUME_NONNULL_END
