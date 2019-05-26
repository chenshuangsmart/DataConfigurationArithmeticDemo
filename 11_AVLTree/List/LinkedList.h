//
//  LinkedList.h
//  03_LinkedList
//
//  Created by chenshuang on 2019/4/28.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkNode.h"
#import "AbstractList.h"

NS_ASSUME_NONNULL_BEGIN

/// 链表
@interface LinkedList : AbstractList

/** first*/
@property(nonatomic,strong)LinkNode *first;
/** last*/
@property(nonatomic,strong)LinkNode *last;
/** current*/
@property(nonatomic,strong)LinkNode *current;

/**
 * 获取index位置对应的节点对象
 * @param index
 * @return
 */
- (LinkNode *)node:(NSUInteger)index;

/// reset
- (void)reset;

/// 下一个
- (id)next;

/// remove
- (id)remove;

@end

NS_ASSUME_NONNULL_END
