//
//  ViewController.m
//  GOTCollectionView
//
//  Created by Ricardo Sánchez Sotres on 12/06/14.
//  Copyright (c) 2014 Ricardo Sanchez. All rights reserved.
//

#import "ViewController.h"
#import "GotModel.h"
#import "Character.h"
#import "House.h"
#import "MyCollectionViewCell.h"
#import "MyCollectionReusableView.h"

@interface ViewController () <UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (strong, nonatomic) IBOutlet GotModel *myGotModel;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *myLayout;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.myGotModel loadModel];
    
    [self.myCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([MyCollectionViewCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    [self.myCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([MyCollectionReusableView class]) bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    self.myLayout.headerReferenceSize = CGSizeMake(100, 100);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    House *house = self.myGotModel.houses[[indexPath section]];
    Character *character = house.characters[[indexPath row]];
    NSString *nameImage = [NSString stringWithFormat:@"%@.jpg",character.image];
    cell.myImageView.image = [UIImage imageNamed:nameImage];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    House *house = self.myGotModel.houses[section];
    return [house.characters count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.myGotModel.houses count];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionReusableView *myCollectionReusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
    
    House *house = self.myGotModel.houses[[indexPath section]];
    myCollectionReusableView.myLabel.text = house.name;
    
    return myCollectionReusableView;
}
@end
