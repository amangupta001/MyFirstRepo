//
//  ViewControllerTestCase.m
//  
//
//  Created by Apple on 14/10/16.
//
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"
@interface ViewControllerTestCase : XCTestCase

@end

@implementation ViewControllerTestCase

{
    ViewController *viewControllerVC;

}


- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    viewControllerVC = [storyboard instantiateViewControllerWithIdentifier:
                      @"ViewController"];
    [viewControllerVC view];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testViewControllerViewExists {
    XCTAssertNotNil([viewControllerVC view], @"ViewController should contain a view");
}

-(void)testFirstNumberTextFieldConnection {
    XCTAssertNotNil([viewControllerVC firstNumberTextField], @"firstNumberTextField should be connected");
}

-(void)testFirstNumberTextFieldDelegateConnection {
    XCTAssertTrue([[viewControllerVC firstNumberTextField]delegate], @"firstNumberTextField delegate should be connected");
}

-(void)testSecondNumberTextFieldConnection {
    XCTAssertNotNil([viewControllerVC secondNumberTextField], @"secondNumberTextField should be connected");
}

-(void)testSecondNumberTextFieldDelegateConnection {
    XCTAssertTrue([[viewControllerVC secondNumberTextField]delegate], @"secondNumberTextField delegate should be connected");
}

-(void)testresultTextFieldConnection {
    XCTAssertNotNil([viewControllerVC resultTextField], @"resultTextField should be connected");
}

-(void)testresultTextFieldDelegateConnection {
    XCTAssertTrue([[viewControllerVC resultTextField]delegate], @"resultTextField delegate should be connected");
}



-(void)testAddButtonConnection {
    XCTAssertNotNil([viewControllerVC addButton], @"add button should be connected");
}

-(void)testAddButtonCheckIBAction {
    
    NSArray *actions = [viewControllerVC.addButton actionsForTarget:viewControllerVC
                                                  forControlEvent:UIControlEventTouchUpInside];
    XCTAssertTrue([actions containsObject:@"addNumbers:"], @"");
}

-(void)testAddingTenPlusTwentyShouldBeThirty {
    viewControllerVC.firstNumberTextField.text = @"10";
    viewControllerVC.secondNumberTextField.text = @"20";
    [viewControllerVC.addButton sendActionsForControlEvents: UIControlEventTouchUpInside];
    XCTAssertEqualObjects(viewControllerVC.resultTextField.text,@"30","Result of the textfield should be 30");
}


-(void)testTextFieldFirstValueAndTextFieldSecondDifference {
    viewControllerVC.firstNumberTextField.text = @"10";
    viewControllerVC.secondNumberTextField.text = @"20";
    
    XCTAssertEqualWithAccuracy(viewControllerVC.firstNumberTextField.text.floatValue,viewControllerVC.secondNumberTextField.text.floatValue,10.0);
}



-(void)testResetButtonConnection {
    XCTAssertNotNil([viewControllerVC resetButton], @"reset button should be connected");
}

-(void)testResetButtonCheckIBAction {
    NSArray *actions = [viewControllerVC.resetButton actionsForTarget:viewControllerVC
                                                    forControlEvent:UIControlEventTouchUpInside];
    XCTAssertTrue([actions containsObject:@"resetFields:"], @"");
}

-(void)testResetButtonShouldClearFields {
    viewControllerVC.firstNumberTextField.text = @"10";
    viewControllerVC.secondNumberTextField.text = @"20";
    viewControllerVC.resultTextField.text = @"30";
    [viewControllerVC.resetButton sendActionsForControlEvents: UIControlEventTouchUpInside];
    XCTAssertEqualObjects(viewControllerVC.firstNumberTextField.text, @"", @"FirstNumber textfield should be empty");
    XCTAssertEqualObjects(viewControllerVC.secondNumberTextField.text, @"", @"SecondNumber textfield should be empty");
    XCTAssertEqualObjects(viewControllerVC.resultTextField.text, @"", @"Result textfield should be empty");
}


@end
