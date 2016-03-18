//
//  ViewController.m
//  LYModelData
//
//  Created by LastDay on 16/1/28.
//  Copyright © 2016年 LastDay. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"

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
    
    
    NSString *girlFriend = @"白菜";
    id parmenters = @{
                      @"girlFriend":girlFriend,
                      @"age":@22.1,
                      @"name":@"Lastdays",
                      @"time":@"2016-03-18 5:55:49 +0000"
                      };
    
    
    Model *model = [Model LYModelWithJSON:parmenters];
    NSLog(@"%@",model.girlFriend);
    NSLog(@"%@",model.name);
    NSLog(@"%@",model.age);
    NSLog(@"%@",model.time);

    
    NSLog(@"========================================");
    
    NSDictionary *jsonObject= [model LYModelToJson];
    NSLog(@"%@",jsonObject);

}



@end
