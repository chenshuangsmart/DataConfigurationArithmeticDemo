//
//  AbstractHeap.h
//  16_Heap
//
//  Created by chenshuang on 2020/3/7.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import "Heap.h"

NS_ASSUME_NONNULL_BEGIN

@interface AbstractHeap : Heap

/** int */
@property(nonatomic,assign)NSInteger size;

/// 比较 num1 和 num2的大小
- (int)compare:(NSNumber *)num1 num2:(NSNumber *)num2;

// 返回根节点所在的索引
- (int)root;

// 返回左子节点的索引
- (int)left:(int)node;

// 返回右子节点的索引
- (int)right:(int)node;

// 返回对应索引的value
- (NSNumber *)string:(int)node;

@end

NS_ASSUME_NONNULL_END
