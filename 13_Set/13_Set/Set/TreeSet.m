//
//  TreeSet.m
//  13_Set
//
//  Created by chenshuang on 2020/2/26.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import "TreeSet.h"
#import "RBTree.h"

@interface TreeSet()
/** tree */
@property(nonatomic,strong)RBTree *tree;
@end

@implementation TreeSet

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tree = [[RBTree alloc] init];
    }
    return self;
}

#pragma mark - override

- (int)size {
    return self.tree.size;
}

- (BOOL)isEmpty {
    return self.tree.isEmpty;
}

- (void)clear {
    [self.tree clear];
}

- (BOOL)contains:(id)element {
    return [self.tree contains:element];
}

- (void)add:(id)element {
    [self.tree add:element];
}

- (void)remove:(id)element {
    [self.tree remove:element];
}

- (void)traversal {
    [self.tree preordr];
}

@end
