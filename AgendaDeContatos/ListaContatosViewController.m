//
//  ListaContatosViewController.m
//  AgendaDeContatos
//
//  Created by Gabriella Messias Aleo on 13/09/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "Contato.h"

@implementation ListaContatosViewController
-(ListaContatosViewController *) init{
    self = [super init];
    
    UIBarButtonItem *botaoForm = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(exibeFormulario) ];
    
    
    self.navigationItem.rightBarButtonItem = botaoForm;
      self.navigationItem.title = @"Contatos";
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.linhaSelecionada = -1;
    
    self.dao = [ContatoDAO contatoDaoInstance];
    
    
    return self;
}
-(void) exibeFormulario{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *form= [storyboard instantiateViewControllerWithIdentifier:@"Form-Contato"];
    
    form.delegate = self;
    
    
    if(self.contatoSelecionado){
        form.contato = self.contatoSelecionado;
    }
    
    self.contatoSelecionado = nil;
    
    [self.navigationController pushViewController:form animated:YES];
  
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Contato *contato = [self.dao idContato:indexPath.row];
        [self.dao removeContato:contato];
        
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationLeft)];
    }
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.contatoSelecionado = [self.dao idContato:indexPath.row];
    [self exibeFormulario];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dao total];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *identificador = @"Celula";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identificador];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identificador];
    }
    Contato *contato = [self.dao idContato:indexPath.row];
    
    cell.textLabel.text = contato.nome;
    
    return cell;
}
-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}
-(void) contatoAdicionado: (Contato *) contato{
    self.linhaSelecionada = [self.dao indiceDoContato:contato];
    NSString *mensagem = [NSString stringWithFormat:@"Contato %@ foi adicionado com sucesso!", contato.nome];
    UIAlertController *alerta = [UIAlertController alertControllerWithTitle:@"Contato adicionado" message:mensagem preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    
    
    [alerta addAction:ok];
    
    
    [self presentViewController:alerta animated:YES completion:nil ];
    
    
    NSLog(@"Adicionado %@", contato);
}
-(void) contatoEditado: (Contato *) contato{
    self.linhaSelecionada = [self.dao indiceDoContato:contato];
    NSLog(@"Atualizado %@", contato);
}
-(void) viewDidAppear:(BOOL)animated{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.linhaSelecionada inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    self.linhaSelecionada = -1;
}
@end
