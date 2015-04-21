//
//  ViewController.m
//  SampleJSON
//
//  Created by Eriko Ichinohe on 2015/04/20.
//  Copyright (c) 2015年 Eriko Ichinohe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //元のURL
    NSString *orign = @"http://tepco-usage-api.appspot.com";
    //http://tepco-usage-api.appspot.com/西暦/月/日/時間.jsonとなるように生成
    NSInteger year = 2015;
    NSInteger month = 4;
    NSInteger day = 20;
    NSInteger hour = 9;
    
    NSString *url = [NSString stringWithFormat:@"%@/%ld/%ld/%ld/%ld.json",orign,year,month,day,hour];
    

    //NSURLからNSURLRequestを作る
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    //サーバーとの通信を行う
    NSData *json = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //JSONをパース
    NSArray *array = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
    
    NSLog(@"供給可能最大電力：%@万kW　消費電力：%@万kW", [array valueForKeyPath:@"capacity"], [array valueForKeyPath:@"usage"]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
