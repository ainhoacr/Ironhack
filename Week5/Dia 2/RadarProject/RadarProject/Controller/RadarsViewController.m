//
//  RadarsViewController.m
//  RadarProject
//
//  Created by Ainhoa Calviño Rodriguez on 06/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "RadarsViewController.h"
#import "RadarCell.h"
#import "EditRadarViewController.h"
#import "RadarApiWapper.h"
#import "JSONParser.h"
#import "JSONRadarMapper.h"

@interface RadarsViewController () 

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end

@implementation RadarsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSAssert(self.managedObjectContext != nil, @"Programmer exception: I need a Managed Obaject Context and the programmer responsible from calling should be fired. Inmediatelly");
    
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.tableView addSubview:self.refreshControl];
    [self.refreshControl addTarget:self action:@selector(refreshRadars:) forControlEvents:UIControlEventValueChanged];
}

#pragma mark - Actions

- (IBAction)refreshRadars:(UIBarButtonItem *)sender
{
    RadarApiWapper *apiWapper = [[RadarApiWapper alloc]init];
    
    __weak RadarsViewController *weakSelf = self;
    
    [apiWapper radarsWithBaseURL:@"https://openradar.appspot.com/api/radars" completion:^(NSString * _Nullable returnData) {
        
        NSAssert([NSThread currentThread] == [NSThread mainThread], @"PELIGRO PELIGRO!");
        
        NSArray<RadarJSON *> *radars = [JSONParser parseJSONString:returnData];
        [JSONRadarMapper mapJSONRadars:radars inContext:self.managedObjectContext];
        
        [weakSelf.tableView reloadData];
        [weakSelf.refreshControl endRefreshing];
        
    } onError:^(NSError * _Nullable errorBlock) {
        
        [self.refreshControl endRefreshing];
        NSLog(@"Error download JSON");
    }];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RadarCell *cell = (RadarCell *) [tableView dequeueReusableCellWithIdentifier:@"RadarCell" forIndexPath:indexPath];
    
    Radar *radar = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.radar = radar;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 90;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:section];
    Radar *radar = (Radar *)[self.fetchedResultsController objectAtIndexPath:indexPath];
    
    RadarCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SectionCell"];
    cell.radar = radar;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:section];
    Radar *radar = (Radar *)[self.fetchedResultsController objectAtIndexPath:indexPath];
    
    return radar.user;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"detailRadarSegue"])
    {
        NSIndexPath *indexPath = [self.tableView  indexPathForSelectedRow];
        
        EditRadarViewController *editRadarViewController = [segue destinationViewController];
        editRadarViewController.radar = [self.fetchedResultsController objectAtIndexPath:indexPath];
    }
}
@end
