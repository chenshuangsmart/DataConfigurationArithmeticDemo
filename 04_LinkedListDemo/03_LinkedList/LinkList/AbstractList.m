//
//  AbstractList.m
//  03_LinkedList
//
//  Created by chenshuang on 2019/4/28.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "AbstractList.h"

@implementation AbstractList

/// 数量
- (NSUInteger)size {
    return _size;
}

/// 是否为空
- (bool)isEmpty {
    return _size == 0;
}

/// 是否包含某个元素
- (bool)contains:(id)element {
    return [self indexOf:element] != NSNotFound;
}

/// 添加元素到尾部
- (void)add:(id)element {
    [self add:_size element:element];
}

#pragma mark - pprivate

- (void)outOfBounds:(NSUInteger)index {
    NSLog(@"index:%lu, size:%lu",(unsigned long)index,(unsigned long)_size);
}

/// 越界查询
- (bool)rangeCheck:(NSUInteger)index {
    if (index < 0 || index >= _size) {
        [self outOfBounds:index];
        return YES;
    }
    return NO;
}

- (bool)rangeCheckForAdd:(NSUInteger)index {
    if (index < 0  || index > _size) {
        [self outOfBounds:index];
        return YES;
    }
    return NO;
}

@end
