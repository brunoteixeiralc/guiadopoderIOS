//
//  TableViewControllerCargo.m
//  guiadopoder
//
//  Created by Bruno Corrêa on 22/04/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import "TableViewControllerCargo.h"
#import "TableViewControllerArea.h"
#import "SWRevealViewController.h"
#import "CustomCell.h"
#import "Cargo.h"
#import "ViewControllerFuncionario.h"

@interface TableViewControllerCargo ()

@property(nonatomic,retain) Cargo *cargoSelecionado;

@end

@implementation TableViewControllerCargo

@synthesize cargos,cargoTableView,site,telefone,endereco,areaSelecionada,searchBar,isFiltered,filteredTableData;

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
    searchBar.delegate = (id)self;
    
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] isEqualToString:@"iPhone"] ) {
    
    UIBarButtonItem *mainMenuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu.png"] style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = mainMenuButton;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithRed:41.0/255.0 green:128.0/255.0 blue:185.0/255.0 alpha:1];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:41.0/255.0 green:128.0/255.0 blue:185.0/255.0 alpha:1]};
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Voltar" style: UIBarButtonItemStyleBordered target:self action:@selector(Back)];
    self.navigationItem.rightBarButtonItem = backButton;
        
        // Set the gesture
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    }
    self.site.text = areaSelecionada.endWeb;
    self.telefone.text = areaSelecionada.telefone;
    self.endereco.text = areaSelecionada.endereco;
    
    UITapGestureRecognizer* callGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(call)];
    [self.telefone setUserInteractionEnabled:YES];
    [self.telefone addGestureRecognizer:callGesture];
    
    UITapGestureRecognizer* webSiteGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(webSite)];
    [self.site setUserInteractionEnabled:YES];
    [self.site addGestureRecognizer:webSiteGesture];
    
    
    
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
    
    int rowCount;
    
    if(isFiltered)
        rowCount = filteredTableData.count;
    else
        rowCount = cargos.count;

    
    return rowCount;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"CustomCell";
    CustomCell *cell = (CustomCell*)[self.cargoTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[[NSBundle mainBundle]loadNibNamed:@"CustomCell" owner:self options:nil]objectAtIndex:0];
    }
    
    NSInteger linha = indexPath.row;
    
    Cargo *cargo;
    
    if(isFiltered)
        cargo = [filteredTableData objectAtIndex:linha];
    else
        cargo = [cargos objectAtIndex:linha];
    
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
    
    cargo.poder = self.areaSelecionada.poder;
    
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
    if([segue.identifier isEqual:@"segueToFuncionario"]){
        
        UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
        destViewController.title = self.cargoSelecionado.cargo;
        
        ViewControllerFuncionario *viewFuncionarios = segue.destinationViewController;
        viewFuncionarios.funcionarios = self.cargoSelecionado.funcionarios;
        viewFuncionarios.poder = self.cargoSelecionado.poder;
        viewFuncionarios.areaSelecionada = self.areaSelecionada;
        viewFuncionarios.isFiltroNome = false;
        
    }else{
        
        UINavigationController *destViewControllerBack = (UINavigationController*)segue.destinationViewController;
        destViewControllerBack.title = self.areaSelecionada.poder;
        
    }
   
    

    
}

-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)text{
    
    if(text.length == 0)
    {
        isFiltered = FALSE;
    }
    else
    {
        isFiltered = true;
        filteredTableData = [[NSMutableArray alloc] init];
        
        for (Cargo* cargo in cargos)
        {
            NSRange nameRange = [cargo.cargo rangeOfString:text options:NSCaseInsensitiveSearch];
            if(nameRange.location != NSNotFound)
            {
                [filteredTableData addObject:cargo];
            }
        }
    }
    
    [self.cargoTableView reloadData];
}

- (IBAction)Back
{
   [self performSegueWithIdentifier:@"backToArea" sender:self];
}


-(void)call
{
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] isEqualToString:@"iPhone"] ) {
        NSString *phoneNumber = [@"tel://" stringByAppendingString:self.telefone.text];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    } else {
        UIAlertView *Notpermitted=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Seu aparelho não suporta telefonar" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Notpermitted show];
    }
}

-(void)webSite
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.site.text]];
}

@end
