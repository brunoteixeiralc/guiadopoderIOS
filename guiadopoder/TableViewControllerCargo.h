//
//  TableViewControllerCargo.h
//  guiadopoder
//
//  Created by Bruno Corrêa on 22/04/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import "TableViewController.h"
#import "Orgao.h"

@interface TableViewControllerCargo : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain) IBOutlet UILabel *endereco;
@property(nonatomic,retain) IBOutlet UILabel *telefone;
@property(nonatomic,retain) IBOutlet UILabel *site;
@property(nonatomic, retain) IBOutlet UITableView *cargoTableView;
@property(nonatomic, retain) IBOutlet UISearchBar *searchBar;

@property(strong, nonatomic) NSMutableArray* filteredTableData;
@property(nonatomic, assign) bool isFiltered;
@property(nonatomic,nonatomic) NSMutableArray *cargos;
@property(nonatomic,retain) NSArray *sortedArray;

@property(nonatomic,retain) Orgao *orgaoSelecionada;

@end
