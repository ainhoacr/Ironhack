//
//  RadarsViewController+ACNSFetchResultsController.h
//  RadarProject
//
//  Created by Ainhoa Calviño Rodriguez on 08/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "RadarsViewController.h"

@interface RadarsViewController (ACNSFetchResultsController) <NSFetchedResultsControllerDelegate>

- (NSFetchedResultsController *)fetchedResultsController;

@end
