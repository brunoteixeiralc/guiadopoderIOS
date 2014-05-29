//
//  ViewControllerFuncionario.h
//  guiadopoder
//
//  Created by Bruno Corrêa on 22/04/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cargo.h"
#import <MessageUI/MessageUI.h>
#import "Funcionario.h"

@interface ViewControllerFuncionario : UIViewController<MFMailComposeViewControllerDelegate>

@property(nonatomic,retain) IBOutlet UILabel *nome;
@property(nonatomic,retain) IBOutlet UILabel *aniversario;
@property(nonatomic,retain) IBOutlet UILabel *telefone;
@property(nonatomic,retain) IBOutlet UILabel *telefone2;
@property(nonatomic,retain) IBOutlet UILabel *telefone3;
@property(nonatomic,retain) IBOutlet UILabel *complemento;
@property(nonatomic,retain) IBOutlet UILabel *fax;
@property(nonatomic,retain) IBOutlet UILabel *email;
@property(nonatomic,retain) IBOutlet UIView *lineColor;

@property(nonatomic,retain) NSMutableArray *funcionarios;
@property(nonatomic,retain) NSString *poder;
@property(nonatomic, assign) bool *isFiltroNome;

@property (nonatomic,retain) Funcionario  *funcionarioSelecionada;
@property(nonatomic,strong) NSString *cargoNome;
@property(nonatomic,retain) Cargo *cargoSelecionado;


- (IBAction)showEmail:(id)sender;

- (IBAction)scheduleAlarm:(id)sender;

- (IBAction)verifyAuthorizationAddContact:(id)sender;

@end
