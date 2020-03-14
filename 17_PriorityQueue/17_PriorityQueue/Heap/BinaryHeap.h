//
//  BinaryHeap.h
//  16_Heap
//
//  Created by chenshuang on 2020/3/7.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import "AbstractHeap.h"

NS_ASSUME_NONNULL_BEGIN

@protocol BinaryHeapDelegate <NSObject>

- (int)compare:(NSNumber *)num1 num2:(NSNumber *)num2;

@end

/// 二叉堆（最大堆）
@interface BinaryHeap : AbstractHeap

/** delegate */
@property (nonatomic,weak) id<BinaryHeapDelegate> delegate;

- (void)print;

@end

NS_ASSUME_NONNULL_END
