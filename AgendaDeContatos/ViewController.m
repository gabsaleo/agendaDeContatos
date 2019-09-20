//
//  ViewController.m
//  AgendaDeContatos
//
//  Created by Gabriella Messias Aleo on 13/09/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

#import "ViewController.h"
#import "Contato.h"

@interface ViewController ()

@end

@implementation ViewController


-(id)initWithCoder: (NSCoder *) aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        self.dao = [ContatoDAO contatoDaoInstance];
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *botao = nil;
    if(self.contato){
        self.navigationItem.title = @"Editar contato";
        botao=[[UIBarButtonItem alloc] initWithTitle:@"Alterar" style:UIBarButtonItemStylePlain target:self action:@selector(altera)];
    }else{
        self.navigationItem.title = @"Novo contato";
        botao = [[UIBarButtonItem alloc] initWithTitle:@"Adicionar" style:UIBarButtonItemStylePlain target:self action:@selector(adiciona)];
        
    }
    
    self.navigationItem.rightBarButtonItem = botao;
    
    if(self.contato){
    self.nome.text = self.contato.nome;
    self.telefone.text = self.contato.telefone;
    self.endereco.text = self.contato.endereco;
    self.email.text = self.contato.email;
    self.site.text = self.contato.site;
    }
}
-(void) adiciona{
   self.contato = [Contato new];
    [self pegaDadosDoForm];
    [self.dao adicionaContato:self.contato];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [self.delegate contatoAdicionado: self.contato];
    
}
-(void) altera{
    [self pegaDadosDoForm];
    
    [self.delegate contatoEditado: self.contato];
    
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(void) pegaDadosDoForm{
    self.contato.nome = self.nome.text;
    self.contato.endereco = self.endereco.text;
    self.contato.email = self.email.text;
    self.contato.telefone = self.telefone.text;
    self.contato.site = self.site.text;
}


@end
