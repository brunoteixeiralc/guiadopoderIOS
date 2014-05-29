//
//  TableViewControllerSetor.m
//  guiadopoder
//
//  Created by Bruno Corrêa on 26/05/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import "TableViewControllerSetor.h"
#import "SWRevealViewController.h"
#import "CustomCell.h"
#import "Setor.h"
#import "TableViewControllerOrgao.h"
#import "SingletonPoder.h"
#import "Poder.h"

@interface TableViewControllerSetor ()

@property (nonatomic,retain) Setor  *setorSelecionada;

@end

@implementation TableViewControllerSetor

@synthesize setores,setorTableView,searchBar,filteredTableData,isFiltered;

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
    
    setorTableView.delegate = self;
    setorTableView.dataSource = self;
    searchBar.delegate = (id)self;
    
    self.setores = [self validarPoder];
    
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
        rowCount = setores.count;
    
    return rowCount;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"CustomCell";
    CustomCell *cell = (CustomCell*)[self.setorTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[[NSBundle mainBundle]loadNibNamed:@"CustomCell" owner:self options:nil]objectAtIndex:0];
    }
    
    NSInteger linha = indexPath.row;
    
    Setor *setor;
    
    if(isFiltered)
        setor = [filteredTableData objectAtIndex:linha];
    else
        setor = [setores objectAtIndex:linha];
    
    cell.nome.text = setor.nome;
    
    if([setor.poder isEqual: @"Executivo"]){
        
        cell.lineColor.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:196.0/255.0 blue:15.0/255.0 alpha:1];
        
    }else if([setor.poder isEqual: @"Estadual"]){
        
        cell.lineColor.backgroundColor = [UIColor colorWithRed:52.0/255.0 green:152.0/255.0 blue:219.0/255.0 alpha:1];
        
    }else if([setor.poder isEqual: @"Legislativo"]){
        
        cell.lineColor.backgroundColor =  [UIColor colorWithRed:22.0/255.0 green:160.0/255.0 blue:133.0/255.0 alpha:1];
        
    }else{
        
        cell.lineColor.backgroundColor = [UIColor colorWithRed:192.0/255.0 green:57.0/255.0 blue:43.0/255.0 alpha:1];
    }
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger linha = indexPath.row;
    
    self.setorSelecionada = [setores objectAtIndex:linha];
    
    [self performSegueWithIdentifier:@"segueToOrgao" sender:self];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
    destViewController.title = self.setorSelecionada.nome;
    
    TableViewControllerOrgao *tableViewOrgaos = segue.destinationViewController;
    tableViewOrgaos.orgaos = self.setorSelecionada.orgaos;
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
        
        for (Setor* setor in setores)
        {
            NSRange nameRange = [setor.nome rangeOfString:text options:NSCaseInsensitiveSearch];
            if(nameRange.location != NSNotFound)
            {
                [filteredTableData addObject:setor];
            }
        }
    }
    
    [self.setorTableView reloadData];
}

-(NSMutableArray*)validarPoder{

    SingletonPoder *poderSingleton = [SingletonPoder sharedManager];

    for (Poder* poder in poderSingleton.mySNRArray){
        if([self.navigationItem.title rangeOfString:poder.nome].location != NSNotFound){
            return poder.setores;
        }
    }

return NULL;

}

@end
