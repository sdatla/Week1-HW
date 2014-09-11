//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Sneha Datla on 9/9/14.
//  Copyright (c) 2014 Sneha Datla. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()


@property (weak, nonatomic) IBOutlet UISegmentedControl *tipDefault;
@property (weak, nonatomic) IBOutlet UITextField *defaultTipTextField;


- (IBAction)defaultChange:(id)sender;
- (void)viewWillAppear:(BOOL)animated;
- (void)viewDidAppear:(BOOL)animated;
- (void)viewWillDisappear:(BOOL)animated;
- (void)viewDidDisappear:(BOOL)animated;
@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Settings";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{

    [super viewDidLoad];

        // Do any additional setup after loading the view from its nib.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)defaultChange:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:[self.tipDefault selectedSegmentIndex] forKey:@"tipDefault"];
    [defaults synchronize];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"settingsview will appear");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger indexInt =[defaults integerForKey:@"tipDefault"];
    int index = indexInt;
    self.tipDefault.selectedSegmentIndex = index;
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"settingsview did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"settingsview will disappear");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:[self.tipDefault selectedSegmentIndex] forKey:@"tipDefault"];
    [defaults synchronize];
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"settingsview did disappear");
}

/*- (IBAction)tipDefaultChanged:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:[self.tipDefault selectedSegmentIndex] forKey:@"tipDefault"];
    [defaults synchronize];
    
} */





@end
