//
//  Area.h
//  guiadopoder
//
//  Created by Bruno Corrêa on 22/04/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Orgao : NSObject


@property(nonatomic,strong) NSString *nome;
@property(nonatomic,strong) NSString *endereco;
@property(nonatomic,strong) NSString *endWeb;
@property(nonatomic,strong) NSString *telefone;
@property(nonatomic,strong) NSMutableArray *cargos;
@property(nonatomic,strong) NSString *poder;

@end
