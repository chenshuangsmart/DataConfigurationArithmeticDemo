//
//  ViewController.m
//  14_Map
//
//  Created by chenshuang on 2020/2/29.
//  Copyright © 2020年 wenwen. All rights reserved.
//

#import "ViewController.h"
#import "TreeMap.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self test1];
}

- (void)test1 {
    TreeMap *map = [[TreeMap alloc] init];
    [map put:@"c" value:@2];
    [map put:@"a" value:@5];
    [map put:@"b" value:@6];
    [map put:@"a" value:@8];
    
    [map traversal];
}

@end
