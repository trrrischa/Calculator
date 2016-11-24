//
//  ViewController.m
//  Calculator
//
//  Created by Ekaterina on 22.11.16.
//  Copyright © 2016 Ekaterina. All rights reserved.
//

#import "CalculatorViewController.h"
#import "StringCalc.h"


@interface CalculatorViewController ()
@property (weak, nonatomic) IBOutlet UITextField *expressionString;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

- (IBAction)calculateAction:(id)sender;


@end

@implementation CalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculateAction:(id)sender
{
    
    [self.expressionString resignFirstResponder];
    
    NSString* s = self.expressionString.text;
    [self.resultLabel setText:[StringCalc calculateExpression:s]];
    
}


@end
