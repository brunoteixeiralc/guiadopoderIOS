//
//  TableViewControllerCargo.m
//  guiadopoder
//
//  Created by Bruno Corrêa on 22/04/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import "TableViewControllerCargo.h"
#import "TableViewControllerOrgao.h"
#import "TableViewControllerFuncionarios.h"
#import "SWRevealViewController.h"
#import "CustomCell.h"
#import "Cargo.h"
#import "ViewControllerFuncionario.h"
#import "TableViewControllerOrgao.h"

@interface TableViewControllerCargo ()

@property(nonatomic,retain) Cargo *cargoSelecionado;

@end

@implementation TableViewControllerCargo

@synthesize cargos,cargoTableView,site,telefone,endereco,orgaoSelecionada,searchBar,isFiltered,filteredTableData,sortedArray;

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
    
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"nome"
                                                 ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    sortedArray = [cargos sortedArrayUsingDescriptors:sortDescriptors];
    
    UIBarButtonItem *mainMenuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu.png"] style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = mainMenuButton;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithRed:41.0/255.0 green:128.0/255.0 blue:185.0/255.0 alpha:1];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:41.0/255.0 green:128.0/255.0 blue:185.0/255.0 alpha:1]};
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Voltar" style: UIBarButtonItemStyleBordered target:self action:@selector(Back)];
    self.navigationItem.rightBarButtonItem = backButton;
        
        // Set the gesture
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.site.text = orgaoSelecionada.endWeb.length == 0 ? @"-" : orgaoSelecionada.endWeb;
    self.telefone.text = orgaoSelecionada.telefone;
    self.endereco.text = orgaoSelecionada.endereco;
    
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
        rowCount = sortedArray.count;

    
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
        cargo = [sortedArray objectAtIndex:linha];
    
    cell.nome.text = cargo.nome;
    
    if([self.orgaoSelecionada.poder isEqual: @"Executivo"]){
        
        cell.lineColor.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:196.0/255.0 blue:15.0/255.0 alpha:1];
        
    }else if([self.orgaoSelecionada.poder isEqual: @"Estadual"]){
        
        cell.lineColor.backgroundColor = [UIColor colorWithRed:52.0/255.0 green:152.0/255.0 blue:219.0/255.0 alpha:1];
        
    }else if([self.orgaoSelecionada.poder isEqual: @"Legislativo"]){
        
        cell.lineColor.backgroundColor = [UIColor colorWithRed:22.0/255.0 green:160.0/255.0 blue:133.0/255.0 alpha:1];
        
    }else{
        
        cell.lineColor.backgroundColor = [UIColor colorWithRed:192.0/255.0 green:57.0/255.0 blue:43.0/255.0 alpha:1];
    }
    
    cargo.poder = self.orgaoSelecionada.poder;
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger linha = indexPath.row;
    
    if(isFiltered)
        self.cargoSelecionado = [filteredTableData objectAtIndex:linha];
    else
        self.cargoSelecionado = [sortedArray objectAtIndex:linha];
    
    [self performSegueWithIdentifier:@"segueToFuncionarioList" sender:self];
    
}



#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqual:@"segueToFuncionarioList"]){
        
        UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
        destViewController.title = self.cargoSelecionado.nome;
        
        TableViewControllerFuncionarios *tableViewControllerFuncionarios = segue.destinationViewController;
        tableViewControllerFuncionarios.funcionarios = self.cargoSelecionado.funcionarios;
        tableViewControllerFuncionarios.cargoNome = self.cargoSelecionado.nome;
        
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
        
        for (Cargo* cargo in sortedArray)
        {
            NSRange nameRange = [cargo.nome rangeOfString:text options:NSCaseInsensitiveSearch];
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
    [self.navigationController popViewControllerAnimated:YES];

}


-(void)call
{
    UIDevice *device = [UIDevice currentDevice];
    NSString *tel = self.telefone.text;
    tel = [tel stringByReplacingOccurrencesOfString: @"(" withString: @""];
    tel = [tel stringByReplacingOccurrencesOfString: @")" withString: @""];
    tel= [tel stringByReplacingOccurrencesOfString: @"-" withString: @""];
    tel = [tel stringByReplacingOccurrencesOfString: @" " withString: @""];
    if ([[device model] isEqualToString:@"iPhone"] ) {
        NSString *phoneNumber = [@"tel://" stringByAppendingString:tel];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    } else {
        UIAlertView *Notpermitted=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Seu aparelho não suporta telefonar" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Notpermitted show];
    }
}

-(void)webSite
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat: @"http://%@",self.site.text]]];
}

@end
