//
//  EditRadarViewController.m
//  RadarProject
//
//  Created by Ainhoa Calviño Rodriguez on 06/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "EditRadarViewController.h"

@interface EditRadarViewController ()

@property (weak, nonatomic) IBOutlet UITextView *userText;
@property (weak, nonatomic) IBOutlet UITextView *titleText;
@property (nonatomic, strong) Radar *radarPrev;

@end

@implementation EditRadarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.radar != nil)
    {
        self.userText.text = self.radar.user;
        self.titleText.text = self.radar.title;
        self.radarPrev = self.radar;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.radar.user = self.userText.text;
    self.radar.title = self.titleText.text;
    
    NSManagedObjectContext *context = [self.radar managedObjectContext];
    NSError *error;
    [context save:&error];
    
    if (error != nil)
    {
        NSLog(@"Fail save in EditRadarViewController %@", error);
        self.radar.user = self.radarPrev.user;
        self.radar.title = self.radarPrev.title;
        [context save:&error];

    }
}

@end
