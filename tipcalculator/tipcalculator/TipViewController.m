//
//  TipViewController.m
//  tipcalculator
//
//  Created by Sneha Datla on 9/8/14.
//  Copyright (c) 2014 Sneha Datla. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

- (IBAction)valueChanged:(id)sender;

- (IBAction)onTap:(id)sender;
- (void) updateValues;
- (void) onSettingsButton;
- (void)viewWillAppear:(BOOL)animated;
- (void)viewDidAppear:(BOOL)animated;
- (void)viewWillDisappear:(BOOL)animated;
- (void)viewDidDisappear:(BOOL)animated;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    NSLog(@"view did load");
    
    [super viewDidLoad];
    [self updateValues];
    self.tipControl.selectedSegmentIndex = 0;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
     self.bottomView.alpha = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)valueChanged:(id)sender {
    [self updateValues];
    if(![self.billTextField.text length])
    {
         self.bottomView.alpha = 0;
    }
    else{
        self.bottomView.alpha = 1;
    }
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES ];
    [self updateValues];
}

- (void)updateValues{
    float billAmount = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.20)];
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = billAmount + tipAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void) onSettingsButton{
     [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger indexInt =[defaults integerForKey:@"tipDefault"];
    int index = indexInt;
    self.tipControl.selectedSegmentIndex = index;
    [self updateValues];

}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
    
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
    // Optionally initialize the property to a desired starting value
   /* self.view.alpha = 1;
    [UIView animateWithDuration:0.4 animations:^{
        // This causes first view to fade in and second view to fade out
        self.view.alpha = 0;
    } completion:^(BOOL finished) {
        // Do something here when the animation finishes.
        self.view.alpha = 1;
        self.view.backgroundColor = [[UIColor alloc] initWithRed:0 green:130 blue:130 alpha:1];
    }]; */
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
    
}




@end
