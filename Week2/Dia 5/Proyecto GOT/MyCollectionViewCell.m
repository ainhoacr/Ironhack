//
//  MyCollectionViewCell.m
//  GOTCollectionView
//
//  Created by Ainhoa Calviño Rodriguez on 18/09/15.
//  Copyright (c) 2015 Ricardo Sanchez. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    
    [self personalizeCell];
}

- (void)personalizeCell
{
    self.myImageView.layer.borderWidth = 2.0;
    self.myImageView.layer.borderColor = [[UIColor whiteColor] CGColor];
}

@end
