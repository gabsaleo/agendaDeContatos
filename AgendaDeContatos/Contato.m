//
//  Contato.m
//  AgendaDeContatos
//
//  Created by Gabriella Messias Aleo on 13/09/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

#import "Contato.h"

@implementation Contato
-(NSString *) description{
    NSString *dados = [NSString stringWithFormat:@"Nome: %@ Endereço: %@ Telefone: %@ E-mail: %@ Site: %@", self.nome, self.endereco, self.telefone, self.email, self.site];
    
    
    
    
    
    
    return dados;
}

@end
