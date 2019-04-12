//
//  HJImagePickerController.h
//
//  Created by Haijun on 2019/4/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HJImagePickerController : UIImagePickerController
/// 是否允许拍照
@property (nonatomic, assign) BOOL isAllowTakePicture;
/// 是否允许编辑图片
@property (nonatomic, assign) BOOL isAllowEditPicture;
/// 是否需要圆形剪裁
@property (nonatomic, assign) BOOL isNeedCircleCrop;
/// 图片剪裁比例
@property (nonatomic, assign) CGSize cropAspectRatio;
/// 是否允许录制视频
@property (nonatomic, assign) BOOL isAllowTakeVideo;

@property (nonatomic, copy) void (^doneBlock)(UIImage *_Nullable image, NSURL *_Nullable videoUrl);

@end

NS_ASSUME_NONNULL_END
