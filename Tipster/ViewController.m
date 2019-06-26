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
}

- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    [self.view endEditing:YES];
}

//Editing bill
- (IBAction)onEdit:(id)sender {
    
    double bill = [self.billField.text doubleValue];
    
    NSArray *percentages = @[@(0.15), @(0.2), @(0.22)];
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double useCustom = [defaults boolForKey:@"useCustom"];
    
    if (useCustom) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        tipPercentage = [defaults doubleForKey:@"custom_tip_percentage"];
    }
    
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
