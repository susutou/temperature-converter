//
//  MainViewController.m
//  temperature-converter
//
//  Created by Susen Zhao on 7/25/13.
//  Copyright (c) 2013 Susen Zhao. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

- (void)updateValues;
- (void)updateLabels;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temperature Converter";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.srcTextField.delegate = (id)self;
    
    self.modeSegmentedControl.selectedSegmentIndex = 0;
    [self.convertButton addTarget:self action:@selector(updateValues) forControlEvents:UIControlEventTouchUpInside];
    [self.modeSegmentedControl addTarget:self action:@selector(updateLabels) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarnin
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneButton)];
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = nil;
//    [self updateValues];
    
    return YES;
}

#pragma mark - Public methods

- (void)onDoneButton {
    [self.view endEditing:YES];
    if ([self.srcTextField.text length] == 0) {
        self.srcTextField.text = [NSString stringWithFormat:@"%0.2f", 0.0];
    }
    [self updateValues];
}

- (void)updateLabels {
    switch (self.modeSegmentedControl.selectedSegmentIndex) {
        case 0:
            // C to F
            self.srcLabel.text = @"Celsius (°C)";
            self.destLabel.text = @"Fahrenheit (°F)";
            break;
        case 1:
            // F to C
            self.destLabel.text = @"Celsius (°C)";
            self.srcLabel.text = @"Fahrenheit (°F)";
            break;
        default:
            break;
    }
    [self updateValues];
}

- (void)updateValues {
    
    float celsius = 0.0;
    float fahrenheit = 0.0;
    
    switch (self.modeSegmentedControl.selectedSegmentIndex) {
        case 0:
            // C to F
            celsius = [self.srcTextField.text floatValue];
            if (celsius < -273.15) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Freezing Cold!" message:@"Please input a valid Celsius temperature." delegate:nil cancelButtonTitle:@"Got it" otherButtonTitles:nil, nil];
                [alert show];
            } else {
                fahrenheit = celsius * 1.8 + 32.0;
                self.destTextField.text = [NSString stringWithFormat:@"%0.2f", fahrenheit];
            }
            break;
        case 1:
            // F to C
            fahrenheit = [self.srcTextField.text floatValue];
            if (fahrenheit < -459.67) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Freezing Cold!" message:@"Please input a valid Fahrenheit temperatre." delegate:nil cancelButtonTitle:@"Got it" otherButtonTitles:nil, nil];
                [alert show];
            } else {
                celsius = (fahrenheit - 32.0) / 1.8;
                self.destTextField.text = [NSString stringWithFormat:@"%0.2f", celsius];
            }
            break;
        default:
            break;
    }
}

@end