//
//  HashMap.m
//  15_HashMap
//
//  Created by chenshuang on 2020/3/1.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import "HashMap.h"
#import "Node.h"

static int DEFAULT_CAPACITY = 1 << 4;
static float DEFAULT_LOAD_FACTOR = 0.75;

@interface HashMap()
/** red*/
@property(nonatomic,assign)BOOL red;
/** black*/
@property(nonatomic,assign)BOOL black;
/** size*/
@property(nonatomic,assign)int size;
/** table*/
@property(nonatomic,strong)NSMutableArray *table;
@end

@implementation HashMap

- (instancetype)init {
    self = [super init];
    if (self) {
        _table = [NSMutableArray array];
        for (int i = 0; i < DEFAULT_CAPACITY; i++) {
            [_table addObject:@(i)];
        }
    }
    return self;
}

#pragma mark - override
- (int)size {
    return self.size;
}

- (BOOL)isEmpty {
    return self.size == 0;
}

- (void)clear {
    if (_size == 0) {
        return;
    }
    self.size = 0;
    for (int i = 0; i < _table.count; i++) {
        _table[i] = nil;
    }
    [_table removeAllObjects];
}

- (Node *)node:(id)key {
    Node *root = _table[[self index:key]];
    if ([root isKindOfClass:[NSNumber class]]) {
        return nil;
    }
    return []
}

//- (id)get:(id)key {
//    Node *node = [self node:key];
//    return node != nil ? node.value : nil;
//}

- (BOOL)containsKey:(id)key {
    return [self node:key] != nil;
}

//- (BOOL)containsValue:(id)value {
//    if (_root == nil) {
//        return false;
//    }
//
//    Queue *queue = [[Queue alloc] init];
//    [queue enQueue:_root];
//
//    while (!queue.isEmpty) {
//        Node *node = [queue deQueue];
//        if ([self valEquals:value v2:node.value]) {
//            return YES;
//        }
//
//        if (node.left != nil) {
//            [queue enQueue:node.left];
//        }
//
//        if (node.right != nil) {
//            [queue enQueue:node.right];
//        }
//    }
//
//    return false;
//}

- (BOOL)valEquals:(id)v1 v2:(id)v2 {
    return v1 == nil ? v2 == nil : v1 == v2;
}

#pragma mark - private

- (int)index:(id)key {
    return [self hash:key] & (_table.count - 1);
}

- (int)hash:(id)key {
    if (key == nil) {
        return 0;
    }
    if ([key isKindOfClass:[NSNumber class]]) {
        int hash = [(NSNumber *)(key) hash];
        return hash ^ (hash >> 16);
    } else if ([key isKindOfClass:[NSString class]]) {
        int hash = [(NSString *)(key) hash];
        return hash ^ (hash >> 16);
    }
    return 0;
}

@end
