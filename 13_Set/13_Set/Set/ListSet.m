//
//  ListSet.m
//  13_Set
//
//  Created by chenshuang on 2020/2/26.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import "ListSet.h"
#import "LinkedList.h"

@interface ListSet()
/** list*/
@property(nonatomic,strong)LinkedList *list;
@end

@implementation ListSet

- (instancetype)init {
    self = [super init];
    if (self) {
        self.list = [[LinkedList alloc] init];
    }
    return self;
}

#pragma mark - override

- (int)size {
    return (int)self.list.size;
}

- (BOOL)isEmpty {
    return self.list.isEmpty;
}

- (void)clear {
    [self.list clear];
}

- (BOOL)contains:(id)element {
    return [self.list contains:element];
}

- (void)add:(id)element {
    NSUInteger index = [self.list indexOf:element];
    
    if (index == NSNotFound) {  // 不存在就添加
        [self.list add:element];
    } else {
        [self.list set:index element:element];
    }
}

- (void)remove:(id)element {
    NSInteger index = [self.list indexOf:element];
    
    if (index != NSNotFound) {  // 存在
        [self.list remove:index];
    }
}

- (void)traversal {
    for (int i = 0; i < self.list.size; i++) {
        NSLog(@"%@",[self.list get:i]);
    }
}

@end
