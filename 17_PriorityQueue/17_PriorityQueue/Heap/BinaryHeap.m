//
//  BinaryHeap.m
//  16_Heap
//
//  Created by chenshuang on 2020/3/7.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import "BinaryHeap.h"

static NSInteger DEFAULT_CAPACITY = 10;

@interface BinaryHeap()

/** elements count */
@property(nonatomic,assign)NSInteger elementsCount;

@end

@implementation BinaryHeap {
    NSMutableArray *_elements;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _elements = [NSMutableArray array];
        for (int i = 0; i < DEFAULT_CAPACITY; i++) {
            [_elements addObject:@(-1)];    // -1表示元素为空
        }
    }
    return self;
}

- (void)print {
    for (int i = 0; i < self.size; i++) {
        NSLog(@"i = %d, element = %d",i, [_elements[i] intValue]);
    }
}

#pragma mark - override

- (void)clear {
    for (int i = 0; i < self.size; i++) {
        _elements[i] = @(-1);
    }
    self.size = 0;
}

- (void)add:(id)element {
    if (![self elementNotNullCheck:element]) {
        return;
    }
    [self ensureCapacity:self.size + 1];
    _elements[self.size++] = element;
    [self siftUp:self.size - 1];
}

- (id)get {
    if ([self emptyCheck]) {
        return nil;
    }
    return _elements[0];
}

- (id)remove {
    if ([self emptyCheck]) {
        return nil;
    }
    int lastIndex = --self.size;
    NSNumber *root = _elements[0];
    _elements[0] = _elements[lastIndex];
    _elements[lastIndex] = @(-1);
    
    [self siftDown:0];
    return root;
}

- (id)replace:(id)element {
    if (![self elementNotNullCheck:element]) {
        return nil;
    }
    
    NSNumber *root = NULL;
    
    if (self.size == 0) {
        _elements[0] = element;
        self.size++;
    } else {
        root = _elements[0];
        _elements[0] = element;
        [self siftDown:0];
    }
    return root;
}

#pragma mark - override 节点索引

- (int)root {
    return 0;
}

- (int)left:(int)node {
    int index = (node << 1) + 1;
    return index >= self.size ? NSNotFound : index;
}

- (int)right:(int)node {
    int index = (node << 1) + 2;
    return index >= self.size ? NSNotFound : index;
}

- (NSNumber *)string:(int)node {
    return _elements[node];
}

#pragma mark - 堆操作

/// 批量建堆
- (void)heapify {
    // 自上而下的上滤
//    for (int i = 1; i < self.size; i++) {
//        [self siftUp:i];
//    }
    
    // 自下而上的下滤
    for (int i = ((self.size >> 1) - 1); i >= 0; i--) {
        [self siftDown:i];
    }
}

/// 让index位置的元素下滤
- (void)siftDown:(int)index {
    NSNumber *element = _elements[index];
    int half = self.size >> 1;
    
    // 第一个叶子节点的索引 == 非叶子节点的数量
    // index < 第一个叶子节点的索引
    // 必须保证index位置是非叶子节点
    while (index < half) {
        // index的节点有2种情况
        // 1.只有左子节点
        // 2.同时欧左右子节点
        int childIndex = (index << 1) + 1;
        NSNumber *child = _elements[childIndex];
        
        // 右子节点
        int rightIndex = childIndex + 1;
        
        // 选出左右子节点最大的那个
        if (rightIndex < self.size) {
            if ([self.delegate respondsToSelector:@selector(compare:num2:)]) {
                if ([self.delegate compare:_elements[rightIndex] num2:child] > 0) {
                    child = _elements[childIndex = rightIndex];
                }
            } else {
                if ([self compare:_elements[rightIndex] num2:child] > 0) {
                    child = _elements[childIndex = rightIndex];
                }
            }
        }
        
        if ([self.delegate respondsToSelector:@selector(compare:num2:)]) {
            if ([self.delegate compare:element num2:child] >= 0) {
                break;
            }
        } else {
            if ([self compare:element num2:child] >= 0) {
                break;
            }
        }
        
        // 将子节点存放到index位置
        _elements[index] = child;
        // 重新设置index
        index = childIndex;
    }
    _elements[index] = element;
}

/// 让index位置的元素上滤
- (void)siftUp:(int)index {
    NSNumber *element = _elements[index];
    while (index > 0) {
        int parentIndex = (index - 1) >> 1;
        NSNumber *parent = _elements[parentIndex];
        if ([self.delegate respondsToSelector:@selector(compare:num2:)]) {
            if ([self.delegate compare:element num2:parent] <= 0) {
                break;
            }
        } else {
            if ([self compare:element num2:parent] <= 0) {
                break;
            }
        }
        
        // 将父元素存储在 index 位置
        _elements[index] = parent;
        
        // 重新赋值 index
        index = parentIndex;
    }
    _elements[index] = element;
}

#pragma mark - private

/// 扩容
- (void)ensureCapacity:(int)capacity {
    NSInteger oldCapacity = self.elementsCount;
    if (oldCapacity >= capacity) {
        return;
    }
    
    // 新容量为旧容量的1.5倍
    int newCapacity = oldCapacity + (oldCapacity >> 1);
    NSMutableArray *newElements = [NSMutableArray array];
    for (int i = 0; i < newCapacity; i++) {
        [newElements addObject:@(-1)];
    }
    for (int i = 0; i < self.size; i++) {
        newElements[i] = _elements[i];
    }
    _elements = newElements;
}

- (BOOL)emptyCheck {
    if (self.size == 0) {
        return YES;
    }
    return NO;
}

- (BOOL)elementNotNullCheck:(id)element {
    return element != nil;
}

- (NSInteger)elementsCount {
    return _elements.count;
//    NSInteger number = 0;
//    NSInteger i = 0;
//    while ([_elements[i] integerValue] >= 0) {
//        i++;
//        number++;
//    }
//    return number;
}

@end
