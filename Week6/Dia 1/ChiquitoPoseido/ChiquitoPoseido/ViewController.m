//
//  ViewController.m
//  ChiquitoPoseido
//
//  Created by Ainhoa Calviño Rodriguez on 12/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMotion/CoreMotion.h>
#import "SoundEffect.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, SoundEffectDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *labelGyro;
@property (weak, nonatomic) IBOutlet UILabel *labelBattery;

@property (assign, nonatomic) BOOL newMedia;
@property (assign, nonatomic) BOOL canPlayNextSound;
@property (assign, nonatomic) BOOL onOff;

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) CMMotionManager *motionManager;
@property (strong, nonatomic) SoundEffect *player;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        NSLog(@"📷");
    }
    else {
        NSLog(@"😱");
    }
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.player = [[SoundEffect alloc]init];
    self.player.delegate = self;
    self.canPlayNextSound = YES;
    
    [self motionManagerAccelerometer];
    [self batteryLevel];
    [self proximitySensor];
}

- (void)motionManagerAccelerometer {
    if (self.motionManager.accelerometerAvailable) {
        
        self.motionManager.accelerometerUpdateInterval = .2;
        self.motionManager.gyroUpdateInterval = .2;
        
        __weak ViewController *weakSelf = self;
        
        [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error){
            
            NSLog(@"x:%.02g y:%.02g z:%.02g",accelerometerData.acceleration.x, accelerometerData.acceleration.y, accelerometerData.acceleration.z);
            
            NSString *info = [NSString stringWithFormat:@"x:%.02g y:%.02g z:%.02g",accelerometerData.acceleration.x, accelerometerData.acceleration.y, accelerometerData.acceleration.z];
            weakSelf.labelGyro.text = info;
            
            if(accelerometerData.acceleration.x > 0.95) {
                
                if (weakSelf.canPlayNextSound) {
                    
                    weakSelf.canPlayNextSound = NO;
                    [weakSelf.player play:@"piano"];
                }
            }
            
            if (accelerometerData.acceleration.y > 0.95) {
                
                if (weakSelf.canPlayNextSound) {
                    
                    weakSelf.canPlayNextSound = NO;
                    [weakSelf.player play:@"timbales"];
                }
            }
            
            if (accelerometerData.acceleration.z > 0.95) {
                
                if (weakSelf.canPlayNextSound) {
                    
                    weakSelf.canPlayNextSound = NO;
                    [weakSelf.player play:@"drum"];
                }
            }
        }];
    }

}

- (void)batteryLevel {
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    
    float batteryLevel = [UIDevice currentDevice].batteryLevel;
    if (batteryLevel < 0.0) {
        // -1.0 means battery state is UIDeviceBatteryStateUnknown
        self.labelBattery.text = NSLocalizedString(@"Unknown", @"");
    }
    else {
        static NSNumberFormatter *numberFormatter = nil;
        if (numberFormatter == nil) {
            numberFormatter = [[NSNumberFormatter alloc] init];
            [numberFormatter setNumberStyle:NSNumberFormatterPercentStyle];
            [numberFormatter setMaximumFractionDigits:1];
        }
        NSNumber *levelObj = [NSNumber numberWithFloat:batteryLevel];
        self.labelBattery.text = [numberFormatter stringFromNumber:levelObj];
    }
}

- (void)proximitySensor {
    
    [[UIDevice currentDevice] setProximityMonitoringEnabled:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(proximityStateChanged) name:UIDeviceProximityStateDidChangeNotification object:nil];
}

- (void)proximityStateChanged {
    
    if ([UIDevice currentDevice].proximityState == YES)
    {
        if (self.canPlayNextSound)
        {
            self.canPlayNextSound = NO;
            [self.player play:@"piano"];
        }
    }
}

#pragma mark - SoundEffect

- (void)soundEffectDidFinishPlaying:(SoundEffect *)soundEffect {
    self.canPlayNextSound = YES;
}

#pragma mark - Actions

- (IBAction)partyJarl:(id)sender {
    
    static BOOL timerScheduled = NO;
    
    if (timerScheduled)
    {
        [[self timer] invalidate];
        self.timer = nil;
    }
    else {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(flashLight) userInfo:nil repeats:YES];
        self.onOff = YES;
    }
    
    timerScheduled = !timerScheduled;
}

- (void)flashLight {
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    [device lockForConfiguration:nil];
    [device setTorchMode: self.onOff ? AVCaptureTorchModeOn : AVCaptureTorchModeOff];
    [device unlockForConfiguration];
    self.onOff = !self.onOff;
}

- (IBAction)takePhoto:(UIButton *)sender {
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

- (IBAction)photoRoll:(UIButton *)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

#pragma mark - delegate PickerController

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    NSLog(@"Fotoo!");
    
    [self dismissViewControllerAnimated:YES completion:nil];
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        self.imageView.image = image;
        if (self.newMedia) {
            
//            UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:finishedSavingWithError:contextInfo:), nil);
        }
    }
}

#pragma mark delegate UIKit

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
    if (motion == UIEventSubtypeMotionShake) {
        self.imageView.image = nil;
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSURL *url = [NSURL URLWithString:@"http://culturacolectiva.com/wp-content/uploads/2013/08/Betty-boop-aparicion.jpg"];
            NSData *dataURL = [NSData dataWithContentsOfURL:url];
            UIImage *image = [UIImage imageWithData:dataURL];
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
            });
        });
        
        
        
    }
}

#pragma mark Preferences View

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
