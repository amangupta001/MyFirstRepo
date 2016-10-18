//
//  ViewController.m
//  TestCase
//
//  Created by Apple on 14/10/16.
//  Copyright (c) 2016 Apple. All rights reserved.
//

#import "ViewController.h"
#import "TestAddition.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)addNumbers:(id)sender {
    TestAddition *addition = [[TestAddition alloc] init];
    NSInteger result = [addition addNumberOne:[self.firstNumberTextField.text integerValue]  withNumberTwo:[self.secondNumberTextField.text integerValue]];
    self.resultTextField.text = [NSString stringWithFormat:@"%d",result];
}

-(IBAction)resetFields:(id)sender {
    self.firstNumberTextField.text = @"";
    self.secondNumberTextField.text = @"";
    self.resultTextField.text = @"";
}


@end
