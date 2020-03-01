//
//  TreeMap.m
//  14_Map
//
//  Created by chenshuang on 2020/2/29.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import "TreeMap.h"
#import "Queue.h"

typedef enum : NSUInteger {
    red = 0,
    black = 1,
} ColorType;

@interface Node: NSObject
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

@implementation Node

- (instancetype)initWithKey:(id)key value:(id)value parent:(Node *)parent {
    self = [super init];
    if (self) {
        self.key = key;
        self.value = value;
        self.parent = parent;
    }
    return self;
}

// 是否是叶子节点
- (BOOL)isLeaf {
    return self.left == nil && self.right == nil;
}

- (BOOL)hasTwoChildren {
    return self.left != nil && self.right != nil;
}

- (BOOL)isLeftChild {
    return self.parent != nil && self == self.parent.left;
}

- (BOOL)isRightChild {
    return self.parent != nil && self == self.parent.right;
}

// 返回兄弟节点
- (Node *)sibling {
    if ([self isLeftChild]) {
        return self.parent.right;
    }
    
    if ([self isRightChild]) {
        return self.parent.left;
    }
    
    return nil;
}

@end

#pragma mark - TreeMap

@interface TreeMap()
/** red*/
@property(nonatomic,assign)BOOL red;
/** black*/
@property(nonatomic,assign)BOOL black;
/** size*/
@property(nonatomic,assign)int size;
/** root */
@property(nonatomic,strong)Node *root;

- (int)size;

- (BOOL)isEmpty;

- (void)clear;

- (void)put:(id)key value:(id)value;

- (id)get:(id)key;

- (BOOL)containsKey:(id)key;

- (BOOL)containsValue:(id)value;

@end

@implementation TreeMap

#pragma mark - override

- (int)size {
    return self.size;
}

- (BOOL)isEmpty {
    return self.size == 0;
}

- (void)clear {
    self.root = nil;
    self.size = 0;
}

- (Node *)node:(id)key {
    Node *node = _root;
    int cmp = 0;
    while (node != nil) {
        cmp = [self compare:key element2:node.key];
        if (cmp == 0) { // 当前节点
            return node;
        } else if (cmp > 0) {   // 右子树
            node = node.right;
        } else {    // 左子树
            node = node.left;
        }
    }
    return nil;
}

- (id)get:(id)key {
    Node *node = [self node:key];
    return node != nil ? node.value : nil;
}

- (BOOL)containsKey:(id)key {
    return [self node:key] != nil;
}

- (BOOL)containsValue:(id)value {
    if (_root == nil) {
        return false;
    }
    
    Queue *queue = [[Queue alloc] init];
    [queue enQueue:_root];
    
    while (!queue.isEmpty) {
        Node *node = [queue deQueue];
        if ([self valEquals:value v2:node.value]) {
            return YES;
        }
        
        if (node.left != nil) {
            [queue enQueue:node.left];
        }
        
        if (node.right != nil) {
            [queue enQueue:node.right];
        }
    }
    
    return false;
}

- (BOOL)valEquals:(id)v1 v2:(id)v2 {
    return v1 == nil ? v2 == nil : v1 == v2;
}

#pragma mark - public

- (void)traversal {
    /// 层序遍历
    if (_root == nil) {
        return;
    }
    
    Queue *queue = [[Queue alloc] init];
    [queue enQueue:_root];
    
    while (!queue.isEmpty) {
        Node *node = [queue deQueue];
        NSLog(@"%@_%@",node.key, node.value);
        
        if (node.left != nil) { // 左子节点入队
            [queue enQueue:node.left];
        }
        
        if (node.right != nil) {    // 右子节点入队
            [queue enQueue:node.right];
        }
    }
}

#pragma mark - add

/**
 * 添加元素到尾部
 * @param element
 */
- (id)put:(id)key value:(id)value {
    if ([self keyNotNullCheck:key]) {
        return nil;
    }
    
    // 添加第一个节点
    if (_root == nil) {
        _root = [[Node alloc] initWithKey:key value:value parent:nil];
        _size++;
        
        // 新添加节点之后的处理
        [self afterPut:_root];
        return nil;
    }
    
    // 添加的不是第一个节点
    // 找到父节点
    Node *parent = self.root;
    Node *node = self.root;
    int cmp = 0;
    
    while (node != nil) {
        cmp = [self compare:key element2:node.key];
        parent = node;
        
        if (cmp > 0) {  // 右节点
            node = node.right;
        } else if (cmp < 0) {   // 左节点
            node = node.left;
        } else {    // 相对 - 覆盖
            node.key = key;
            node.value = value;
            return nil;
        }
    }
    
    // 查看插入到父节点的哪个位置
    Node *newNode = [[Node alloc] initWithKey:key value:value parent:parent];
    if (cmp > 0) {
        parent.right = newNode;
    } else {
        parent.left = newNode;
    }
    _size++;
    
    /// 添加节点之后的处理
    [self afterPut:newNode];
    return nil;
}

- (void)afterPut:(Node *)node {
    Node *parent = node.parent;
    
    // 添加的是根节点,或者上溢到达了根节点
    if (parent == nil) {
        [self black:node];
        return;
    }
    
    // 如果父节点是黑色,直接返回
    if ([self isBlack:parent]) {
        return;
    }
    
    // 叔父节点
    Node *uncle = parent.sibling;
    // 祖父节点
    Node *grand = [self red:parent.parent];
    if ([self isRed:uncle]) {   // 叔父节点是红色[B树节点上溢]
        [self black:parent];
        [self black:uncle];
        
        // 将祖父节点当做是新添加的节点
        [self afterPut:grand];
        return;
    }
    
    // 叔父节点不是红色
    if (parent.isLeftChild) {   // L
        if (node.isLeftChild) { // LL
            [self black:parent];
        } else {    // LR
            [self black:node];
            [self rotateLeft:parent];
        }
        [self rotateRight:grand];
    } else {    // R
        if (node.isLeftChild) { // RL
            [self black:node];
            [self rotateRight:parent];
        } else {    // RR
            [self black:parent];
        }
        [self rotateLeft:grand];
    }
}

#pragma mark - remove

/**
 * 删除元素
 * @param element
 */
- (void)remove:(id)element {
    [self removeNode:[self node:element]];
}

/// 删除节点 node
- (void)removeNode:(Node *)node {
    if (node == nil) {
        return;
    }
    
    self.size--;
    
    if (node.hasTwoChildren) {  // 度为2的节点
        // 找到后继节点
        Node *s = [self successor:node];
        // 用后继节点的值覆盖度为2的节点的值
        node.key = s.key;
        // 删除后继节点
        node = s;
    }
    
    // 删除node节点(node的度必然是1或者0)
    Node *replacement = node.left != nil ? node.left : node.right;
    
    if (replacement != nil) {   // 1.node是度为1的节点
        // 更改parent
        replacement.parent = node.parent;
        // 更改parent的left,right的指向
        if (node.parent == nil) {   // node是度为1的节点并且是根节点
            self.root = replacement;
        } else if (node == node.parent.left) {  // 左子节点
            node.parent.left = replacement;
        } else {    // node == node.parent.right
            node.parent.right = replacement;
        }
    } else if (node.parent == nil) {    // 2.node是叶子节点并且是根节点
        self.root = nil;
    } else {    // 3.node是叶子节点,但不是根节点
        if (node == node.parent.left) {
            node.parent.left = nil;
        } else {    // node == node.parent.right
            node.parent.right = nil;
        }
    }
    
    /// 删除节点之后的处理
    [self afterRemove:node];
}

- (void)afterRemove:(Node *)node {
    // 如果删除的节点是红色
    // 或者用以取代删除节点的子节点是红色
    if ([self isRed:node]) {
        [self black:node];
        return;
    }
    
    Node *parent = node.parent;
    // 删除的是根节点
    if (parent == nil) {
        return;
    }
    
    // 删除的是黑色叶子节点[下溢]
    // 判断被删除的node是左还是右
    BOOL left = parent.left == nil || node.isLeftChild;
    Node *sibling = left ? parent.right : parent.left;
    
    if (left) { // 被删除的节点在左边,兄弟节点在右边
        if ([self isRed:sibling]) { // 兄弟节点是红色
            [self black:sibling];
            [self red:parent];
            [self rotateLeft:parent];
            
            // 更换兄弟
            sibling = parent.right;
        }
        
        // 兄弟节点必然是黑色
        if ([self isBlack:sibling.left] && [self isBlack:sibling.right]) {
            // 兄弟节点没有一个红色节点,父节点要向下跟兄弟节点合并
            BOOL parentBlack = [self isBlack:parent];
            [self black:parent];
            [self red:sibling];
            
            if (parentBlack) {
                [self afterRemove:parent];
            }
        } else {    // 兄弟节点至少有一个红色节点,向兄弟节点借元素
            // 兄弟节点的左边时黑色,兄弟要先旋转
            if ([self isBlack:sibling.right]) {
                [self rotateRight:sibling];
                sibling = parent.right;
            }
            
            [self color:sibling color:[self colorOf:parent]];
            [self black:sibling.right];
            [self black:parent];
            [self rotateLeft:parent];
        }
    } else {    // 被删除的节点在右边,兄弟节点在左边
        if ([self isRed:sibling]) { // 兄弟节点是红色
            [self black:sibling];
            [self red:parent];
            [self rotateRight:parent];
            
            // 更换兄弟
            sibling = parent.left;
        }
        
        // 兄弟节点必然是黑色
        if ([self isBlack:sibling.left] && [self isBlack:sibling.right]) {
            // 兄弟节点没有一个红色节点,父节点要向下跟兄弟节点合并
            BOOL parentBlack = [self isBlack:parent];
            [self black:parent];
            [self red:sibling];
            
            if (parentBlack) {
                [self afterRemove:parent];
            }
        } else {    // 兄弟节点至少有一个红色子节点,向兄弟节点借元素
            // 兄弟节点的左边时黑色,兄弟要先旋转
            if ([self isBlack:sibling.left]) {
                [self rotateLeft:sibling];
                sibling = parent.left;
            }
            
            [self color:sibling color:[self colorOf:parent]];
            [self black:sibling.left];
            [self black:parent];
            [self rotateRight:parent];
        }
    }
}

#pragma mark - rotate

/** 左旋转 grand - 爷爷节点 */
- (void)rotateLeft:(Node *)grand {
    Node *parent = grand.right;
    Node *child = parent.left;
    grand.right = child;
    parent.left = grand;
    [self afterRotate:grand parent:parent child:child];
}

/** 右旋转 */
- (void)rotateRight:(Node *)grand {
    Node *parent = grand.left;
    Node *child = parent.right;
    grand.left = child;
    parent.right = grand;
    [self afterRotate:grand parent:parent child:child];
}

/** 更新节点*/
- (void)afterRotate:(Node *)grand parent:(Node *)parent child:(Node *)child {
    // 让parent成为子树的根节点
    parent.parent = grand.parent;
    
    if (parent.isLeftChild) {
        grand.parent.left = parent;
    } else if (grand) {
        grand.parent.right = parent;
    } else {    // grand 是 root节点
        self.root = parent;
    }
    
    // 更新child的parent
    if (child != nil) {
        child.parent = grand;
    }
    
    // 更新grand的parent
    grand.parent = parent;
}

#pragma mark - 前驱节点 和 后继节点

/// 找前驱节点
- (Node *)predecessor:(Node *)node {
    if (node == nil) {
        return nil;
    }
    
    /** 1.左子树不为空
     前驱节点在左子树当中（left.right.right.right....）
     */
    Node *p = node.left;
    if (p != nil) {
        while (p.right != nil) {
            p = p.right;
        }
        return p;
    }
    
    /** 2.左子树为空,父节点不为空
     从父节点、祖父节点中寻找前驱节点
     */
    while (node.parent != nil && node == node.parent.left) {
        node = node.parent;
    }
    
    // node.parent == null
    // node == node.parent.right
    return node.parent;
}

/// 找后继节点
- (Node *)successor:(Node *)node {
    if (node == nil) {
        return nil;
    }
    
    /** 1.右子树不为空
     前驱节点在左子树当中（node.right.left.left.left....）
     */
    Node *p = node.right;
    if (p != nil) {
        while (p.left != nil) {
            p = p.left;
        }
        return p;
    }
    
    /** 2.右子树为空,父节点不为空
     从父节点、祖父节点中寻找前驱节点
     */
    while (node.parent != nil && node == node.parent.right) {
        node = node.parent;
    }
    
    return node.parent;
}


#pragma mark - private

- (BOOL)keyNotNullCheck:(id)key {
    return key == nil;
}

/** 比较两元素的大小 */
- (int)compare:(id)element1 element2:(id)element2 {
//    NSNumber *num1 = (NSNumber *)element1;
//    NSNumber *num2 = (NSNumber *)element2;
//
//    return num1.intValue - num2.intValue;
    NSString *k1 = (NSString *)element1;
    NSString *k2 = (NSString *)element2;
    return [k1 caseInsensitiveCompare:k2];
}

- (Node *)color:(Node *)node color:(ColorType)colorType {
    if (node == nil) {
        return node;
    }
    
    node.color = colorType;
    return node;
}

- (Node *)red:(Node *)node {
    return [self color:node color:red];
}

- (Node *)black:(Node *)node {
    return [self color:node color:black];
}

- (ColorType)colorOf:(Node *)node {
    return node == nil ? black : node.color;
}

- (BOOL)isBlack:(Node *)node {
    return [self colorOf:node] == black;
}

- (BOOL)isRed:(Node *)node {
    return [self colorOf:node] == red;
}


@end
