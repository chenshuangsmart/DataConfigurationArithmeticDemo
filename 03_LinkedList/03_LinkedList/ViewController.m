//
//  ViewController.m
//  03_LinkedList
//
//  Created by chenshuang on 2019/4/28.
//  Copyright © 2019年 wenwen. All rights reserved.
//

#import "ViewController.h"
#import "LinkList/LinkedList.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self linkedListText];
}

- (void)linkedListText {
    LinkedList *list = [[LinkedList alloc] init];
    [list add:@20];
    [list add:0 element:NULL];
    [list add:@30];
    [list add:[list size] element:@40];
    [list remove:1];
    NSLog(@"%@",list.description);
    
    [list clear];
    NSLog(@"%@",list.description);
}

@end
