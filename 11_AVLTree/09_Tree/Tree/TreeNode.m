//
//  TreeNode.m
//  09_Tree
//
//  Created by chenshuang on 2019/5/19.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "TreeNode.h"

@implementation TreeNode

/** 初始化 */
- (instancetype)initWithElement:(id)element parent:(TreeNode *)parent {
    self = [super init];
    if (self) {
        self.element = element;
        self.parent = parent;
    }
    return self;
}

/** 是否是空树 */
- (BOOL)isLeaf {
    return self.left == nil && self.right == nil;
}

/** 是否有两个子树 */
- (BOOL)hasTwoChildren {
    return self.left != nil && self.right != nil;
}

/** 是否有左子树节点 */
- (BOOL)isLeftChild {
    return self.parent != nil && self == self.parent.left;
}

/** 是否有右子树节点 */
- (BOOL)isRightChild {
    return self.parent != nil && self == self.parent.right;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@",self.element];
}

@end
