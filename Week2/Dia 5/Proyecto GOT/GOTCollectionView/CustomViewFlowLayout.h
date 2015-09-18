//
//  CustomViewFlowLayout.h
//  GOTCollectionView
//
//  Created by Ainhoa Calviño Rodriguez on 18/09/15.
//  Copyright (c) 2015 Ricardo Sanchez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic) UIEdgeInsets itemInsets;
@property (nonatomic) CGSize itemSize;
@property (nonatomic) CGFloat interItemSpacingY;
@property (nonatomic) NSInteger numberOfColumns;

@end
