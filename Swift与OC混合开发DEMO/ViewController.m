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

/*
    由于现在很多项目都是OC和Swift的混合开发，所以就涉及到了OC调用Swift、Swift调用OC这两种情况。
 
 1，   OC调用Swift的情况：
    系统会在项目中导入或者创建Swift文件的情况下，会自动创建一个类似 Swift与OC混合开发DEMO-Swift.h 这样一个.h文件；
        
        Swift与OC混合开发DEMO  ：  这个是项目名；
        -Swift.h             ：  这个是固定的写法；
 
    Xcode会自动把所有的Swift的文件的名称和外部函数、变量导入到 Swift与OC混合开发DEMO-Swift.h 中，我们只管使用就可以了。
 
    如果哪个OC文件要调用Swift的代码，像#import "Swift与OC混合开发DEMO-Swift.h" 这样，直接导入这个头文件就可以了；

 2，  Swift调用OC的情况：
    系统会在第一次创建Swift的文件会提示是否创建类似 Swift与OC混合开发DEMO-Bridging-Header.h这样的一个文件，如果没有提示，需要手动创建。
    
        Swift与OC混合开发DEMO  ：这个是项目名；
 
        -Bridging-Header.h   ：这个是固定的写法；桥接文件
 
        我们需要把在Swift中要调用的OC对应的.h文件都在 Swift与OC混合开发DEMO-Bridging-Header.h 中 import一下；
        #import "OCTableViewCell.h"
    
        这样在Swift的文件直接使用就可以了，不用在Swift中再次导入OC头文件。
    
 
    关于Swift与OC语言的配置问题：
    在工程的Build Settings中  Packaging模块把 Defines Module 设置为 YES
 */



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
