//
//  SingletonClass.m
//  
//
//  Created by Apple on 18/10/16.
//
// Comment Added

#import "SingletonClass.h"

@implementation SingletonClass

+ (instancetype)sharedInstance

{
    static dispatch_once_t onceToken = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&onceToken, ^{
        _sharedObject = [[self alloc] init];

    });
    return _sharedObject;

}

@end
