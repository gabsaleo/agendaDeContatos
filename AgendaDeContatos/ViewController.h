//
//  ViewController.h
//  AgendaDeContatos
//
//  Created by Gabriella Messias Aleo on 13/09/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDAO.h"

@protocol ViewControllerDelegate <NSObject>

-(void)contatoAdicionado: (Contato *) contato;
-(void)contatoEditado: (Contato *) contato;

@end

@interface ViewController : UIViewController

@property IBOutlet UITextField *nome;
@property IBOutlet UITextField *telefone;
@property IBOutlet UITextField *endereco;
@property IBOutlet UITextField *email;
@property IBOutlet UITextField *site;

@property ContatoDAO *dao;
@property Contato *contato;

@property id<ViewControllerDelegate> delegate;

@end
