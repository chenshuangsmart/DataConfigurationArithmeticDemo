//
//  Deque.h
//  03_LinkedList
//
//  Created by chenshuang on 2019/5/14.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**
 双端队列
 */
@interface Deque : NSObject

/// 元素的数量
- (int)size;

/// 是否为空
- (BOOL)isEmpty;

/// 清空
- (void)clear;

/// 从后面入队
- (void)enQueueRear:(id)element;

/// 从后面出队
- (id)deQueueRear;

/// 从前面入队
- (void)enQueueFront:(id)element;

/// 从前面出队
- (id)deQueueFront;

/// 获取队列的头元素
- (id)front;

/// 获取队列的尾元素
- (id)rear;

@end

NS_ASSUME_NONNULL_END
