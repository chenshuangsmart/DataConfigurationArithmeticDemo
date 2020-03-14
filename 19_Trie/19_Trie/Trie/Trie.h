//
//  Trie.h
//  19_Trie
//
//  Created by chenshuang on 2020/3/14.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Trie : NSObject

- (int)size;

- (bool)isEmpty;

- (void)clear;

- (NSString *)get:(NSString *)key;

- (bool)contains:(NSString *)key;

- (id)add:(NSString *)key value:(id)value;

- (id)remove:(NSString *)key;

- (bool)starsWith:(NSString *)prefix;

@end

NS_ASSUME_NONNULL_END
