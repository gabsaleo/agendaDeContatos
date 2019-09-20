//
//  ListaContatosViewController.h
//  AgendaDeContatos
//
//  Created by Gabriella Messias Aleo on 13/09/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDAO.h"
#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListaContatosViewController : UITableViewController<ViewControllerDelegate>

@property ContatoDAO *dao;
@property Contato *contatoSelecionado;

@property NSInteger linhaSelecionada;

@end

NS_ASSUME_NONNULL_END
