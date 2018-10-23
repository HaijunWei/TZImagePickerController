//
//  ViewController.m
//  TZImagePickerController
//
//  Created by 谭真 on 15/12/24.
//  Copyright © 2015年 谭真. All rights reserved.
//

#import "ViewController.h"
#import "TZImagePickerController.h"
#import "UIView+Layout.h"
#import "TZTestCell.h"
#import <Photos/Photos.h>
#import "LxGridViewFlowLayout.h"
#import "TZImageManager.h"
#import "TZVideoPlayerController.h"
#import "TZPhotoPreviewController.h"
#import "TZGifPhotoPreviewController.h"
#import "TZLocationManager.h"
#import "TZAssetCell.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "FLAnimatedImage.h"

@interface ViewController ()<TZImagePickerControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UIImagePickerControllerDelegate,UIAlertViewDelegate,UINavigationControllerDelegate> {
    NSMutableArray *_selectedPhotos;
    NSMutableArray *_selectedAssets;
    BOOL _isSelectOriginalPhoto;
    
    CGFloat _itemWH;
    CGFloat _margin;
}
@property (nonatomic, strong) UIImagePickerController *imagePickerVc;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (strong, nonatomic) LxGridViewFlowLayout *layout;
@property (strong, nonatomic) CLLocation *location;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
// 设置开关
@property (weak, nonatomic) IBOutlet UISwitch *showTakePhotoBtnSwitch;  ///< 允许拍照
@property (weak, nonatomic) IBOutlet UISwitch *showTakeVideoBtnSwitch;  ///< 允许拍视频
@property (weak, nonatomic) IBOutlet UISwitch *sortAscendingSwitch;     ///< 照片排列按修改时间升序
@property (weak, nonatomic) IBOutlet UISwitch *allowPickingVideoSwitch; ///< 允许选择视频
@property (weak, nonatomic) IBOutlet UISwitch *allowPickingImageSwitch; ///< 允许选择图片
@property (weak, nonatomic) IBOutlet UISwitch *allowPickingGifSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *allowPickingOriginalPhotoSwitch; ///< 允许选择原图
@property (weak, nonatomic) IBOutlet UISwitch *showSheetSwitch; ///< 显示一个sheet,把拍照/拍视频按钮放在外面
@property (weak, nonatomic) IBOutlet UITextField *maxCountTF;  ///< 照片最大可选张数，设置为1即为单选模式
@property (weak, nonatomic) IBOutlet UITextField *columnNumberTF;
@property (weak, nonatomic) IBOutlet UISwitch *allowCropSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *needCircleCropSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *allowPickingMuitlpleVideoSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *showSelectedIndexSwitch;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] init];
        [self presentViewController:imagePickerVc animated:YES completion:nil];
        return;
    });
    
    
}
@end
