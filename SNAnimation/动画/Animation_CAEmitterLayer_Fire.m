//
//  Animation_CAEmitterLayer_Fire.m
//  SNAnimation
//
//  Created by D on 16/5/20.
//  Copyright © 2016年 Super_D. All rights reserved.
//

#import "Animation_CAEmitterLayer_Fire.h"

#define DF_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define DF_HEIGHT   [[UIScreen mainScreen] bounds].size.height

@interface Animation_CAEmitterLayer_Fire ()
@property (nonatomic, strong) CAEmitterLayer *layer_fire;
@property (nonatomic, strong) CAEmitterLayer *layer_smoke;
@end

@implementation Animation_CAEmitterLayer_Fire

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.layer_fire = [CAEmitterLayer layer];
    self.layer_fire.emitterSize = CGSizeMake(DF_WIDTH, 0);              //位置
    self.layer_fire.emitterPosition = CGPointMake(DF_WIDTH / 2.0, DF_HEIGHT); //发射方向
    self.layer_fire.emitterMode = kCAEmitterLayerOutline;   //发射粒子的模式
    self.layer_fire.emitterShape = kCAEmitterLayerLine;     //发射源的形状
    self.layer_fire.renderMode = kCAEmitterLayerAdditive;
    
    
    CAEmitterCell * fireCell = [CAEmitterCell emitterCell];
    fireCell.birthRate = 100;                   //每个点每秒产生的粒子个数
    fireCell.lifetime = 5;                      //粒子存活范围
    fireCell.lifetimeRange = 20;                //粒子存活时间范围
    fireCell.emissionLongitude = M_PI;          //x-y平面的发射方向
    fireCell.velocity = -80;                    //粒子的速度
    fireCell.velocityRange = 30;                //粒子的速度范围
    fireCell.yAcceleration = -200;                 //粒子的加速度方向
    fireCell.scale = 1;                         //粒子的缩放比例
    fireCell.scaleRange = 1;                  //粒子的缩放比例范围
    fireCell.scaleSpeed = 1;                  //粒子的缩放速度
    fireCell.color = [UIColor redColor].CGColor;
    fireCell.contents = (id)[[UIImage imageNamed:@"DazFire"] CGImage];
    self.layer_fire.emitterSize = CGSizeMake(DF_WIDTH, 0);
    
    
    self.layer_fire.emitterCells = [NSArray arrayWithObject:fireCell];
    [self.view.layer insertSublayer:self.layer_fire atIndex:0];
    
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
