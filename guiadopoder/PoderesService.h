//
//  PoderesService.h
//  guiadopoder
//
//  Created by Bruno Corrêa on 22/04/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PoderesService : NSObject

+ (NSMutableArray *) getLegislativo;

+ (NSMutableArray *) getExecutivo;

+ (NSMutableArray *) getJudiciario;

+ (NSMutableArray *) getEstadual;

@end
