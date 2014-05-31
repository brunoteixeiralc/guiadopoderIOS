//
//  TableViewFuncionarios.h
//  guiadopoder
//
//  Created by Bruno Corrêa on 26/05/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import "ViewController.h"

@interface TableViewControllerFuncionarios : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) IBOutlet UITableView *funcionarioTableView;
@property(nonatomic, strong) IBOutlet UISearchBar *searchBar;

@property(nonatomic,strong) NSMutableArray *funcionarios;
@property(nonatomic,strong) NSString *cargoNome;
@property(strong, nonatomic) NSMutableArray* filteredTableData;
@property(strong, nonatomic) NSArray* sortedArray;
@property(nonatomic, assign) bool isFiltered;

@end
