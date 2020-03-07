//
//  TreeMap.h
//  14_Map
//
//  Created by chenshuang on 2020/2/29.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import "Map.h"

NS_ASSUME_NONNULL_BEGIN

@interface TreeMap : Map

- (int)size;

- (BOOL)isEmpty;

- (void)clear;

- (void)put:(id)key value:(id)value;

- (id)get:(id)key;

- (BOOL)containsKey:(id)key;

- (BOOL)containsValue:(id)value;

- (void)traversal;

@end

NS_ASSUME_NONNULL_END
