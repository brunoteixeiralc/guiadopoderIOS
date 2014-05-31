//
//  TableViewControllerFilterName.m
//  guiadopoder
//
//  Created by Bruno Corrêa on 30/04/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import "TableViewControllerFilterName.h"
#import "PoderesService.h"
#import "SWRevealViewController.h"
#import "CustomCell.h"
#import "Funcionario.h"
#import "ViewControllerFuncionario.h"
#import "SingletonFuncionarios.h"

@interface TableViewControllerFilterName ()

@property (nonatomic,retain) Funcionario *funcionarioSelecionado;

@end

@implementation TableViewControllerFilterName

@synthesize funcionarios,filterNameTableView,searchBar,filteredTableData,isFiltered,sortedArray;


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
    
    filterNameTableView.delegate = self;
    filterNameTableView.dataSource = self;
    searchBar.delegate = (id)self;
    
    SingletonFuncionarios *singletonFuncionarios = [SingletonFuncionarios sharedManager];
    
    self.funcionarios = [singletonFuncionarios funcionarioArray];
    
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"nome"
                                                 ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    sortedArray = [funcionarios sortedArrayUsingDescriptors:sortDescriptors];
    
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
    CustomCell *cell = (CustomCell*)[self.filterNameTableView dequeueReusableCellWithIdentifier:CellIdentifier];
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
        self.funcionarioSelecionado = [filteredTableData objectAtIndex:linha];
    else
        self.funcionarioSelecionado = [sortedArray objectAtIndex:linha];
        
    [self performSegueWithIdentifier:@"segueToFuncionario" sender:self];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
    destViewController.title = self.funcionarioSelecionado.nome;
    
    ViewControllerFuncionario *viewFuncionarios = segue.destinationViewController;
    viewFuncionarios.funcionarioSelecionada = self.funcionarioSelecionado;
    viewFuncionarios.isFiltroNome = true;
    
    
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
        
        for (Funcionario* func in sortedArray)
        {
            NSRange nameRange = [func.nome rangeOfString:text options:NSCaseInsensitiveSearch];
            if(nameRange.location != NSNotFound)
            {
                [filteredTableData addObject:func];
            }
        }
    }
    
    [self.filterNameTableView reloadData];
}

@end
