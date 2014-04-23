//
//  TableViewControllerArea.m
//  guiadopoder
//
//  Created by Bruno Corrêa on 22/04/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import "TableViewControllerArea.h"
#import "TableViewControllerCargo.h"
#import "SWRevealViewController.h"
#import "CustomCell.h"
#import "PoderesService.h"
#import "Area.h"

@interface TableViewControllerArea ()

@property (nonatomic,retain) Area *areaSelecionada;

@end

@implementation TableViewControllerArea

@synthesize areas,areaTableView;


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
    
    areaTableView.delegate = self;
    areaTableView.dataSource = self;
    
    UIBarButtonItem *mainMenuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu.png"] style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = mainMenuButton;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithRed:41.0/255.0 green:128.0/255.0 blue:185.0/255.0 alpha:1];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:41.0/255.0 green:128.0/255.0 blue:185.0/255.0 alpha:1]};
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    if([self.navigationItem.title isEqualToString:@"Poder Executivo"]){

        self.areas = [PoderesService getExecutivo];

    }else if([self.navigationItem.title isEqualToString:@"Poder Judiciário"]){
       
        self.areas = [PoderesService getJudiciario];

        
    }else if([self.navigationItem.title isEqualToString:@"Poder Legislativo"]){

        self.areas = [PoderesService getLegislativo];

    }else{
        
        self.areas = [PoderesService getEstadual];

    }
    
   
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
    
    return [self.areas count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"CustomCell";
    CustomCell *cell = (CustomCell*)[self.areaTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[[NSBundle mainBundle]loadNibNamed:@"CustomCell" owner:self options:nil]objectAtIndex:0];
    }
    
    NSInteger linha = indexPath.row;
    
    Area *area = [areas objectAtIndex:linha];
    
    cell.nome.text = area.nome;
    
    if([area.poder isEqual: @"Poder Executivo"]){
        
        cell.lineColor.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:196.0/255.0 blue:15.0/255.0 alpha:1];
        
    }else if([area.poder isEqual: @"Poder Estadual"]){
        
        cell.lineColor.backgroundColor = [UIColor colorWithRed:52.0/255.0 green:152.0/255.0 blue:219.0/255.0 alpha:1];
        
    }else if([area.poder isEqual: @"Poder Judiciário"]){
        
        cell.lineColor.backgroundColor = [UIColor colorWithRed:192.0/255.0 green:57.0/255.0 blue:43.0/255.0 alpha:1];
        
    }else{
       
        cell.lineColor.backgroundColor = [UIColor colorWithRed:22.0/255.0 green:160.0/255.0 blue:133.0/255.0 alpha:1];
    }
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger linha = indexPath.row;
    
    self.areaSelecionada = [areas objectAtIndex:linha];
    
    [self performSegueWithIdentifier:@"segueToCargo" sender:self];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    TableViewControllerCargo *tableViewCargos = segue.destinationViewController;
    tableViewCargos.cargos = self.areaSelecionada.cargos;
    tableViewCargos.areaSelecionada = self.areaSelecionada;
    
}


@end
