//
//  TrieNode.h
//  19_Trie
//
//  Created by chenshuang on 2020/3/14.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class TreeMap;

@interface TrieNode : NSObject

@property(nonatomic,strong)TrieNode *parent;
/** children */
@property(nonatomic,strong)TreeMap *children;
/** character */
@property(nonatomic, strong)NSString *character;
/** value */
@property(nonatomic,strong)id value;
/** word 是否为单词的结尾（是否为一个完整的单词） */
@property(nonatomic,assign)BOOL word;

- (instancetype)initWithParent:(TrieNode *)parent;

@end

NS_ASSUME_NONNULL_END
