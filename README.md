# 使用

### 基本的Model 和  JSON相互转换

``` bash
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

```



欢迎指出问题