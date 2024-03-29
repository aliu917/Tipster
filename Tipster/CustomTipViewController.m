//
//  CustomTipViewController.m
//  Tipster
//
//  Created by aliu18 on 6/25/19.
//  Copyright © 2019 aliu18. All rights reserved.
//

#import "CustomTipViewController.h"

@interface CustomTipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *customTipField;

@end

@implementation CustomTipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //[defaults setBool: NO forKey: @"useCustom"];
    // Do any additional setup after loading the view.
}

- (IBAction)updateUserDefault:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double tip = [self.customTipField.text doubleValue];
    [defaults setDouble: tip / 100 forKey:@"custom_tip_percentage"];
    [defaults setBool: YES forKey: @"useCustom"];
    [defaults synchronize];
    NSLog(@"Updated user defaults.");
    if ([defaults boolForKey:@"useCustom"]) {
        NSLog(@"Now using custom tip.");
    }
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
