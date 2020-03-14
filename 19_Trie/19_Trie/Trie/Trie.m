//
//  Trie.m
//  19_Trie
//
//  Created by chenshuang on 2020/3/14.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import "Trie.h"
#import "TrieNode.h"
#import "TreeMap.h"

@implementation Trie {
    int _size;
    TrieNode *_root;
}

- (int)size {
    return _size;
}

- (bool)isEmpty {
    return _size == 0;
}

- (void)clear {
    _size = 0;
    _root = nil;
}

- (NSString *)get:(NSString *)key {
    TrieNode *node = [self node:key];
    return (node != nil && node.word) ? node.value : nil;
}

- (bool)contains:(NSString *)key {
    TrieNode *node = [self node:key];
    return node != nil && node.word;
}

- (id)add:(NSString *)key value:(id)value {
    [self keyCheck:key];
    
    // 创建根节点
    if (_root == nil) {
        _root = [[TrieNode alloc] init];
    }
    
    TrieNode *node = _root;
    int len = key.length;
    
    for (int i = 0; i < len; i++) {
        NSString *c = [key substringWithRange:NSMakeRange(i, 1)];
        BOOL emptyChildren = node.children == nil;
        TrieNode *childNode = emptyChildren ? nil : [node.children get:c];
        
        if (childNode == nil) {
            childNode = [[TrieNode alloc] init];
            childNode.character = c;
            node.children = emptyChildren ? [[TreeMap alloc] init] : node.children;
            [node.children put:c value:childNode];
        }
        node = childNode;
    }
    
    // 如果已经存在这个单词
    if (node.word) {
        id oldValue = node.value;
        node.value = value;
        return oldValue;
    }
    
    // 新建一个单词
    node.word = true;
    node.value = value;
    _size++;
    return nil;
}

- (id)remove:(NSString *)key {
    // 找到最后一个节点
    TrieNode *node = [self node:key];
    // 如果不是单词结尾,不用做任何处理
    if (node == nil || !node.word) {
        return nil;
    }
    
    _size--;
    id oldValue = node.value;
    
    // 如果还有子节点
    if (node.children != nil && !node.children.isEmpty) {
        node.word = false;
        node.value = nil;
        return oldValue;
    }
    
    // 如果没有子节点
    TrieNode *parent = nil;
    while ((parent = node.parent) != nil) {
        [parent.children remove:node.character];
        if (parent.word || !parent.children.isEmpty) {
            break;
        }
    }
    
    return oldValue;
}

- (bool)starsWith:(NSString *)prefix {
    return [self node:prefix] != nil;
}

#pragma mark - private

- (TrieNode *)node:(NSString *)key {
    [self keyCheck:key];
    
    TrieNode *node = _root;
    int len = key.length;
    for (int i = 0; i < len; i++) {
        if (node == nil || node.children == nil || node.children.isEmpty) {
            return nil;
        }
        NSString *c = [key substringWithRange:NSMakeRange(i, 1)];
        node = [node.children get:c];
    }
    return node;
}

- (void)keyCheck:(NSString *)key {
    if (key == nil && key.length == 0) {
        [NSException raise:@"key must not be empty" format:@"%@",key];
    }
}
@end
