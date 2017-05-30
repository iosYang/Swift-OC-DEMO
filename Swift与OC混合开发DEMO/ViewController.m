//
//  ViewController.m
//  Swift与OC混合开发DEMO
//
//  Created by 杨旗 on 2017/5/30.
//  Copyright © 2017年 杨旗. All rights reserved.
//

#import "ViewController.h"
#import "Swift与OC混合开发DEMO-Swift.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [_tableView registerNib:[UINib nibWithNibName:@"SwiftBasicTableViewCell" bundle:nil] forCellReuseIdentifier:@"SwiftBasicTableViewCell"];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SwiftBasicTableViewCell * basicTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"SwiftBasicTableViewCell"];
    
    __weak ViewController * blockSelf = self;
    basicTableViewCell.touchBlock = ^(NSString * test){
        NSLog(@"test");
        SwiftDetailViewController * detailVC = [[SwiftDetailViewController alloc] initWithNibName:@"SwiftDetailViewController" bundle:nil];
        [blockSelf presentViewController:detailVC animated:YES completion:nil];
    };
    
    return basicTableViewCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UIScreen mainScreen].bounds.size.height;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
