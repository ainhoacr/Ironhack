//
//  ViewController.h
//  Quotes
//
//  Created by Ainhoa Calviño Rodriguez on 09/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) NSArray *myQuotes;
@property (nonatomic, strong) NSMutableArray *movieQuotes;
@property (nonatomic, weak) IBOutlet UITextView *quoteText;
@property (weak, nonatomic) IBOutlet UISegmentedControl *quoteOpt;


@end

