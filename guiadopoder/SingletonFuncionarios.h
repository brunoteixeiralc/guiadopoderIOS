//
//  SingletonFuncionarios.h
//  guiadopoder
//
//  Created by Bruno Corrêa on 28/05/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingletonFuncionarios : NSObject{

NSMutableArray *funcionarioArray;

}

@property (readwrite) NSMutableArray *funcionarioArray;

+ (id)sharedManager;

@end
