//
//  AppService.h
//  PortalSebraeMobile
//
//  Created by Bruno Corrêa on 17/09/13.
//  Copyright (c) 2013 Sebrae. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PoderesService : UIViewController{
    
}

+ (NSMutableArray *) getPoderes;

// Parser de JSON
+ (NSMutableArray *) parserJSON :(NSData *) data;

@end
