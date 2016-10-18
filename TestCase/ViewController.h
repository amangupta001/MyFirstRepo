//
//  ViewController.h
//  TestCase
//
//  Created by Apple on 14/10/16.
//  Copyright (c) 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic,strong) IBOutlet UITextField *firstNumberTextField;
@property (nonatomic,strong) IBOutlet UITextField *secondNumberTextField;
@property (nonatomic,strong) IBOutlet UITextField *resultTextField;

@property (nonatomic,strong) IBOutlet UIButton *addButton;
@property (nonatomic,strong) IBOutlet UIButton *resetButton;
@end

