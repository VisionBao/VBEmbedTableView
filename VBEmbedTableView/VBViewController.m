//
//  VBViewController.m
//  VBEmbedTableView
//
//  Created by Vision on 16/7/28.
//  Copyright © 2016年 VisionBao. All rights reserved.
//

#import "VBViewController.h"
#import "VBEmbedTableView.h"
#import "Masonry.h"

@interface VBViewController ()

@end

@implementation VBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    NSArray *array = @[@{@"title": @"标题1",
                         @"tag": @[@"副标题1", @"副标题2"]},
                       @{@"title": @"标了个题",
                         @"tag": @[@"副标题1", @"副标题2", @"副标题3"]},
                       @{@"title": @"好不好吃",
                         @"tag": @[@"好吃有好玩", @"副标题2",@"爆无影", @"副标题4"]},
                       @{@"title": @"标题333",
                         @"tag": @[@"副标题1", @"副标题2", @"副标题3"]},
                       @{@"title": @"标题1",
                         @"tag": @[@"副标题1", @"副标题2"]},
                       @{@"title": @"标题1",
                         @"tag": @[@"副标题1", @"副标题2"]},
                       @{@"title": @"标题1",
                         @"tag": @[@"副标题1", @"副标题2"]},
                       @{@"title": @"标题1",
                         @"tag": @[@"副标题1", @"副标题2"]},
                       @{@"title": @"标题1",
                         @"tag": @[@"副标题1", @"副标题2"]}];
    
    
    VBEmbedTableView *embedTableView = [[VBEmbedTableView alloc] initEmbedTableViewWithFrame:self.view.bounds];
    embedTableView.titleArray = @[@"标题", @"标题1", @"标题2", @"标题3",@"标题4",@"标题5",@"标题6",@"标题7",@"标题8",@"标题9"];
    embedTableView.tagArray =
  @[@[@"好吃有好玩", @"副标qweqweqweqwe题2",@"爆无影", @"副标题4"],
  @[@"1好吃有好玩", @"副标题2",@"爆无影", @"副标题4",@"1好吃有好玩", @"副标题2",@"爆无影", @"副标题4"],
  @[@"2好吃有好玩", @"副标题2",@"爆无影", @"副标题4"],
  @[@"3好吃有好玩", @"副标题2",@"爆无影", @"副标题4"],
  @[@"4好吃有好玩", @"副标题2",@"爆无影", @"副标题4",@"1好吃有好玩", @"副标题2",@"爆无影", @"副标题4",@"1好吃有好玩", @"副标题2",@"爆无影", @"副标题4"],
  @[@"5好吃有好玩", @"副标题2",@"爆无影", @"副标题4"],
  @[@"6好吃有好玩", @"副标题2",@"爆无影", @"副标题4"],
  @[@"7好吃有好玩", @"副标题2",@"爆无影", @"副标题4"],
  @[@"8好吃有好玩", @"副标题2",@"爆无影", @"副标题4"],
  @[@"9好吃有好玩", @"副标题2",@"爆无影", @"副标题4"]];
    [self.view addSubview:embedTableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
