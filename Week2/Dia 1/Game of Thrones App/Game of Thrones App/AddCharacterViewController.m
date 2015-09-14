//
//  ViewController.m
//  Game of Thrones App
//
//  Created by Ainhoa Calviño Rodriguez on 14/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "AddCharacterViewController.h"
#import "Presented2ViewController.h"

typedef NS_ENUM(NSUInteger, Evilness)
{
    EvilnessGood,
    EvilnessBad,
    EvilnessVeryBad,
    EvilnessTrueEvil
};

static NSUInteger const padding = 8;
static NSUInteger const margin = 10;
static NSUInteger const heightUnit = 40;
static NSUInteger const initialUpperMargin = 40;

@interface AddCharacterViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, assign) CGSize screenSize;
@property (nonatomic, strong) UITextView *biografyTextView;
@property (nonatomic, strong) UISegmentedControl *houseSegmentedControl;
@property (nonatomic, strong) UIButton  *addCharacterButton;
@property (nonatomic, strong) UISlider *sliderEvil;
@property (nonatomic, strong) UISwitch *killSwitch;
@property (nonatomic, strong) UILabel *killLabel;

@end

@implementation AddCharacterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.screenSize = self.view.frame.size;
    [self drawControlls];
}

- (void)drawControlls
{
    [self drawName];
    [self drawBiografy];
    [self drawSegmentedControl];
    [self drawSliderEvil];
    [self drawSwitchKill];
    [self drawAddCharacterButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TextField

- (void)drawName
{
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.text = @"Nombre";
    [self placeView:nameLabel underView:nil withHeightUnits:1];
    
    self.nameTextField = [[UITextField alloc]init];
    self.nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.nameTextField.delegate = self;
    [self placeView:self.nameTextField underView:nameLabel withHeightUnits:1];
}

- (void)addImageNamed:(NSString *)imageName toTextFieldLeftImage:(UITextField * )textField
{
    UIImageView *houseImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    houseImageView.image = [UIImage imageNamed:imageName];
    
    textField.leftView = houseImageView;
    textField.leftViewMode = UITextFieldViewModeAlways;
}

- (void)addEvilness:(Evilness)evilness toTextFieldRightImage:(UITextField * )textField
{
    UILabel *evilnessLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    
    switch (evilness) {
        case EvilnessGood:
            evilnessLabel.text = @"😊";
            break;
        
        case EvilnessBad:
            evilnessLabel.text = @"😑";
            break;
            
        case EvilnessVeryBad:
            evilnessLabel.text = @"😠";
            break;
            
        case EvilnessTrueEvil:
            evilnessLabel.text = @"😡";
            break;
            
        default:
            break;
    }
    
    textField.rightView = evilnessLabel;
    textField.rightViewMode = UITextFieldViewModeAlways;
}

#pragma mark - TextView

- (void)drawBiografy
{
    UILabel *biografyLabel = [[UILabel alloc]init];
    biografyLabel.text = @"Biografía";
    [self placeView:biografyLabel underView:self.nameTextField withHeightUnits:1];

    self.biografyTextView = [[UITextView alloc]init];
    [self showBiografyPlaceHolder];
    self.biografyTextView.delegate = self;
    [self placeView:self.biografyTextView underView:biografyLabel withHeightUnits:3];
}

- (void)showBiografyPlaceHolder
{
    self.biografyTextView.text = @"Escribe la biografía del personaje ...";
    self.biografyTextView.textColor = [UIColor lightGrayColor];
    self.biografyTextView.tag = 0;
}

#pragma mark - SegmentedControl

- (void)drawSegmentedControl
{
    self.houseSegmentedControl = [[UISegmentedControl alloc]initWithItems:@[@"Stark", @"Lannister", @"Targaryen", @"Baratheon", @"Tully"]];
    [self.houseSegmentedControl addTarget:self action:@selector(houseSelected:) forControlEvents:UIControlEventValueChanged];
    [self placeView:self.houseSegmentedControl underView:self.biografyTextView withHeightUnits:1];
}

- (void)houseSelected:(UISegmentedControl *)segmentedControl
{
    switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            [self addImageNamed:@"stark" toTextFieldLeftImage:self.nameTextField];
            break;
            
        case 1:
            [self addImageNamed:@"lannister" toTextFieldLeftImage:self.nameTextField];
            break;
            
        case 2:
            [self addImageNamed:@"targaryen" toTextFieldLeftImage:self.nameTextField];
            break;
            
        case 3:
            [self addImageNamed:@"baratheon" toTextFieldLeftImage:self.nameTextField];
            break;
            
        case 4:
            [self addImageNamed:@"tully" toTextFieldLeftImage:self.nameTextField];
            break;
            
        default:
            break;
    }
    
    [self.view endEditing:YES];
}

#pragma mark - Slider

- (void)drawSliderEvil
{
    UILabel *evilLabel = [[UILabel alloc]init];
    evilLabel.text = @"Evil";
    [self placeView:evilLabel underView:self.houseSegmentedControl withHeightUnits:1];
    
    self.sliderEvil = [[UISlider alloc]init];
    self.sliderEvil.minimumValue = 0;
    self.sliderEvil.maximumValue = 100;
    self.sliderEvil.minimumTrackTintColor = [UIColor redColor];
    self.sliderEvil.maximumTrackTintColor = [UIColor greenColor];
    [self.sliderEvil addTarget:self action:@selector(evilChanged:) forControlEvents:UIControlEventValueChanged];
    [self placeView:self.sliderEvil underView:evilLabel withHeightUnits:1];
}

- (void)evilChanged:(UISlider *)evilSlider
{
    CGFloat evilnessValue = evilSlider.value;
    
    if (evilnessValue >= 0 && evilnessValue < 25) {
        [self addEvilness:EvilnessGood toTextFieldRightImage:self.nameTextField];
    }
    else
    {
        if (evilnessValue >= 25 && evilnessValue < 50) {
            [self addEvilness:EvilnessBad toTextFieldRightImage:self.nameTextField];
        }
        else
        {
            if (evilnessValue >= 50 && evilnessValue < 75) {
                [self addEvilness:EvilnessVeryBad toTextFieldRightImage:self.nameTextField];
            }
            else
            {
                [self addEvilness:EvilnessTrueEvil toTextFieldRightImage:self.nameTextField];
            }
        }
    }
}

#pragma mark - Switch

- (void)drawSwitchKill
{
    UIView *killView = [[UIView alloc]init];
    [self placeView:killView underView:self.sliderEvil withHeightUnits:1];
    self.killSwitch = [[UISwitch alloc]initWithFrame:CGRectZero];
    [killView addSubview:self.killSwitch];
    
    CGFloat labelX = self.killSwitch.frame.origin.x + self.killSwitch.frame.size.width + padding;
    CGFloat widthX = killView.frame.size.width - self.killSwitch.frame.size.width - padding;
    self.killLabel = [[UILabel alloc]initWithFrame:CGRectMake(labelX, self.killSwitch.frame.origin.y, widthX, self.killSwitch.frame.size.height)];
    [self drawDeadOrAlive];
    [killView addSubview:self.killLabel];
    
    [self.killSwitch addTarget:self action:@selector(killChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)killChanged:(UISwitch *)killSwitch
{
    [self drawDeadOrAlive];
}

- (void)drawDeadOrAlive
{
    self.killLabel.text = self.killSwitch.on ? @"Muerto" : @"Vivo";
    self.killLabel.textColor = self.killSwitch.on ? [UIColor redColor] : [UIColor blackColor];
    
//    if (self.killSwitch.on)
//    {
//        self.killLabel.text = @"Muerto";
//        self.killLabel.textColor = [UIColor redColor];
//    }
//    else
//    {
//        self.killLabel.text = @"Vivo";
//        self.killLabel.textColor = [UIColor blackColor];
//    }
}

#pragma mark - Button

- (void)drawAddCharacterButton
{
    self.addCharacterButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.addCharacterButton setTitle:@"Añadir" forState:UIControlStateNormal];
    [self placeView:self.addCharacterButton underView:self.killSwitch.superview withHeightUnits:1];
    [self.addCharacterButton addTarget:self action:@selector(presentNextViewController) forControlEvents:UIControlEventTouchUpInside];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


-(void)presentNextViewController
{
    Presented2ViewController *presentedViewCotroller = [[Presented2ViewController alloc]init];
    [self presentViewController:presentedViewCotroller animated:YES completion:^{
        
    }];
}

#pragma mark - TextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if (textView == self.biografyTextView && textView.tag == 0) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
        textView.tag = 1;
    };
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if (textView == self.biografyTextView && [textView.text length] == 0) {
        [self showBiografyPlaceHolder];
    }
    
    [textView resignFirstResponder];
}

#pragma mark - TextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == self.nameTextField) {
        NSString *nameString = textField.text;
        
        [self.addCharacterButton setTitle:[NSString stringWithFormat:@"Añadir a %@", nameString] forState:UIControlStateNormal];
    }
    
    [textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark - Control Positioning

- (void)placeView:(UIView *)bottomView underView:(UIView *)upperView withHeightUnits:(CGFloat)heightUnits
{
    if (!upperView)
    {
        bottomView.frame = CGRectMake(padding, initialUpperMargin, self.screenSize.width - 2 * padding, heightUnit * heightUnits);
    }
    else
    {
        bottomView.frame = [self frameUnderFrame:upperView.frame withHeightUnits:heightUnits];
    }
    [self.view addSubview:bottomView];
}

- (CGRect)frameUnderFrame:(CGRect)sourceFrame withHeightUnits:(CGFloat)heightUnits
{
    CGFloat y = sourceFrame.origin.y + sourceFrame.size.height + margin;
    return CGRectMake(padding, y, self.screenSize.width - 2 * padding, heightUnit * heightUnits);
}
@end
