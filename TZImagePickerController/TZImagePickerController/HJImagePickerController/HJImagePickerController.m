//
//  HJImagePickerController.m
//
//  Created by Haijun on 2019/4/12.
//

#import "TOCropViewController.h"
#import "HJImagePickerController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface HJImagePickerController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation HJImagePickerController

#pragma mark - Actions

- (void)editPhoto:(UIImage *)photo callback:(void(^)(UIImage * _Nullable photo))callback {
    TOCropViewCroppingStyle style = self.isNeedCircleCrop ? TOCropViewCroppingStyleCircular : TOCropViewCroppingStyleDefault;
    TOCropViewController *cropViewController = [[TOCropViewController alloc] initWithCroppingStyle:style image:photo];
    if (style == TOCropViewCroppingStyleDefault && !CGSizeEqualToSize(CGSizeZero, self.cropAspectRatio)) {
        // 如果有自定义剪裁比，禁止随意调整比例
        cropViewController.aspectRatioLockEnabled = YES;
        cropViewController.resetAspectRatioEnabled = NO;
        cropViewController.customAspectRatio = self.cropAspectRatio;
    }
    [self addChildViewController:cropViewController];
    cropViewController.view.frame = self.view.bounds;
    cropViewController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:cropViewController.view];
    __weak typeof(cropViewController) weakVC = cropViewController;
    cropViewController.onDidCropToRect = ^(UIImage * _Nonnull image, CGRect cropRect, NSInteger angle) {
        [weakVC.view removeFromSuperview];
        [weakVC removeFromParentViewController];
        callback(image);
    };
    cropViewController.onDidFinishCancelled = ^(BOOL isFinished) {
        callback(nil);
        [weakVC.view removeFromSuperview];
        [weakVC removeFromParentViewController];
        [self dismissViewControllerAnimated:YES completion:nil];
    };
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    if ([type isEqualToString:@"public.image"]) {
        UIImage *photo = [info objectForKey:UIImagePickerControllerOriginalImage];
        if (photo && self.doneBlock) {
            if (self.isAllowEditPicture) {
                [self editPhoto:photo callback:^(UIImage *photo) {
                    self.doneBlock(photo, nil);
                }];
            } else {
                self.doneBlock(photo, nil);
            }
        }
    } else if ([type isEqualToString:@"public.movie"]) {
        NSURL *videoUrl = [info objectForKey:UIImagePickerControllerMediaURL];
        if (videoUrl && self.doneBlock) {
            self.doneBlock(nil, videoUrl);
        }
    }
}

- (void)updateMeidaTypes {
    NSMutableArray *mediaTypes = [NSMutableArray array];
    if (self.isAllowTakePicture) {
        [mediaTypes addObject:(NSString *)kUTTypeImage];
    }
    if (self.isAllowTakeVideo) {
        [mediaTypes addObject:(NSString *)kUTTypeMovie];
    }
    self.mediaTypes = mediaTypes;
}

#pragma mark - Override

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self updateMeidaTypes];
}

@end
