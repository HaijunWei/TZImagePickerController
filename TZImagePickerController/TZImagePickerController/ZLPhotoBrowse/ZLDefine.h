//
//  ZLDefine.h
//  多选相册照片
//
//  Created by long on 15/11/26.
//  Copyright © 2015年 long. All rights reserved.
//

#ifndef ZLDefine_h
#define ZLDefine_h

#define kRGB(r, g, b)   [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

#define ZL_IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define ZL_IS_IPHONE_X (ZL_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 812.0f)
#define ZL_SafeAreaBottom (ZL_IS_IPHONE_X ? 34 : 0)

#define kViewWidth      [[UIScreen mainScreen] bounds].size.width
#define kViewHeight     [[UIScreen mainScreen] bounds].size.height

//录制视频及拍照分辨率
typedef NS_ENUM(NSUInteger, ZLCaptureSessionPreset) {
    ZLCaptureSessionPreset325x288,
    ZLCaptureSessionPreset640x480,
    ZLCaptureSessionPreset1280x720,
    ZLCaptureSessionPreset1920x1080,
    ZLCaptureSessionPreset3840x2160,
};

//导出视频类型
typedef NS_ENUM(NSUInteger, ZLExportVideoType) {
    //default
    ZLExportVideoTypeMov,
    ZLExportVideoTypeMp4,
};

static inline CGFloat GetViewWidth(UIView *view) {
    return view.frame.size.width;
}

static inline CGFloat GetViewHeight(UIView *view) {
    return view.frame.size.height;
}


#endif /* ZLDefine_h */
