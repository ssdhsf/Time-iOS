//
//  YJ_ScanView.m
//  Time
//
//  Created by 刘亚军 on 2017/6/14.
//  Copyright © 2017年 Time. All rights reserved.
//

#import "YJ_ScanView.h"
#import <AVFoundation/AVFoundation.h>
@interface YJ_ScanView ()<AVCaptureMetadataOutputObjectsDelegate>
{
    CGFloat scanViewWidth;
    CGFloat scanViewHeight;
    CGFloat scanBgViewHeight;
}
@property (weak, nonatomic) IBOutlet UIView *scanRectView;
// LED开关
@property (weak, nonatomic) IBOutlet UIButton *lightBtn;
// 扫描线
@property (strong,nonatomic) UIImageView *scanLine;


@property(strong,nonatomic) AVCaptureVideoPreviewLayer *previewLayer;
@property(strong,nonatomic) AVCaptureSession *session;
@end
@implementation YJ_ScanView
- (void)awakeFromNib{
    [super awakeFromNib];
    [self configure];
}
- (void)configure{
    scanViewWidth = C_ScreenWidth*0.6;
    scanViewHeight = scanViewWidth ;
    scanBgViewHeight = C_ScreenHeight - 64;
    [self.lightBtn addTarget:self action:@selector(lightSwitchAction:) forControlEvents:UIControlEventTouchUpInside];
}
+ (instancetype)scanView{
    YJ_ScanView *scanView = [YJ_ScanView yj_loadBundleNib];
    [scanView initUI];
    return scanView;
}
- (void)initUI{
    self.scanRectView.backgroundColor = [UIColor clearColor];
    //边框
    [self.scanRectView.layer setBorderWidth:0.5];
    self.scanRectView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    //阴影
    self.scanRectView.layer.shadowOffset = CGSizeMake(2, 2);
    self.scanRectView.layer.shadowRadius = 5;
    self.scanRectView.layer.shadowOpacity = 1;
    self.scanRectView.layer.shadowColor = [UIColor blackColor].CGColor;
    //扫描线
    self.scanLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scanline"]];
    self.scanLine.frame = CGRectMake(0, 0, scanViewWidth, 10);
    [self.scanRectView addSubview:self.scanLine];
    [self moveScanLayer];
    [self start];
    
    [self.session startRunning];
    // 关闭屏保
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
}
#pragma mark - action
- (void)lightSwitchAction:(UIButton *) btn{
    btn.selected = !btn.selected;
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error;
    if (device.hasTorch) {  // 判断设备是否有散光灯
        BOOL b = [device lockForConfiguration:&error];
        if (!b) {
            if (error) {
                C_NSLog(@"lock torch configuration error:%@", error.localizedDescription);
            }
            return;
        }
        device.torchMode =
        (device.torchMode == AVCaptureTorchModeOff ? AVCaptureTorchModeOn : AVCaptureTorchModeOff);
        [device unlockForConfiguration];
    }
}
- (void)moveScanLayer
{
    [UIView animateWithDuration:2 animations:^{
        _scanLine.transform = CGAffineTransformMakeTranslation(0, scanViewHeight-10);
    } completion:^(BOOL finished) {
        _scanLine.transform = CGAffineTransformIdentity;
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(moveScanLayer) object:nil];
        [self performSelector:@selector(moveScanLayer) withObject:nil afterDelay:0.1];
    }];
}
- (void)start{
    // 1. 摄像头设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    // 2. 设置输入
    NSError *error = nil;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if (error) {
        C_NSLog(@"开启摄像头失败");
        return;
    }
    // 3. 设置输出(Metadata元数据)
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
    // 3.1 设置输出的代理
    // 说明：使用主线程队列，相应比较同步，使用其他队列，相应不同步，容易让用户产生不好的体验
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    // 4. 拍摄会话
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    // 添加session的输入和输出
    if ([session canAddInput:input]) {
        [session addInput:input];
    }
    if ([session canAddOutput:output]) {
        [session addOutput:output];
    }
    //使用1080p的图像输出
    session.sessionPreset = AVCaptureSessionPreset1920x1080;
    // 4.1 设置输出的格式
    // 提示：一定要先设置会话的输出为output之后，再指定输出的元数据类型！
    // 可扫二维码与条形码
    //    [output setMetadataObjectTypes:[output availableMetadataObjectTypes]];
    // 只扫二维码
    //    [output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    // 只扫条形码
    [output setMetadataObjectTypes:@[AVMetadataObjectTypeDataMatrixCode,  AVMetadataObjectTypeITF14Code,
                                     AVMetadataObjectTypeInterleaved2of5Code,AVMetadataObjectTypeAztecCode,AVMetadataObjectTypePDF417Code,AVMetadataObjectTypeCode128Code,AVMetadataObjectTypeCode93Code,AVMetadataObjectTypeEAN8Code,AVMetadataObjectTypeEAN13Code,AVMetadataObjectTypeCode39Mod43Code,AVMetadataObjectTypeCode39Code,AVMetadataObjectTypeUPCECode]];
    // 5. 设置预览图层（用来让用户能够看到扫描情况）
    AVCaptureVideoPreviewLayer *preview = [AVCaptureVideoPreviewLayer layerWithSession:session];
    // 5.1 设置preview图层的属性
    preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
    // 5.2 设置preview图层的大小
    preview.frame = CGRectMake(0, 0, C_ScreenWidth, scanBgViewHeight);
    self.previewLayer = preview;
    [self.layer insertSublayer:self.previewLayer atIndex:0];
    
    //
    CGSize size = CGSizeMake(C_ScreenWidth, C_ScreenHeight);
    
    CGRect cropRect = CGRectMake((C_ScreenWidth - scanViewWidth)/2, (C_ScreenHeight - scanViewWidth)/2, scanViewWidth, scanViewHeight);
    CGFloat p1 = size.height/size.width;
    CGFloat p2 = 1920./1080.;  //使用1080p的图像输出
    if (p1 < p2) {
        CGFloat fixHeight = C_ScreenWidth * 1920. / 1080.;
        CGFloat fixPadding = (fixHeight - size.height)/2;
        output.rectOfInterest = CGRectMake((cropRect.origin.y + fixPadding)/fixHeight,
                                           cropRect.origin.x/size.width,
                                           cropRect.size.height/fixHeight,
                                           cropRect.size.width/size.width);
    } else {
        CGFloat fixWidth = C_ScreenHeight * 1080. / 1920.;
        CGFloat fixPadding = (fixWidth - size.width)/2;
        output.rectOfInterest = CGRectMake(cropRect.origin.y/size.height,
                                           (cropRect.origin.x + fixPadding)/fixWidth,
                                           cropRect.size.height/size.height,
                                           cropRect.size.width/fixWidth);
    }
    //
    self.session = session;
    
}
#pragma mark - AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection

{
    
    //    C_NSLog(@"%@", metadataObjects);
    if (metadataObjects.count > 0) {
        
        AVMetadataMachineReadableCodeObject *obj = metadataObjects[0];
        if([obj isKindOfClass:[AVMetadataMachineReadableCodeObject class]]){
            [self.session stopRunning];
            C_NSLog(@"%@", obj.stringValue);
            NSString *scanCode = obj.stringValue;
            if (self.delegate &&
                [self.delegate respondsToSelector:@selector(yj_scanView:didScanedResult:)]) {
                [self.delegate yj_scanView:self didScanedResult:scanCode];
            }
//            if (![self.dataArray containsObject:scanCode]) {
//                [self.dataArray insertObject:scanCode atIndex:0];
//                [self.tableView reloadData];
//            }
        }
        
    }
}

#pragma mark - setter getter
- (UIImageView *)scanLine{
    if (!_scanLine) {
        _scanLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scanline"]];
        _scanLine.frame = CGRectMake(0, 0, scanViewWidth, 10);
    }
    return _scanLine;
}
@end
