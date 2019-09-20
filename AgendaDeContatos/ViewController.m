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
        UIBarButtonItem *botao = [[UIBarButtonItem alloc] initWithTitle:@"Adicionar" style:UIBarButtonItemStylePlain target:self action:@selector(adiciona)];
        self.navigationItem.rightBarButtonItem = botao;
        self.navigationItem.title = @"Novo contato";
        self.dao = [ContatoDAO contatoDaoInstance];
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.nome.text = self.contato.nome;
    self.telefone.text = self.contato.telefone;
    self.endereco.text = self.contato.endereco;
    self.email.text = self.contato.email;
    self.site.text = self.contato.site;
}
-(void) adiciona{
    Contato *contato = [Contato new];
    contato.nome = self.nome.text;
    contato.endereco = self.endereco.text;
    contato.email = self.email.text;
    contato.telefone = self.telefone.text;
    contato.site = self.site.text;
    
    
    [self.dao adicionaContato:contato];
    NSLog(@"%@", self.dao.contatos);
    
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
