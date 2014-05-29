//
//  SingletonFuncionarios.m
//  guiadopoder
//
//  Created by Bruno Corrêa on 28/05/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import "SingletonFuncionarios.h"

@implementation SingletonFuncionarios

@synthesize funcionarioArray;

+ (id)sharedManager
{
    static SingletonFuncionarios *sharedMyManager = nil;
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
        
        self-> funcionarioArray = [[NSMutableArray alloc]init];
        
    }
    
    return self;
}


@end
