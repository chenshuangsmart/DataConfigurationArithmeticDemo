//
//  TrieNode.m
//  19_Trie
//
//  Created by chenshuang on 2020/3/14.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import "TrieNode.h"

@implementation TrieNode

- (instancetype)initWithParent:(TrieNode *)parent {
    self = [super init];
    if (self) {
        self.parent = parent;
    }
    return self;
}

@end
