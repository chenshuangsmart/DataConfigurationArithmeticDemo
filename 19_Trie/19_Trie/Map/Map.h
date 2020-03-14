//
//  Map.h
//  14_Map
//
//  Created by chenshuang on 2020/2/29.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Map : NSObject

- (int)size;

- (BOOL)isEmpty;

- (void)put:(id)key value:(id)value;

- (id)get:(id)key;

- (void)remove;

- (void)clear;

- (BOOL)containsKey:(id)key;

- (BOOL)containsValue:(id)value;

@end

NS_ASSUME_NONNULL_END
