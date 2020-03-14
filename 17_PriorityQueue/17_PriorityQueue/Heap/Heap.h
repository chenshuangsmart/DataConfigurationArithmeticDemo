//
//  Heap.h
//  16_Heap
//
//  Created by chenshuang on 2020/3/7.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Heap : NSObject
// 元素的数量
- (int)size;
// 是否为空
- (bool)isEmpty;
// 清空
- (void)clear;
// 添加元素
- (void)add:(id)element;
// 获得堆顶元素
- (id)get;
 // 删除堆顶元素
- (id)remove;
// 删除堆顶元素的同时插入一个新元素
- (id)replace:(id)element;
@end

NS_ASSUME_NONNULL_END
