//
//  ContatoDAO.h
//  AgendaDeContatos
//
//  Created by Gabriella Messias Aleo on 17/09/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"
NS_ASSUME_NONNULL_BEGIN

@interface ContatoDAO : NSObject
@property NSMutableArray *contatos;
-(void) adicionaContato: (Contato *) contato;
-(NSInteger) total;
-(Contato *) idContato:(NSInteger) indice;

@end

NS_ASSUME_NONNULL_END
