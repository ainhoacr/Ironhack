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

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (strong, nonatomic) IBOutlet GotModel *myGotModel;
@property (strong, nonatomic) UICollectionViewFlowLayout *myLayoutVertical;
@property (strong, nonatomic) UICollectionViewFlowLayout *myLayoutHorizontal;
@property (strong, nonatomic) NSMutableSet *selectedItems;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.myGotModel loadModel];
    
    [self.myCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([MyCollectionViewCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    [self.myCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([MyCollectionReusableView class]) bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    [self.myCollectionView setCollectionViewLayout:self.myLayoutVertical animated:YES];
    self.myCollectionView.allowsMultipleSelection = YES;
    self.myCollectionView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Methods Segmented Control

- (IBAction)chageValueSegmentedControl:(UISegmentedControl *)segmentedControl
{
    switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            [self.myCollectionView setCollectionViewLayout:self.myLayoutVertical animated:YES];
            break;
            
        case 1:
            [self.myCollectionView setCollectionViewLayout:self.myLayoutHorizontal animated:YES];
            break;
            
        default:
            break;
    }
}

#pragma mark Methods Bar Button Item

- (IBAction)trashPressed:(UIBarButtonItem *)sender
{
    [self.myCollectionView performBatchUpdates:^{
        {
            [self.myCollectionView deleteItemsAtIndexPaths:[self.selectedItems allObjects]];
            [self.myGotModel removeCharacters:self.selectedItems];
            self.selectedItems = nil;
        }
    } completion:nil];
}

#pragma mark Methods Collection View Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.selectedItems addObject:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.selectedItems removeObject:indexPath];
}

#pragma mark Methods Collection View

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

#pragma mark - Lazy Loads

- (UICollectionViewFlowLayout *)myLayoutHorizontal
{
    if (!_myLayoutHorizontal) {
        _myLayoutHorizontal = [[UICollectionViewFlowLayout alloc]init];
        _myLayoutHorizontal.itemSize = CGSizeMake(200, 200);
        _myLayoutHorizontal.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);
        _myLayoutHorizontal.headerReferenceSize = CGSizeMake(200, 100);
        _myLayoutHorizontal.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    
    return _myLayoutHorizontal;
}

- (UICollectionViewFlowLayout *)myLayoutVertical
{
    if (!_myLayoutVertical) {
        _myLayoutVertical = [[UICollectionViewFlowLayout alloc]init];
        _myLayoutVertical.itemSize = CGSizeMake(200, 200);
        _myLayoutVertical.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);
        _myLayoutVertical.headerReferenceSize = CGSizeMake(200, 100);
        _myLayoutVertical.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    
    return _myLayoutVertical;
}

-(NSMutableSet *)selectedItems
{
    if (!_selectedItems) {
        _selectedItems = [[NSMutableSet alloc]init];
    }
    return _selectedItems;
}

@end
