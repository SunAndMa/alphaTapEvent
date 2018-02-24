//
//  SJTTouchImageView.m
//  根据像素的不透明程度判断点击
//
//  Created by 孙继桐 on 2016/11/3.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import "SJTTouchImageView.h"

@implementation SJTTouchImageView
{
    NSData *data;
}
static NSUInteger alphaOffset(NSUInteger x,NSUInteger y,NSUInteger w){
    return y * w * 4 + x * 4;
}

NSData *getBitmapFromImage(UIImage *image){
    if (!image) {
        return nil;
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    if (colorSpace == NULL) {
        return nil;
    }
    int width = image.size.width;
    int height = image.size.height;
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, 8, width * 4, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
    CGColorSpaceRelease(colorSpace);
    if (context == NULL) {
        return nil;
    }
    CGRect rect = (CGRect){.size = image.size};
    CGContextDrawImage(context, rect, image.CGImage);
    NSData *data = [NSData dataWithBytes:CGBitmapContextGetData(context) length:(width * height * 4)];
    CGContextRelease(context);
    return data;
}

- (instancetype)initWithImage:(UIImage *)image
{
    if (self = [super initWithImage:image]) {
        self.userInteractionEnabled = YES;
        data = getBitmapFromImage(image);
    }
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if (!CGRectContainsPoint(self.bounds, point)) {
        return NO;
    }
    Byte *bytes = (Byte *)data.bytes;
    NSUInteger offset = alphaOffset(point.x, point.y, self.image.size.width);
    return (bytes[offset] > 1);
}


@end
