//
//  ViewController.m
//  Artists
//
//  Created by Ainhoa Calviño Rodriguez on 02/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "ViewController.h"
#import "Artist.h"
#import "ArtistService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self generateRandomArtist];
    
    ArtistService *artistService = [[ArtistService alloc]init];
    [artistService artistsWithCompletion:^(NSArray * artists) {
        NSLog(@"%@ number artists %lu", artists, artists.count);
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self generateRandomArtist];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)generateRandomArtist
{
    Artist *artistRandom = [Artist randomArtist];
    Artist *artistCopy  = [artistRandom copy];
    NSLog(@"artistRandom: %@ artistCopy %@", artistRandom, artistCopy);
}
@end
