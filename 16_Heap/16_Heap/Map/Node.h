//
//  Node.h
//  15_HashMap
//
//  Created by chenshuang on 2020/3/1.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    red = 0,
    black = 1,
} ColorType;

@interface Node : NSObject

/** key */
@property(nonatomic,strong)id key;
/** value */
@property(nonatomic,strong)id value;
/** bool */
@property(nonatomic,assign)ColorType color;
/** left */
@property(nonatomic,strong)Node *left;
/** right */
@property(nonatomic,strong)Node *right;
/** parent*/
@property(nonatomic,strong)Node *parent;

- (instancetype)initWithKey:(id)key value:(id)value parent:(Node *)parent;

// 是否是叶子节点
- (BOOL)isLeaf;

- (BOOL)hasTwoChildren;

- (BOOL)isLeftChild;

- (BOOL)isRightChild;

// 返回兄弟节点
- (Node *)sibling;

@end

NS_ASSUME_NONNULL_END
