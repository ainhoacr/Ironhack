//
//  CustomViewFlowLayout.m
//  GOTCollectionView
//
//  Created by Ainhoa Calviño Rodriguez on 18/09/15.
//  Copyright (c) 2015 Ricardo Sanchez. All rights reserved.
//

#import "CustomViewFlowLayout.h"

@interface CustomViewFlowLayout()

@property (nonatomic, strong) NSDictionary *layoutInfo;

@end

@implementation CustomViewFlowLayout

-(instancetype)init
{
    self = [super init];
    
    if (self) {
        self.itemInsets = UIEdgeInsetsMake(50, 50, 50, 50);
        self.itemSize = CGSizeMake(200, 200);
        self.interItemSpacingY = 50.0;
        self.numberOfColumns = 3;
    }
    
    return self;
}

- (void)prepareLayout
{
    NSMutableDictionary *cellLayoutInfo = [NSMutableDictionary dictionary];
    
    NSInteger sectionCount = [self.collectionView numberOfSections];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    
    for (NSInteger section = 0; section < sectionCount; section++) {
            NSInteger itemCount = [self.collectionView numberOfItemsInSection:section];
        
            for (NSInteger item = 0; item < itemCount; item++) {
                    indexPath = [NSIndexPath indexPathForItem:item inSection:section];
                    UICollectionViewLayoutAttributes *itemAttributes = [self calculaAttributesAtIndexPath:indexPath];
                    cellLayoutInfo[indexPath] = itemAttributes;
            }
    }
    
    self.layoutInfo = cellLayoutInfo.copy;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *allAttributes = [NSMutableArray arrayWithCapacity:self.layoutInfo.count];
    
    [self.layoutInfo enumerateKeysAndObjectsUsingBlock:^(NSIndexPath *indexPath,                                                   UICollectionViewLayoutAttributes *attributes, BOOL *innerStop) {
            if (CGRectIntersectsRect(rect, attributes.frame)) {
                [allAttributes addObject:attributes];
            }
    }];
    return allAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.layoutInfo[indexPath];
}

- (CGSize)collectionViewContentSize
{
    NSInteger rowCount = [self.collectionView numberOfSections] / self.numberOfColumns;
    // make sure we count another row if one is only partially filled
    if ([self.collectionView numberOfSections] % self.numberOfColumns) rowCount++;
    
    CGFloat height = self.itemInsets.top + rowCount * self.itemSize.height + (rowCount - 1) * self.interItemSpacingY + self.itemInsets.bottom;
    
    return CGSizeMake(self.collectionView.bounds.size.width, height);
}

- (UICollectionViewLayoutAttributes *)calculaAttributesAtIndexPath:(NSIndexPath*)indexPath
{
    UICollectionViewLayoutAttributes* attribs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    NSInteger row = indexPath.section / self.numberOfColumns;
    NSInteger column = indexPath.section % self.numberOfColumns;
    CGFloat separacionX = self.collectionView.bounds.size.width - self.itemInsets.left - self.itemInsets.right - (self.numberOfColumns * self.itemSize.width);
    
    if (self.numberOfColumns > 1) separacionX = separacionX / (self.numberOfColumns - 1);
    
    CGFloat x = floorf(self.itemInsets.left + (self.itemSize.width + separacionX) * column);
    CGFloat y = floor(self.itemInsets.top + (self.itemSize.height + self.interItemSpacingY) * row);
    attribs.frame = CGRectMake(x, y, self.itemSize.width, self.itemSize.height);
    attribs.transform3D = CATransform3DMakeRotation(((float)rand()/RAND_MAX)*M_PI/2.0-M_PI/4.0, 0, 0, 1);
    
    return attribs;
}

@end
