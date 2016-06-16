//
//  ViewController.m
//  SNAnimation
//
//  Created by D on 16/5/16.
//  Copyright © 2016年 Super_D. All rights reserved.
//


#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic, strong)NSMutableArray * dataArray;
@property (nonatomic, strong)NSMutableArray * titileArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.frame = self.view.bounds;
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.dataArray = [[NSMutableArray alloc]initWithObjects:@"LineVc",@"Animation_CAEmitterLayer",@"Animation_CAGradientLayer",@"Animation_CAEmitterLayer_Fire",nil];
    self.titileArray = [[NSMutableArray alloc]initWithObjects:@"画线",@"粒子动画",@"颜色渐变",@"火焰动画",nil];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * IDstring = @"IDString";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:IDstring];
    if (cell == nil) {
        cell = [[UITableViewCell alloc ]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:IDstring];
    }
    cell.textLabel.text = [self.titileArray objectAtIndex:indexPath.row];
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController * vc = nil;
    vc = [[NSClassFromString([self.dataArray objectAtIndex:indexPath.row]) alloc]init];
    vc.title = [self.titileArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
