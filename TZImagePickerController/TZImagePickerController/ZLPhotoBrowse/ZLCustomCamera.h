//
//  ZLCustomCamera.h
//  CustomCamera
//
//  Created by long on 2017/6/26.
//  Copyright © 2017年 long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLDefine.h"

@interface ZLCustomCamera : UIViewController

@property (nonatomic, assign) CFTimeInterval maxRecordTime;

//是否允许拍照
@property (nonatomic, assign) BOOL allowTakePhoto;
//是否允许录制视频
@property (nonatomic, assign) BOOL allowRecordVideo;
/// 是否允许编辑
@property (nonatomic, assign) BOOL allowEdit;
/// 修剪宽高比
@property (nonatomic, assign) CGSize cropAspectRatio;
/// 是否需要圆形剪裁区
@property (nonatomic, assign) BOOL needCircleCrop;

//最大录制时长
@property (nonatomic, assign) NSInteger maxRecordDuration;

@property (nonatomic, assign) ZLCaptureSessionPreset sessionPreset;

@property (nonatomic, assign) ZLExportVideoType videoType;

//录制视频时候进度条颜色
@property (nonatomic, strong) UIColor *circleProgressColor;

/**
 确定回调，如果拍照则videoUrl为nil，如果视频则image为nil
 */
@property (nonatomic, copy) void (^doneBlock)(UIImage *image, NSURL *videoUrl);

@end
