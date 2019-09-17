//
//  ContatoDAO.m
//  AgendaDeContatos
//
//  Created by Gabriella Messias Aleo on 17/09/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

#import "ContatoDAO.h"

@implementation ContatoDAO
-(id)init{
    self = [super init];
    if(self){
        self.contatos = [NSMutableArray new];
    }
    return self;
}
-(void) adicionaContato:(Contato *)contato{
    [self.contatos addObject:contato];
}
-(NSInteger) total{
    return self.contatos.count;
}
-(Contato *) idContato:(NSInteger) indice{
    return self.contatos [indice];
}
@end
