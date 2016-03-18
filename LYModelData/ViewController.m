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
    
    
    NSString *xxx = @"nihao1";
    id parmenters = @{
                      @"created":xxx,
                      @"uid":@1.32323,
                      @"name":@"张俊",
                      @"time":@"2011-01-18 03:55:49 +0000"
                      };
    txsss *x = [txsss LDModelWithJSON:parmenters];
    NSDictionary *d = [x LDModelToJson];
    NSLog(@"%@",d);

}



@end
