//
//  AVLNode.h
//  09_Tree
//
//  Created by chenshuang on 2019/5/26.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "TreeNode.h"

NS_ASSUME_NONNULL_BEGIN

/**
 AVL树节点
 */
@interface AVLNode : TreeNode

/** int - 高度*/
@property(nonatomic,assign)int height;

/** 平衡因子 */
- (int)balanceFactor;

/** 更新高度 */
- (void)updateHeight;

/** 返回节点数较多的节点 */
- (TreeNode *)tallerChild;

@end

NS_ASSUME_NONNULL_END
