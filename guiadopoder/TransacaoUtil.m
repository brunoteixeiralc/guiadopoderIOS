//
//  Created by Bruno Corrêa on 17/09/13.
//  Copyright (c) 2013 Sebrae. All rights reserved.
//

#import "TransacaoUtil.h"

@implementation TransacaoUtil

@synthesize transacao = _transacao;

- (void)inicarTransacao:(NSObject<Transacao> *)transacao {
    self.transacao = transacao;

    if (!queue) {
        queue = [[NSOperationQueue alloc] init];
    }
    
    [queue cancelAllOperations];

    // Dispara o download em uma NSOperation
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] 
                                        initWithTarget:self selector:@selector(executeOnBackground) object:nil];
    [queue addOperation:operation];
}

#pragma mark - transacao
// Executa em uma thread
- (void) executeOnBackground {
    [self.transacao transacaoExecutar];
    
    [self performSelectorOnMainThread:@selector(executeOnUIThread) withObject:nil waitUntilDone:YES];
}
// Executa na thread principal
- (void) executeOnUIThread {
    [self.transacao transacaoAtualizarInterface];
}

@end
