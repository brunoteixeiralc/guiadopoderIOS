//
//  TableViewController.m
//  guiadopoder
//
//  Created by Bruno Corrêa on 22/04/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import "TableViewController.h"
#import "SWRevealViewController.h"
#import "TableViewControllerArea.h"
@interface TableViewController ()


@property (nonatomic, strong) NSArray *menuItems;

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorColor = [UIColor colorWithWhite:0.15f alpha:0.2f];
    
    _menuItems = @[@"poderes",@"executivo", @"legislativo", @"judiciario", @"estadual"];}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.menuItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [self.menuItems objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
    
    // Set the photo if it navigates to the PhotoView
    if ([segue.identifier isEqualToString:@"showExecutivo"]) {
        
         destViewController.title = @"Poder Executivo";
        
    }else if([segue.identifier isEqualToString:@"showLegislativo"]){
        
        destViewController.title = @"Poder Legislativo";
        
    }else if([segue.identifier isEqualToString:@"showJudiciario"]){
        
        destViewController.title = @"Poder Judiciário";
        
    }else{
        
        destViewController.title = @"Poder Estadual";
        
    }
    
    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] ) {
        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
        
        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
            
        UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
        [navController setViewControllers: @[dvc] animated: NO ];
        [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        
        };
        
    }
}


@end
