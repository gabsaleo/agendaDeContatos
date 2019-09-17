//
//  ListaContatosViewController.m
//  AgendaDeContatos
//
//  Created by Gabriella Messias Aleo on 13/09/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "ViewController.h"
#import "Contato.h"

@implementation ListaContatosViewController
-(ListaContatosViewController *) init{
    self = [super init];
    
    UIBarButtonItem *botaoForm = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(exibeFormulario) ];
    
    
    self.navigationItem.rightBarButtonItem = botaoForm;
      self.navigationItem.title = @"Contatos";
    self.dao = [ContatoDAO new];
    
    return self;
}
-(void) exibeFormulario{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *form= [storyboard instantiateViewControllerWithIdentifier:@"Form-Contato"];

    form.dao = self.dao;
    
    
    [self.navigationController pushViewController:form animated:YES];
  
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
@end
