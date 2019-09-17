//
//  Contato.h
//  AgendaDeContatos
//
//  Created by Gabriella Messias Aleo on 13/09/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Contato : NSObject

//-(void) setNome :(NSString *) novoNome;
//-(NSString *) nome;
//
//-(void) setEndereco :(NSString *) novoEndereco;
//-(NSString *) endereco;
//
//-(void) setTelefone :(NSString *) novoTelefone;
//-(NSString *) telefone;
//
//-(void) setEmail :(NSString *) novoEmail;
//-(NSString *) email;
//
//-(void) setSite :(NSString *) novoSite;
//-(NSString *) site;

@property NSString *nome;
@property NSString *endereco;
@property NSString *telefone;
@property NSString *email;
@property NSString *site;

@end

NS_ASSUME_NONNULL_END
