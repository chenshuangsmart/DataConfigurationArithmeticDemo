//
//  AVLNode.m
//  09_Tree
//
//  Created by chenshuang on 2019/5/26.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "AVLNode.h"

@implementation AVLNode

/** 初始化 */
- (instancetype)initWithElement:(id)element parent:(TreeNode *)parent {
    self = [super init];
    if (self) {
        self.element = element;
        self.parent = parent;
        self.height = 1;
    }
    return self;
}

/** 平衡因子 */
- (int)balanceFactor {
    int leftHeight = self.left == nil ? 0 : ((AVLNode *)(self.left)).height;
    int rightHeight = self.right == nil ? 0 : ((AVLNode *)(self.right)).height;
    return leftHeight - rightHeight;
}

/** 更新高度 */
- (void)updateHeight {
    int leftHeight = self.left == nil ? 0 : ((AVLNode *)(self.left)).height;
    int rightHeight = self.right == nil ? 0 : ((AVLNode *)(self.right)).height;
    
    self.height = 1 + MAX(leftHeight, rightHeight);
}

/** 返回节点数较多的节点 */
- (TreeNode *)tallerChild {
    int leftHeight = self.left == nil ? 0 : ((AVLNode *)(self.left)).height;
    int rightHeight = self.right == nil ? 0 : ((AVLNode *)(self.right)).height;
    
    if (leftHeight > rightHeight) {
        return self.left;
    } else if (leftHeight < rightHeight) {
        return self.right;
    }
    
    return [self isLeftChild] ? self.left : self.right;
}

@end
