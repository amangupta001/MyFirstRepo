//
//  SingeltonTest.m
//  
//
//  Created by Apple on 18/10/16.
//
//

#import <XCTest/XCTest.h>
#import "SingletonClass.h"

@interface SingeltonTest : XCTestCase

@end

@implementation SingeltonTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - helper methods

- (SingletonClass *)createUniqueInstance {
    
    return [[SingletonClass alloc] init];
    
}

- (SingletonClass *)getSharedInstance {
    
    return [SingletonClass sharedInstance];
    
}


#pragma mark - tests

- (void)testSingletonSharedInstanceCreated {
    
    XCTAssertNotNil([self getSharedInstance]);
    
}

- (void)testSingletonUniqueInstanceCreated {
    
    XCTAssertNotNil([self createUniqueInstance]);
    
}

- (void)testSingletonReturnsSameSharedInstanceTwice {
    
    SingletonClass *s1 = [self getSharedInstance];
    XCTAssertEqual(s1, [self getSharedInstance]);
    
}

- (void)testSingletonSharedInstanceSeparateFromUniqueInstance {
    
    SingletonClass *s1 = [self getSharedInstance];
    XCTAssertNotEqual(s1, [self createUniqueInstance]);
}

- (void)testSingletonReturnsSeparateUniqueInstances {
    
    SingletonClass *s1 = [self createUniqueInstance];
    XCTAssertNotEqual(s1, [self createUniqueInstance]);
}

@end
