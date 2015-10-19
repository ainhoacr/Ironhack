//
//  GeoIPController.m
//  GeoIP
//
//  Created by Ainhoa Calviño Rodriguez on 13/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "GeoIPViewController.h"
#import "TelizeApiWapper.h"
#import "GeoIPJSON.h"
#import "JSONParser.h"
#import "JSONGeoIPMapper.h"
#import "GeoIPCell.h"
#import "RandomIP.h"
#import "GeoIPDetailViewController.h"
#import "GeoIPAdapter.h"

@interface GeoIPViewController ()

@property (strong, nonatomic) GeoIPAdapter *adapter;

@end

@implementation GeoIPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.tableView addSubview:self.refreshControl];
    [self.refreshControl addTarget:self action:@selector(refreshGeoIPS) forControlEvents:UIControlEventValueChanged];
    
    self.adapter = [[GeoIPAdapter alloc]initWithManagedObjectContext:self.parentContext andTableView:self.tableView];
    self.adapter.delegate = self;
}

#pragma mark - Selector

- (void)refreshGeoIPS
{
    TelizeApiWapper *apiWapper = [[TelizeApiWapper alloc]init];
    
    __weak GeoIPViewController *weakSelf = self;
    
    NSString *baseURL = @"http://www.telize.com/geoip/";
    RandomIP *randomIP = [[RandomIP alloc]init];
    NSMutableArray<NSString *> *arrayRandomIP =  [[randomIP generateRandomIPs:20] mutableCopy];
    
    for (NSString *ip in arrayRandomIP) {
        NSString *url = [baseURL stringByAppendingString:ip];
        
        [apiWapper telizeWithBaseURL:url onSuccess:^(NSString * _Nullable returnData) {
            
            NSAssert([NSThread currentThread] == [NSThread mainThread], @"PELIGRO PELIGRO!");
            
            GeoIPJSON *geoIP = [JSONParser parseJSONString:returnData];
            [JSONGeoIPMapper mapJSONRadars:geoIP inContext:weakSelf.childContext];
            
            
        } onError:^(NSError * _Nullable errorBlock) {
            
            [self.refreshControl endRefreshing];
            NSLog(@"Error download JSON");
        }];
        [weakSelf.refreshControl endRefreshing];

    }
    
    /*[arrayRandomIP enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj = [NSString stringWithFormat:@"%@%@", baseURL, obj];
    }];
    
    [arrayRandomIP enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [apiWapper telizeWithBaseURL:obj onSuccess:^(NSString * _Nullable returnData) {
            
            NSAssert([NSThread currentThread] == [NSThread mainThread], @"PELIGRO PELIGRO!");
            
            GeoIPJSON *geoIP = [JSONParser parseJSONString:returnData];
            [JSONGeoIPMapper mapJSONRadars:geoIP inContext:self.managedObjectContext];
            
        } onError:^(NSError * _Nullable errorBlock) {
            
            [self.refreshControl endRefreshing];
            NSLog(@"Error download JSON");
        }];
    }];
    
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];*/
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.adapter sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.adapter sections][section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GeoIPCell *cell = (GeoIPCell *) [tableView dequeueReusableCellWithIdentifier:@"GeoIPCell" forIndexPath:indexPath];
    
    GeoIP *geoIP = [self.adapter objectAtIndexPath:indexPath];
    cell.geoIP = geoIP;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"detailGeoIPSegue"])
    {
        NSIndexPath *indexPath = [self.tableView  indexPathForSelectedRow];
        
        GeoIPDetailViewController *geoIPDetailViewController = [segue destinationViewController];
        geoIPDetailViewController.geoIP = [self.adapter objectAtIndexPath:indexPath];
    }
}

- (IBAction)megaSuperEvilInsert:(id)sender {
    
    [self megaInsert:self.childContext];
    NSError *error;
    [self.parentContext save:&error];
}

- (void)megaInsert:(NSManagedObjectContext *)context {
    for (int i = 0; i < 1000; i++) {
        GeoIP *geoIP = [GeoIP insertInManagedObjectContext:context];
        geoIP.ip = [[[RandomIP alloc]init]  generateARandomIP];
        geoIP.country = [NSString stringWithFormat:@"Country %d", i];
        
    }
    
    NSError *error;
    [context save:&error];
    if (error) {
        NSLog(@"😱");
    }
}

- (IBAction)deleteObjects:(id)sender {
    
    NSFetchRequest *fetch = [GeoIP fetchRequestWithFields:@[@"ip"] andOrders:@[@YES]];
    
    NSError *error;
    NSArray *arrayGeoIP = [self.childContext executeFetchRequest:fetch error:&error];
    
    [arrayGeoIP enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.childContext deleteObject:obj];
    }];
    
    error = nil;
    [self.childContext save:&error];
    
    error = nil;
    [self.parentContext save:&error];
}
@end
