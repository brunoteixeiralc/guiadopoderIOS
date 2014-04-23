//
//  ViewControllerFuncionario.m
//  guiadopoder
//
//  Created by Bruno Corrêa on 22/04/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import "ViewControllerFuncionario.h"
#import "SWRevealViewController.h"
#import "Funcionario.h"

@interface ViewControllerFuncionario ()

@end

@implementation ViewControllerFuncionario

@synthesize nome,aniversario,telefone,fax,email,lineColor,funcionarios;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *mainMenuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu.png"] style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = mainMenuButton;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithRed:41.0/255.0 green:128.0/255.0 blue:185.0/255.0 alpha:1];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:41.0/255.0 green:128.0/255.0 blue:185.0/255.0 alpha:1]};
    
    Funcionario *func = [funcionarios objectAtIndex:0];
    NSString *tel = [func.telefones objectAtIndex:0];

    self.nome.text =func.nome;
    self.aniversario.text = func.aniversario;
    self.telefone.text = tel;
    self.fax.text = func.fax;
    self.email.text = func.email;

    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
