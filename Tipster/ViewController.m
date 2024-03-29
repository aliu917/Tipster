//
//  ViewController.m
//  Tipster
//
//  Created by aliu18 on 6/25/19.
//  Copyright © 2019 aliu18. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *customTipText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double useCustom = [defaults boolForKey:@"useCustom"];
    [defaults setDouble: [self getTipSelected] forKey: @"prevTip"];
    [defaults synchronize];
    
    
    //if (NO) {
    if (useCustom) {
        NSLog(@"Trying to use custom.");
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", [defaults doubleForKey:@"custom_tip_percentage"] * [self.billField.text doubleValue]];
        self.customTipText.text = @"Using custom tip.";
    }
    //}
}

- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    [self.view endEditing:YES];
}

- (double)getTipSelected {
    NSArray *percentages = @[@(0.15), @(0.2), @(0.22)];
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    return tipPercentage;
}

//Editing bill
- (IBAction)onEdit:(id)sender {
    
    double bill = [self.billField.text doubleValue];
    
    double tipPercentage = [self getTipSelected];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double prevTip = [defaults doubleForKey:@"prevTip"];
    if (tipPercentage != prevTip) {
        [defaults setDouble: tipPercentage forKey: @"prevTip"];
        [defaults setBool: NO forKey: @"useCustom"];
        self.customTipText.text = @"Using tip selected.";
        [defaults synchronize];

    }
    
    double useCustom = [defaults boolForKey:@"useCustom"];
    
    //if (NO) {
        if (useCustom) {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            tipPercentage = [defaults doubleForKey:@"custom_tip_percentage"];
        }
    //}
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

- (IBAction)onEditingBegin:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y, self.billField.frame.size.width, self.billField.frame.size.height * 2);
    }];
    
    //[UIView animateWithDuration:1 animations:^{
        //self.tipLabel.alpha = 0;
    //}];
}

- (IBAction)onEditingEnd:(id)sender {
    //CGRect newFrame = self.billField.frame;
    //newFrame.origin.y /= 2;
    
    //[UIView animateWithDuration:0.2 animations:^{
        //self.billField.frame = newFrame;
    //}];
    
    //[UIView animateWithDuration:1 animations:^{
        //self.tipLabel.alpha = 1;
    //}];
    //self.billField.frame = newFrame;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y, self.billField.frame.size.width, self.billField.frame.size.height / 2);
    }];
}

- (IBAction)changeToPounds:(id)sender {
    
}



@end
