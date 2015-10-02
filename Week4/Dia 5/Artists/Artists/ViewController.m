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

@interface ViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic, strong) NSArray *artists;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self generateRandomArtist];
    [self loadData];
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

- (void)loadData
{
    ArtistService *artistService = [[ArtistService alloc]init];
    [artistService artistsWithCompletion:^(NSArray * artists) {
        self.artists = artists;
        NSLog(@"number artists %lu", artists.count);
        
        [self.myTableView reloadData];
    }];
}

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.artists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"artistCell" forIndexPath:indexPath];
    
    Artist *artist = [self.artists objectAtIndex:indexPath.item];
    cell.textLabel.text = artist.name;
    
    return cell;
}
@end
