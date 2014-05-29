//
//  SingletonApp.h
//  portalMobileSebrae
//
//  Created by Bruno Corrêa on 21/09/13.
//  Copyright (c) 2013 Sebrae. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingletonPoder : NSObject{

NSMutableArray *mySNRArray;

}

@property (readwrite) NSMutableArray *mySNRArray;

+ (id)sharedManager;

@end
