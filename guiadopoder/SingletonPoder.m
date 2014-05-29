//
//  SingletonApp.m
//  portalMobileSebrae
//
//  Created by Bruno Corrêa on 21/09/13.
//  Copyright (c) 2013 Sebrae. All rights reserved.
//

#import "SingletonPoder.h"

@implementation SingletonPoder


@synthesize mySNRArray;

+ (id)sharedManager
{
    static SingletonPoder *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      
                      sharedMyManager = [[self alloc] init];
                      
                  });
    
    return sharedMyManager;
}

- (id)init
{
    if (self = [super init])
    {
        
        self-> mySNRArray = [[NSMutableArray alloc]init];
        
    }
    
    return self;
}


@end
