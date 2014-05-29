//
//  TransactionManager.h

//  Created by Bruno Corrêa on 17/09/13.
//  Copyright (c) 2013 Sebrae. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Transacao.h"

@interface TransacaoUtil : NSObject
{
    NSOperationQueue *queue;
}
- (void)inicarTransacao:(NSObject<Transacao> *)transacao;
@property (nonatomic, strong) NSObject<Transacao> * transacao;
@end
