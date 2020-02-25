//
//  TreeNode.h
//  09_Tree
//
//  Created by chenshuang on 2019/5/19.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**
 树节点
 */
@interface TreeNode : NSObject
/** id*/
@property(nonatomic,strong)id element;
/** left*/
@property(nonatomic,strong)TreeNode *left;
/** right*/
@property(nonatomic,strong)TreeNode *right;
/** parent*/
@property(nonatomic,strong)TreeNode *parent;

/** 初始化 */
- (instancetype)initWithElement:(id)element parent:(TreeNode *)parent;

/** 是否是空树 - 即叶子节点 */
- (BOOL)isLeaf;

/** 是否有两个子树 */
- (BOOL)hasTwoChildren;

/** 是否有左子树节点 */
- (BOOL)isLeftChild;

/** 是否有右子树节点 */
- (BOOL)isRightChild;

/// 返回叔父节点
- (TreeNode *)sibling;

@end

NS_ASSUME_NONNULL_END
