//
//  ArrayList.m
//  03_LinkedList
//
//  Created by chenshuang on 2019/5/12.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "ArrayList.h"

static int kDefaultCapacity = 10;   // 默认元素数量为10个

@implementation ArrayList {
    NSMutableArray *_elements;
}

- (instancetype)init {
    return [self initWithCapaticy:kDefaultCapacity];
}

- (instancetype)initWithCapaticy:(int)capaticy {
    self = [super init];
    if (self) {
        capaticy = capaticy < kDefaultCapacity ? kDefaultCapacity : capaticy;
        _elements = [NSMutableArray array];
        for (int i = 0 ; i < capaticy; i++) {
            [_elements addObject:@(0)];
        }
    }
    return self;
}

#pragma mark - override

/// 清空所有元素
- (void)clear {
    for (int i = self.size - 1; i > -1; i++) {
        [_elements removeObjectAtIndex:i];
    }
    self.size = 0;
}

/// 获取index位置的元素
- (id)get:(NSUInteger)index {
    if([self rangeCheck:index]){
        return nil;
    }
    
    return [_elements objectAtIndex:index];
}

/// 设置index位置的元素
- (id)set:(NSUInteger)index element:(id)element {
    if([self rangeCheck:index]) {
        return nil;
    }
    
    id old = [_elements objectAtIndex:index];
    _elements[index] = element;
    
    return old;
}

/// 在index位置插入一个元素
- (void)add:(NSUInteger)index element:(id)element {
    [self ensureCapacity:self.size + 1];
    
    // index位置后面的值依次往后移动一位
    for (int i = self.size; i > index; i--) {
        _elements[i] = _elements[i - 1];
    }
    _elements[index] = element;
    self.size++;
}

/// 删除index位置的元素
- (id)remove:(NSUInteger)index {
    if ([self rangeCheck:index]) {
        return nil;
    }
    
    id old = _elements[index];
    for (int i = index + 1; i < self.size; i++) {
        _elements[i - 1] = _elements[i];
    }
    [_elements removeLastObject];
    self.size--;
    return old;
}

/// 查看元素的索引
- (NSUInteger)indexOf:(id)element {
    if (element == nil) {
        for (int i = 0; i < self.size; i++) {
            if (_elements[i] == nil) {
                return i;
            }
        }
    } else {
        for (int i = 0; i < self.size; i++) {
            if ([_elements[i] isEqual:element]) {
                return i;
            }
        }
    }
    
    return NSNotFound;
}

- (NSString *)description {
    [super description];
    NSMutableString *strM = [NSMutableString string];
    [strM appendString:[NSString stringWithFormat:@"size = %d",self.size]];
    [strM appendString:@", ["];
    for (int i = 0; i < self.size; i++) {
        if (i != 0) {
            [strM appendString:@", "];
        }
        [strM appendFormat:[NSString stringWithFormat:@"%@",_elements[i]]];
    }
    
    [strM appendString:@"]"];
    return strM.copy;
}

#pragma mark - private

- (void)ensureCapacity:(int)capacity {
    int oldCapacity = _elements.count;
    if (oldCapacity >= capacity) {
        return;
    }
    
    // 新容量为旧容量的1.5倍
    int newCapacity = oldCapacity + oldCapacity * 0.5;
    NSMutableArray *newElements = [NSMutableArray array];
    for (int i = 0; i < newCapacity; i++) {
        [newElements addObject:@(0)];
    }
    // 旧值设回
    for (int i = 0; i < self.size; i++) {
        newElements[i] = _elements[i];
    }
    _elements = newElements;
    self.size = newCapacity;
    NSLog(@"扩容为:%d",newCapacity);
}

@end
