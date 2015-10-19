//
//  ViewController.m
//  MemeRastreatorl
//
//  Created by Ainhoa Calviño Rodriguez on 15/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "ViewController.h"
#import "Memes.h"
#import "BokehScene.h"
#import "ColorCube/CCColorCube.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet SKView *scene;

@property (nonatomic, strong) Memes *memes;
@property (nonatomic, strong) BokehScene *bs;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.memes = [[Memes alloc]initWithPlistNamed:@"memes"];
    
    self.bs = [BokehScene sceneWithSize:self.scene.bounds.size];
    self.bs.scaleMode = SKSceneScaleModeAspectFill;
    
    [self.scene presentScene:self.bs];
}

- (IBAction)buttonDownloadMeme:(UIButton *)sender {
    [self downloadMeme:[self.memes randomElement]];
    
}

- (void) downloadMeme:(Meme *)meme {
    NSURLSession * session = [NSURLSession sharedSession];
    
    NSURL *url = [NSURL URLWithString:meme.url];
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
        
        
        CCColorCube *colorCube = [[CCColorCube alloc] init];
        NSArray *colors = [colorCube extractBrightColorsFromImage:image avoidColor:[UIColor blackColor] count:4];
        SKEmitterNode *node = (SKEmitterNode *) [self.bs childNodeWithName:@"particleBokeh"];
        node.particleColor = [colors lastObject];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
        });
    }];
    
    [task resume];
}

@end
