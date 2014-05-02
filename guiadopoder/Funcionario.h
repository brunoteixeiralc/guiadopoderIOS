//
//  Funcionario.h
//  guiadopoder
//
//  Created by Bruno Corrêa on 22/04/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Funcionario : NSObject

@property(nonatomic,strong) NSString *nome;
@property(nonatomic,strong) NSString *aniversario;
@property(nonatomic,strong) NSString *email;
@property(nonatomic,strong) NSString *fax;
@property(nonatomic,strong) NSMutableArray *telefones;
@property(nonatomic,strong) NSString *poder;

@end
