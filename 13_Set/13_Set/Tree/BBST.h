//
//  BBST.h
//  12_RedBlackTree
//
//  Created by chenshuang on 2020/1/11.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import "BST.h"

@class AVLNode;

NS_ASSUME_NONNULL_BEGIN

@interface BBST : BST

/** 左旋转 grand - 爷爷节点 */
- (void)rotateLeft:(AVLNode *)grand;

/** 右旋转 */
- (void)rotateRight:(AVLNode *)grand;

/** 更新节点*/
- (void)afterRotate:(TreeNode *)grand parent:(TreeNode *)parent child:(TreeNode *)child;

/// 旋转操作
- (void)rotate:(TreeNode *)r    // 子树的根节点
             a:(TreeNode *)a b:(TreeNode *)b c:(TreeNode *)c
             d:(TreeNode *)d
             e:(TreeNode *)e f:(TreeNode *)f g:(TreeNode *)g;

@end

NS_ASSUME_NONNULL_END
