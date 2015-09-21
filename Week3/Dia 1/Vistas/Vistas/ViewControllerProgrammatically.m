//
//  ViewControllerProgrammatically.m
//  Vistas
//
//  Created by Ainhoa Calviño Rodriguez on 21/09/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "ViewControllerProgrammatically.h"

@interface ViewControllerProgrammatically ()

@property (nonatomic, strong) UIButton *buttonFirst;
@property (nonatomic, strong) UILabel *labelFirst;
@property (nonatomic, strong) UIButton *buttonSecond;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewControllerProgrammatically

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createSuperView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
