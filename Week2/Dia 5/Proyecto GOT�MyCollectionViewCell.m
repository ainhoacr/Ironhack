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
    self.myImageView.layer.borderWidth = 3.0;
    self.myImageView.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.myImageView.clipsToBounds = YES;
    self.myImageView.layer.cornerRadius = 10;
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    if (selected) {
        self.myImageView.alpha = 0.3;
    }
    else
    {
        self.myImageView.alpha = 1;
    }
}

@end
