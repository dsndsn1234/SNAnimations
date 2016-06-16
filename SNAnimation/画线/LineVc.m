//
//  LineVc.m
//  SNAnimation
//
//  Created by D on 16/5/16.
//  Copyright © 2016年 Super_D. All rights reserved.
//

#import "LineVc.h"
#import "LineView.h"

@interface LineVc ()
@property (nonatomic, strong) LineView *lineView;
@end

@implementation LineVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.lineView = [[LineView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.lineView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.lineView];
    
    
    
    
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
