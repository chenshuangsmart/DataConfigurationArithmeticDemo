//
//  RBNode.h
//  12_RedBlackTree
//
//  Created by chenshuang on 2020/1/14.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import "TreeNode.h"

typedef enum : NSUInteger {
    Red = 0,
    Black = 1,
} RBTreeNodeType;

NS_ASSUME_NONNULL_BEGIN

/// 红黑树节点
@interface RBNode : TreeNode

/** color type */
@property(nonatomic,assign)RBTreeNodeType color;

@end

NS_ASSUME_NONNULL_END
