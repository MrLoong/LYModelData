//
//  ViewController.m
//  LYModelData
//
//  Created by LastDay on 16/1/28.
//  Copyright © 2016年 LastDay. All rights reserved.
//

#import "ViewController.h"
#import "txsss.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)JsonToObject:(id)sender {
    
    
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    NSString *xxx = @"nihao1";
    id parmenters = @{
                      @"created":xxx,
                      @"uid":@1.32323,
                      @"name":@"张俊",
                      @"time":@"2011-01-18 03:55:49 +0000"
                      };
    txsss *x = [txsss ly_modelWithJSON:parmenters];
    
    NSDictionary *myClassDict;
    myClassDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                        @"2011-01-18 03:55:49 +0000", @"time",
                                        @1.32323, @"uid",
                                        @"张俊", @"name",
                                        xxx, @"created",
                                        x, @"user",nil];
    
    txsss *xx = [txsss ly_modelWithJSON:myClassDict];
    
//    txsss *x = [[txsss alloc] init];
//    [x te];

    NSLog(@"%@",xx.uid);
    NSLog(@"%@",x.time);

}



@end
