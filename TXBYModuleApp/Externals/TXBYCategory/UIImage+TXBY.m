//
//  UIImage+TXBY.m
//  TXBYCategory
//
//  Created by mac on 16/2/25.
//  Copyright © 2016年 tianxiabuyi. All rights reserved.
//

#import "UIImage+TXBY.h"

@implementation UIImage (TXBY)

/**
 *  加载图片
 *  @param name 图片名
 */
+ (UIImage *)imageWithName:(NSString *)name {
    if (name) {
        return [UIImage imageNamed:name];
    }
    return nil;
}

/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name {
    return [self resizedImageWithName:name xPos:0.5 yPos:0.5];
}

/**
 *  指定x y返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name xPos:(CGFloat)xPos yPos:(CGFloat)yPos {
    UIImage *image = [self imageWithName:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * xPos topCapHeight:image.size.height * yPos];
}

/**
 *  根据颜色生成图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

/**
 *  获取指定点的图片颜色
 */
- (UIColor *)colorAtPixel:(CGPoint)point {
    if (!CGRectContainsPoint(CGRectMake(0.0f, 0.0f, self.size.width, self.size.height), point)) {
        return nil;
    }
    
    NSInteger pointX = trunc(point.x);
    NSInteger pointY = trunc(point.y);
    CGImageRef cgImage = self.CGImage;
    NSUInteger width = self.size.width;
    NSUInteger height = self.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    int bytesPerPixel = 4;
    int bytesPerRow = bytesPerPixel * 1;
    NSUInteger bitsPerComponent = 8;
    unsigned char pixelData[4] = {0, 0, 0, 0};
    
    CGContextRef context = CGBitmapContextCreate(pixelData, 1, 1, bitsPerComponent, bytesPerRow, colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    
    
    CGContextTranslateCTM(context, -pointX, pointY-(CGFloat)height);
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), cgImage);
    CGContextRelease(context);
    
    // Convert color values [0..255] to floats [0.0..1.0]
    CGFloat red = (CGFloat)pixelData[0] / 255.0f;
    CGFloat green = (CGFloat)pixelData[1] / 255.0f;
    CGFloat blue = (CGFloat)pixelData[2] / 255.0f;
    CGFloat alpha = (CGFloat)pixelData[3] / 255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

/**
 *  图片裁剪成圆形
 */
+ (instancetype)circleImageWithImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    // 1.加载原图
    UIImage *oldImage = image;
    
    // 2.开启上下文
    CGFloat imageW = oldImage.size.width + 2 * borderWidth;
    CGFloat imageH = oldImage.size.height + 2 * borderWidth;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    // 3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 4.画边框(大圆)
    [borderColor set];
    CGFloat bigRadius = imageW * 0.5; // 大圆半径
    CGFloat centerX = bigRadius; // 圆心
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx); // 画圆
    
    // 5.小圆
    CGFloat smallRadius = bigRadius - borderWidth;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    // 裁剪(后面画的东西才会受裁剪的影响)
    CGContextClip(ctx);
    
    // 6.画图
    [oldImage drawInRect:CGRectMake(borderWidth, borderWidth, oldImage.size.width, oldImage.size.height)];
    
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

/**
 *  图片裁剪成圆形(有边框)
 *
 *  @param image          要裁剪的图片
 *  @param borderWidth    边框宽度
 *  @param borderColor    边框颜色
 *  @param imageViewWidth 图框宽度（默认为正方形，即长宽相等）
 *
 */
+ (UIImage *)circleImageWithImage:(UIImage *)image borderWidth:(CGFloat)borderWidth imageViewWidth:(CGFloat)imageViewWidth borderColor:(UIColor *)borderColor {
    // 1.加载原图
    UIImage *oldImage = image;
    
    // 2.开启上下文
    CGFloat oldImageSideLength = MAX(oldImage.size.width, oldImage.size.height);
    CGFloat newImageSideLength = oldImageSideLength * imageViewWidth / (imageViewWidth - 2 * borderWidth);
    CGSize imageSize = CGSizeMake(newImageSideLength, newImageSideLength);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    // 3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 4.画边框(大圆)
    // 边框宽度
    CGFloat actualBorderWidth = borderWidth * newImageSideLength / imageViewWidth;
    CGContextSetLineWidth(ctx, actualBorderWidth);
    // 边框颜色
    [borderColor setStroke];
    CGFloat bigRadius = (newImageSideLength + oldImageSideLength) * 0.25; // 大圆半径
    CGFloat centerX = bigRadius + actualBorderWidth * 0.5; // 圆心
    CGFloat centerY = bigRadius + actualBorderWidth * 0.5;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextStrokePath(ctx); // 画圆
    
    // 5.小圆
    CGFloat smallRadius = oldImageSideLength * 0.5;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    
    // 裁剪(后面画的东西才会受裁剪的影响)
    CGContextClip(ctx);
    
    // 6.画图
    CGFloat x = (newImageSideLength - oldImage.size.width) * 0.5;
    CGFloat y = (newImageSideLength - oldImage.size.height) * 0.5;
    [oldImage drawInRect:CGRectMake(x, y, oldImage.size.width, oldImage.size.height)];
    
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

/**
 *  图片裁剪成圆形(无边框)
 */
- (UIImage *)imageWithCornerRadius:(CGFloat)radius {
    
    CGFloat sideLength = MAX(self.size.width, self.size.height);
    CGRect rect = (CGRect){0.f, 0.f, sideLength, sideLength};
    
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    CGContextAddPath(UIGraphicsGetCurrentContext(),
                     [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:sideLength * 0.5].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    
    CGFloat imgX = (sideLength - self.size.width) * 0.5;
    CGFloat imgY = (sideLength - self.size.height) * 0.5;
    CGRect imgRect = (CGRect){imgX, imgY, self.size};
    
    [self drawInRect:imgRect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return image;
}

@end