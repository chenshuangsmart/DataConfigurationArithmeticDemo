//
//  Stack.m
//  03_LinkedList
//
//  Created by chenshuang on 2019/5/12.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "Stack.h"
#import "ArrayList.h"

@implementation Stack {
    ArrayList *_arrayList;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _arrayList = [[ArrayList alloc] init];
    }
    return self;
}

/// 长度
- (int)size {
    return [_arrayList size];
}

/// 是否为空
- (bool)isEmpty {
    return [_arrayList isEmpty];
}

/// 入栈
- (void)push:(id)element {
    [_arrayList add:element];
}

/// 出栈
- (id)pop {
    return [_arrayList remove:_arrayList.size - 1];
}

/// 返回栈顶元素
- (id)top {
    return [_arrayList get:_arrayList.size - 1];
}

@end
