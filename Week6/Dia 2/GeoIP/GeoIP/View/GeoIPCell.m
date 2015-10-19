//
//  GeoIPCell.m
//  GeoIP
//
//  Created by Ainhoa Calviño Rodriguez on 13/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "GeoIPCell.h"

@interface GeoIPCell ()

@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UILabel *ipLabel;

@end

@implementation GeoIPCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setGeoIP:(GeoIP *)geoIP {
    self.countryLabel.text = geoIP.country;
    self.ipLabel.text = geoIP.ip;
}

@end
