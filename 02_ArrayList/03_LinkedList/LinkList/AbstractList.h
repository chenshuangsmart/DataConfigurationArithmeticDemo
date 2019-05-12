//
//  AbstractList.h
//  03_LinkedList
//
//  Created by chenshuang on 2019/4/28.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "List.h"

NS_ASSUME_NONNULL_BEGIN

/// 链表 抽象基类
@interface AbstractList : List

/** size*/
@property(nonatomic,assign)NSUInteger size;

/// 越界查询
- (bool)rangeCheck:(NSUInteger)index;

/// 添加元素越界检查
- (bool)rangeCheckForAdd:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
