//
//  ViewController.m
//  Quotes
//
//  Created by Ainhoa Calviño Rodriguez on 09/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myQuotes = @[@"Frankly my dear, I don't give a dam.", @"Here's looking at you kid.", @"There's no place like home.", @"Play it again sam.", @"Elementary my dear Watson.", @"Fasten your seatbelts. It's going to be a bumpy night.", @"I have not the pleasure of understanding you.", @"O Romeo, Romeo! wherefore art thou Romeo?"];
    
    NSString *quotesListPath = [[NSBundle mainBundle] pathForResource:@"quotes" ofType:@"plist"];
    self.movieQuotes = [[NSMutableArray alloc] initWithContentsOfFile:quotesListPath];
    NSLog(@"%@", self.movieQuotes);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)quoteButtonTapped:(UIButton *)quoteButton
{
    NSString *result;
    
    switch (self.quoteOpt.selectedSegmentIndex) {
        case 0:
        case 1:
            
            result =[self quoteFromFilter:[self.quoteOpt titleForSegmentAtIndex:self.quoteOpt.selectedSegmentIndex]];
            
            break;
        case 2:
        {
            NSUInteger numberQuotes = self.myQuotes.count;
            u_int32_t randomIndex = arc4random_uniform((u_int32_t)numberQuotes);
            result = self.myQuotes[randomIndex];

            break;
        }
        default:
            break;
    }
    
    
    self.quoteText.text = result;
    
}

- (NSString *)quoteFromFilter: (NSString *)filter
{
    NSMutableArray *filterQuote = [[NSMutableArray alloc]init];
    
    for (NSDictionary *item in self.movieQuotes) {
       
        NSString *category = item[@"category"];
        
        if ([category isEqualToString: filter]) {
            [filterQuote addObject:item];
        }
    }

    NSUInteger numberQuotes = filterQuote.count;
    u_int32_t randomIndex = arc4random_uniform((u_int32_t)numberQuotes);
    NSDictionary *randomItem = filterQuote[randomIndex];
   
    NSString *result;
    
    if (![[randomItem objectForKey:@"source"] isEqualToString:@""]) {
        result = [NSString stringWithFormat:@"%@\n\n(%@)", randomItem[@"quote"], randomItem[@"source"] ];
    }
    else
    {
        result = randomItem[@"quote"];
    }
    
   
    return result;
    
}
@end
