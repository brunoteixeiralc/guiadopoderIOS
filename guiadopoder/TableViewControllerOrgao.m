//
//  TableViewControllerArea.m
//  guiadopoder
//
//  Created by Bruno Corrêa on 22/04/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import "TableViewControllerOrgao.h"
#import "TableViewControllerCargo.h"
#import "SWRevealViewController.h"
#import "CustomCell.h"
#import "PoderesService.h"
#import "Orgao.h"
#import "TableViewController.h"
#import "Setor.h"
#import "TableViewcontrollerSetor.h"

@interface TableViewControllerOrgao ()

@property (nonatomic,strong) Orgao *orgaoSelecionada;

@end

@implementation TableViewControllerOrgao{

}

@synthesize orgaos,orgaoTableView,searchBar,filteredTableData,isFiltered;


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

    orgaoTableView.delegate = self;
    orgaoTableView.dataSource = self;
    searchBar.delegate = (id)self;
    
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
        rowCount = orgaos.count;
    
    return rowCount;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"CustomCell";
    CustomCell *cell = (CustomCell*)[self.orgaoTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[[NSBundle mainBundle]loadNibNamed:@"CustomCell" owner:self options:nil]objectAtIndex:0];
    }
    
    NSInteger linha = indexPath.row;
    
    Orgao *orgao;
    
    if(isFiltered)
        orgao = [filteredTableData objectAtIndex:linha];
    else
        orgao = [orgaos objectAtIndex:linha];
    
    cell.nome.text = orgao.nome;
    
    if([orgao.poder isEqual: @"Executivo"]){
        
        cell.lineColor.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:196.0/255.0 blue:15.0/255.0 alpha:1];
        
    }else if([orgao.poder isEqual: @"Estadual"]){
        
        cell.lineColor.backgroundColor = [UIColor colorWithRed:52.0/255.0 green:152.0/255.0 blue:219.0/255.0 alpha:1];
        
    }else if([orgao.poder isEqual: @"Legislativo"]){
        
        cell.lineColor.backgroundColor = [UIColor colorWithRed:22.0/255.0 green:160.0/255.0 blue:133.0/255.0 alpha:1];
        
    }else{
       
        cell.lineColor.backgroundColor = [UIColor colorWithRed:192.0/255.0 green:57.0/255.0 blue:43.0/255.0 alpha:1];
    }
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger linha = indexPath.row;
    
    self.orgaoSelecionada = [orgaos objectAtIndex:linha];
    
    [self performSegueWithIdentifier:@"segueToCargo" sender:self];
    
}

- (IBAction)Back
{
   [self.navigationController popViewControllerAnimated:YES];

}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
     if([segue.identifier isEqual:@"segueToCargo"]){
         UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
         destViewController.title = self.orgaoSelecionada.nome;
    
         TableViewControllerCargo *tableViewCargos = segue.destinationViewController;
         tableViewCargos.cargos = self.orgaoSelecionada.cargos;
         tableViewCargos.orgaoSelecionada = self.orgaoSelecionada;

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
        
        for (Orgao* orgao in orgaos)
        {
            NSRange nameRange = [orgao.nome rangeOfString:text options:NSCaseInsensitiveSearch];
            if(nameRange.location != NSNotFound)
            {
                [filteredTableData addObject:orgao];
            }
        }
    }
    
    [self.orgaoTableView reloadData];
}


@end
