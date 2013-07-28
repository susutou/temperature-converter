//
//  MainViewController.h
//  temperature-converter
//
//  Created by Susen Zhao on 7/25/13.
//  Copyright (c) 2013 Susen Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *srcLabel;
@property (nonatomic, weak) IBOutlet UILabel *destLabel;
@property (nonatomic, weak) IBOutlet UITextField *srcTextField;
@property (nonatomic, weak) IBOutlet UITextField *destTextField;
@property (nonatomic, weak) IBOutlet UIButton *convertButton;
@property (nonatomic, weak) IBOutlet UISegmentedControl *modeSegmentedControl;

- (IBAction)onDoneButton;

@end
