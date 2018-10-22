//
//  UIImage+MyBundle.m
//  TZImagePickerController
//
//  Created by Haijun on 2018/10/22.
//  Copyright © 2018 谭真. All rights reserved.
//

#import "UIImage+MyBundle.h"
#import "NSBundle+TZImagePicker.h"

@implementation UIImage (MyBundle)

+ (UIImage *)imageNamedFromMyBundle:(NSString *)name {
    NSBundle *imageBundle = [NSBundle tz_imagePickerBundle];
    name = [name stringByAppendingString:@"@2x"];
    NSString *imagePath = [imageBundle pathForResource:name ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    if (!image) {
        // 兼容业务方自己设置图片的方式
        name = [name stringByReplacingOccurrencesOfString:@"@2x" withString:@""];
        image = [UIImage imageNamed:name];
    }
    return image;
}

@end

