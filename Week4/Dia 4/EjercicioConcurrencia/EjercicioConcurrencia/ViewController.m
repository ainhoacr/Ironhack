//
//  ViewController.m
//  EjercicioConcurrencia
//
//  Created by Ainhoa Calviño Rodriguez on 01/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "ViewController.h"
#import "DownLoadImageOperation.h"
#import "FileAttributesOperation.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *buttonCancel;
@property (weak, nonatomic) IBOutlet UIButton *buttonGo;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

@property (nonatomic, strong) NSOperationQueue *operationQueue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)presedCancel:(UIButton *)sender
{
    [self.operationQueue cancelAllOperations];
}

- (IBAction)presedGo:(UIButton *)sender
{
    self.buttonCancel.enabled = YES;
    self.buttonGo.enabled = NO;
    self.myImageView.image = nil;
    
    FileAttributesOperation *fileAttributesOperation = [[FileAttributesOperation alloc] initWithPath:@"/" completion:^(NSDictionary *attributes) {
        NSLog(@"%@",attributes);
        self.buttonGo.enabled = YES;
    }];
    
    NSURL *url = [NSURL URLWithString:@"http://azu1.facilisimo.com/ima/i/2/4/90/am_77924_2252057_677466.jpg"];
    DownLoadImageOperation *downloadImageOperation = [[DownLoadImageOperation alloc]initWithURL:url completion:^(UIImage *image) {
        self.myImageView.image = image;
    }];
    
    [downloadImageOperation setCompletionBlock:^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.buttonGo.enabled = YES;
            self.buttonCancel.enabled = NO;
        });
    }];
    
    [downloadImageOperation addDependency:fileAttributesOperation];
    
    [self.operationQueue addOperation:fileAttributesOperation];
    [self.operationQueue addOperation:downloadImageOperation];
}

- (NSOperationQueue *)operationQueue {
    if (!_operationQueue) {
        _operationQueue = [[NSOperationQueue alloc]init];
    }
    return _operationQueue;
}
@end
