//
//  Transaction.h
//  Created by Bruno Corrêa on 17/09/13.
//  Copyright (c) 2013 Sebrae. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Transacao <NSObject>

- (void) transacaoExecutar;
- (void) transacaoAtualizarInterface;

@end
