//
//  ViewController.m
//  19_Trie
//
//  Created by chenshuang on 2020/3/14.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import "ViewController.h"
#import "Trie.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
}

- (void)test {
    Trie *trie = [[Trie alloc] init];
    [trie add:@"cat" value:@(1)];
    [trie add:@"dog" value:@(2)];
    [trie add:@"catalog" value:@(3)];
    [trie add:@"cast" value:@(4)];
    
    NSString *prefix = @"cat";
//    prefix = @"dog";
//    prefix = @"catalog";
//    prefix = @"cast";
    
    NSLog(@"starsWith:%@ %d",prefix,[trie starsWith:prefix]);
}

@end
