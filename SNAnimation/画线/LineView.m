//
//  LineView.m
//  SNAnimation
//
//  Created by D on 16/5/16.
//  Copyright © 2016年 Super_D. All rights reserved.
//

#import "LineView.h"

@implementation LineView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
#pragma mark --画矩形
#pragma mark a:第一种画法,通过连接固定的点绘制四边形
    CGContextMoveToPoint(context, 10, 40);
    CGContextAddLineToPoint(context, 40, 40);
    CGContextAddLineToPoint(context, 40, 10);
    CGContextAddLineToPoint(context, 10, 10);
    CGContextAddLineToPoint(context, 10, 40);
    CGContextSetRGBStrokeColor(context, 0, 0, 1, 1.0);  //blueColor
    CGContextStrokePath(context);
    
    
#pragma mark b:指定起点和宽高绘制四边形
    CGContextAddRect(context, CGRectMake(50, 10, 30, 30));
    CGContextSetRGBStrokeColor(context, 1, 1, 0, 1.0);  //yellowColor
    CGContextStrokePath(context);
    
    
#pragma mark c:二种的两步合并成一步。
    //画空心的四边形
    CGContextStrokeRect(context, CGRectMake(90, 10, 30, 30));
    //画实心的四边形
    CGContextFillRect(context, CGRectMake(90, 10, 30, 30));
    
    
#pragma mark d:绘制实心的四边形，注意没有空心的方法
    UIRectFill(CGRectMake(130, 10, 30, 30));
    
    
#pragma mark e:画根线，设置线条的宽度（通过这种方式可以画斜的四边形）
    CGContextMoveToPoint(context, 180, 20);
    CGContextAddLineToPoint(context, 210, 20);
    CGContextSetLineWidth(context, 30);
    //注意，线条只能画成是空心的
    CGContextStrokePath(context);
    
    
#pragma mark --画圆
    
    CGContextSetRGBStrokeColor(context,1,1,1,1.0);//画笔线的颜色
    CGContextSetLineWidth(context, 1.0);//线的宽度
    //void CGContextAddArc(CGContextRef c,CGFloat x, CGFloat y,CGFloat radius,CGFloat startAngle,CGFloat endAngle, int clockwise)1弧度＝180°/π （≈57.3°） 度＝弧度×180°/π 360°＝360×π/180 ＝2π 弧度
    // x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为 结束的弧度，clockwise 0为顺时针，1为逆时针。
    CGContextAddArc(context, 50, 100, 20, 0, 2 * M_PI, 0); //添加一个圆
    CGContextSetLineWidth(context, 3);  //线宽
    CGContextSetRGBStrokeColor(context, 1, 1, 0, 1.0);  //yellowColor
    CGContextDrawPath(context, kCGPathStroke); //绘制路径
    
    
#pragma mark --填充圆，无边框
    CGContextAddArc(context, 100, 100, 20, 0, 2 * M_PI, 0); //添加一个圆
    CGContextSetRGBStrokeColor(context, 1, 1, 1, 1.0);  //yellowColor
    CGContextDrawPath(context, kCGPathFill);//绘制填充
    
    
#pragma mark --画大圆并填充颜
    UIColor*aColor = [UIColor colorWithRed:1 green:0.0 blue:0 alpha:1];
    CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
    CGContextSetLineWidth(context, 3.0);//线的宽度
    CGContextAddArc(context, 160, 100, 30, 0, 2 * M_PI, 0); //添加一个圆
    //kCGPathFill填充非零绕数规则,kCGPathEOFill表示用奇偶规则,kCGPathStroke路径,kCGPathFillStroke路径填充,kCGPathEOFillStroke表示描线，不是填充
    CGContextDrawPath(context, kCGPathFillStroke); //绘制路径加填充
    
    
#pragma mark --画椭圆
    CGRect aRect= CGRectMake(200, 100, 20, 40);
    CGContextSetRGBStrokeColor(context, 0.6, 0.9, 0, 1.0);
    CGContextSetLineWidth(context, 3.0);
    CGContextAddEllipseInRect(context, aRect); //椭圆
    CGContextDrawPath(context, kCGPathStroke);
    
    
#pragma mark --画三角形
    //只要三个点就行跟画一条线方式一样，把三点连接起来
    CGPoint sPoints[3];//坐标点
    sPoints[0] =CGPointMake(100, 220);//坐标1
    sPoints[1] =CGPointMake(130, 220);//坐标2
    sPoints[2] =CGPointMake(130, 160);//坐标3
    CGContextAddLines(context, sPoints, 3);//添加线
    CGContextClosePath(context);//封起来
    CGContextDrawPath(context, kCGPathFill); //根据坐标绘制路径
//    kCGPathFill,
//    kCGPathEOFill,
//    kCGPathStroke,
//    kCGPathFillStroke,
//    kCGPathEOFillStroke
    
#pragma mark --画圆角矩形
    float fw = 180;
    float fh = 280;
    
    CGContextMoveToPoint(context, fw, fh-20);  // 开始坐标右边开始
    CGContextAddArcToPoint(context, fw, fh, fw-20, fh, 10);  // 右下角角度
    CGContextAddArcToPoint(context, 120, fh, 120, fh-20, 10); // 左下角角度
    CGContextAddArcToPoint(context, 120, 250, fw-20, 250, 10); // 左上角
    CGContextAddArcToPoint(context, fw, 250, fw, fh-20, 10); // 右上角
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
    
    CGContextAddArc(context, 260, 100, 30.0, 0.0, M_PI_2, 1);
    [[UIColor yellowColor]set];
    CGContextClosePath(context);

    CGContextDrawPath(context, kCGPathFillStroke);
    
#pragma mark --画直线
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 3);  //线宽
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1.0);  //redColor
    CGContextBeginPath(context);
    //greenColor
    CGContextMoveToPoint(context, 0, 160);  //起点坐标
    CGContextAddLineToPoint(context, 300, 160);   //终点坐标
    CGContextSetRGBStrokeColor(context, 0, 1, 0, 1.0);  // greenColor
    CGContextStrokePath(context);
    
    
#pragma mark --画弧线 (CGContextAddArcToPoint)
    //弧线的是通过指定两个切点，还有角度，调用CGContextAddArcToPoint()绘制
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddArcToPoint(context, 120, 200, 250, 300, 600);
    CGContextStrokePath(context);
    
#pragma mark --画弧线 (CGContextAddArc)
    CGContextBeginPath(context);
    CGContextSetRGBStrokeColor(context, 0, 1, 0, 1);
    CGContextAddArc(context, 100, 100, 50, M_PI, 4 * M_PI, 0);
    CGContextStrokePath(context);
    
    
#pragma mark --画贝塞尔曲线 
    CGContextMoveToPoint(context, 120, 300);//设置Path的起点
    CGContextAddQuadCurveToPoint(context,190, 310, 120, 390);//设置贝塞尔曲线的控制点坐标和终点坐标
    CGContextStrokePath(context);
    //三次曲线函数
    CGContextMoveToPoint(context, 200, 300);//设置Path的起点
    CGContextAddCurveToPoint(context,250, 280, 250, 400, 280, 300);//设置贝塞尔曲线的控制点坐标和控制点坐标终点坐标
    CGContextStrokePath(context);
    
    
#pragma mark --画虚线
    CGPoint startPoint = CGPointMake(0, 150);//虚线起点
    CGPoint endPoint = CGPointMake(300, 150);//虚线终点
    CGContextBeginPath(context);
    CGContextSetLineWidth(context,0.5);//线宽度
    CGContextSetStrokeColorWithColor(context,[UIColor blackColor].CGColor);
    CGFloat lengths[] = {4,2};//先画4个点再画2个点
    CGContextSetLineDash(context,0, lengths,1);//注意2(count)的值等于lengths数组的长度
    CGContextMoveToPoint(context,startPoint.x,startPoint.y);
    CGContextAddLineToPoint(context,endPoint.x,endPoint.y);
    CGContextStrokePath(context);
    CGContextClosePath(context);
}

@end
