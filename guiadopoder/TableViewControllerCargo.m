//
//  TableViewControllerCargo.m
//  guiadopoder
//
//  Created by Bruno Corrêa on 22/04/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import "TableViewControllerCargo.h"
#import "SWRevealViewController.h"
#import "CustomCell.h"
#import "Cargo.h"
#import "ViewControllerFuncionario.h"

@interface TableViewControllerCargo ()

@property(nonatomic,retain) Cargo *cargoSelecionado;

@end

@implementation TableViewControllerCargo

@synthesize cargos,cargoTableView,site,telefone,endereco,areaSelecionada;

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
    
    cargoTableView.delegate = self;
    cargoTableView.dataSource = self;
    
    UIBarButtonItem *mainMenuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu.png"] style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = mainMenuButton;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithRed:41.0/255.0 green:128.0/255.0 blue:185.0/255.0 alpha:1];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:41.0/255.0 green:128.0/255.0 blue:185.0/255.0 alpha:1]};
    
    self.site.text = areaSelecionada.endWeb;
    self.telefone.text = areaSelecionada.telefone;
    self.endereco.text = areaSelecionada.endereco;
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.cargos count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"CustomCell";
    CustomCell *cell = (CustomCell*)[self.cargoTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[[NSBundle mainBundle]loadNibNamed:@"CustomCell" owner:self options:nil]objectAtIndex:0];
    }
    
    NSInteger linha = indexPath.row;
    
    Cargo *cargo = [cargos objectAtIndex:linha];
    
    cell.nome.text = cargo.cargo;
    
    if([self.areaSelecionada.poder isEqual: @"Poder Executivo"]){
        
        cell.lineColor.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:196.0/255.0 blue:15.0/255.0 alpha:1];
        
    }else if([self.areaSelecionada.poder isEqual: @"Poder Estadual"]){
        
        cell.lineColor.backgroundColor = [UIColor colorWithRed:52.0/255.0 green:152.0/255.0 blue:219.0/255.0 alpha:1];
        
    }else if([self.areaSelecionada.poder isEqual: @"Poder Judiciário"]){
        
        cell.lineColor.backgroundColor = [UIColor colorWithRed:192.0/255.0 green:57.0/255.0 blue:43.0/255.0 alpha:1];
        
    }else{
        
        cell.lineColor.backgroundColor = [UIColor colorWithRed:22.0/255.0 green:160.0/255.0 blue:133.0/255.0 alpha:1];
    }
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger linha = indexPath.row;
    
    self.cargoSelecionado = [cargos objectAtIndex:linha];
    
    [self performSegueWithIdentifier:@"segueToFuncionario" sender:self];
    
}



#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    ViewControllerFuncionario *viewFuncionarios = segue.destinationViewController;
    viewFuncionarios.funcionarios = self.cargoSelecionado.funcionarios;

    
}


@end
