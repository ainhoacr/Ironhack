//
//  VehicleListTableViewController.m
//  Vehicles
//
//  Created by Joan Romano on 9/7/15.
//  Copyright (c) 2015 Ironhack. All rights reserved.
//

#import "VehicleListTableViewController.h"

#import "VehicleDetailViewController.h"
#import "Vehicle.h"
#import "Car.h"

@interface VehicleListTableViewController ()

@property (nonatomic, strong) NSMutableArray *vehicles;

@end

@implementation VehicleListTableViewController

#pragma mark - View Lifecycle
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupVehicleArray];
    
    self.title
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table View Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.vehicles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Vehicle *rowVehicle = self.vehicles[indexPath.row];
    cell.textLabel.text = [rowVehicle description];
    return cell;
}

#pragma mark - Segue Handling
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Vehicle *selectedVehicle = self.vehicles[indexPath.row];
        [[segue destinationViewController] setDetailVehicle:selectedVehicle];
    }
}

#pragma mark - Public Methods

//lazy instancion  //sobreescribir el getter de una propiedad para inicializarla
- (NSMutableArray *)vehicles
{
    if (!_vehicles)
    {
        _vehicles = [NSMutableArray array];
    }
    return _vehicles;
}

- (void)setupVehicleArray
{
    for (NSUInteger i=0; i<3; i++)
    {
        [self.vehicles addObject:[[Car alloc]init]];
    }
}

@end
