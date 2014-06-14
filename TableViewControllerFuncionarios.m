//
//  TableViewFuncionarios.m
//  guiadopoder
//
//  Created by Bruno Corrêa on 26/05/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import "TableViewControllerFuncionarios.h"
#import "SWRevealViewController.h"
#import "CustomCell.h"
#import "Funcionario.h"
#import "ViewControllerFuncionario.h"


@interface TableViewControllerFuncionarios ()

@property (nonatomic,retain) Funcionario  *funcionarioSelecionada;

@end

@implementation TableViewControllerFuncionarios

@synthesize funcionarios,funcionarioTableView,searchBar,filteredTableData,isFiltered,cargoNome,sortedArray;


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
    
    funcionarioTableView.delegate = self;
    funcionarioTableView.dataSource = self;
    searchBar.delegate = (id)self;
    
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"nome"
                                                 ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    sortedArray = [funcionarios sortedArrayUsingDescriptors:sortDescriptors];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Voltar" style: UIBarButtonItemStyleBordered target:self action:@selector(Back)];
    self.navigationItem.rightBarButtonItem = backButton;
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    UIBarButtonItem *mainMenuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu.png"] style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = mainMenuButton;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithRed:41.0/255.0 green:128.0/255.0 blue:185.0/255.0 alpha:1];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:41.0/255.0 green:128.0/255.0 blue:185.0/255.0 alpha:1]};
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
    CustomCell *cell = (CustomCell*)[self.funcionarioTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[[NSBundle mainBundle]loadNibNamed:@"CustomCell" owner:self options:nil]objectAtIndex:0];
    }
    
    NSInteger linha = indexPath.row;
    
     Funcionario *funcionario;
    
    if(isFiltered)
        funcionario = [filteredTableData objectAtIndex:linha];
    else
        funcionario = [sortedArray objectAtIndex:linha];
    
    cell.nome.text = funcionario.nome;
    
    if([funcionario.poder isEqual: @"Executivo"]){
        
        cell.lineColor.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:196.0/255.0 blue:15.0/255.0 alpha:1];
        
    }else if([funcionario.poder isEqual: @"Estadual"]){
        
        cell.lineColor.backgroundColor = [UIColor colorWithRed:52.0/255.0 green:152.0/255.0 blue:219.0/255.0 alpha:1];
        
    }else if([funcionario.poder isEqual: @"Legislativo"]){
        
        cell.lineColor.backgroundColor = [UIColor colorWithRed:22.0/255.0 green:160.0/255.0 blue:133.0/255.0 alpha:1];
        
    }else{
        
        cell.lineColor.backgroundColor = [UIColor colorWithRed:192.0/255.0 green:57.0/255.0 blue:43.0/255.0 alpha:1];
    }
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger linha = indexPath.row;
    
    if(isFiltered)
        self.funcionarioSelecionada = [filteredTableData objectAtIndex:linha];
    else
        self.funcionarioSelecionada = [sortedArray objectAtIndex:linha];
    
    [self performSegueWithIdentifier:@"segueToFuncionario" sender:self];
    
}

- (IBAction)Back
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqual:@"segueToFuncionario"]){
        
        UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
        destViewController.title = self.funcionarioSelecionada.nome;
        
        ViewControllerFuncionario *viewFuncionario = segue.destinationViewController;
        viewFuncionario.funcionarioSelecionada = self.funcionarioSelecionada;
        viewFuncionario.isFiltroNome = false;
        
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
        
        for (Funcionario* funcionario in sortedArray)
        {
            NSRange nameRange = [funcionario.nome rangeOfString:text options:NSCaseInsensitiveSearch];
            if(nameRange.location != NSNotFound)
            {
                [filteredTableData addObject:funcionario];
            }
        }
    }
    
    [self.funcionarioTableView reloadData];
}
@end
