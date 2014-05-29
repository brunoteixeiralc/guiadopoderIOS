//
//  TableViewControllerArea.h
//  guiadopoder
//
//  Created by Bruno Corrêa on 22/04/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import "TableViewController.h"
#import "Setor.h"

@interface TableViewControllerOrgao : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) IBOutlet UITableView *orgaoTableView;
@property(nonatomic, strong) IBOutlet UISearchBar *searchBar;

@property(nonatomic,retain) NSMutableArray *orgaos;
@property(strong, nonatomic) NSMutableArray* filteredTableData;
@property(nonatomic, assign) bool isFiltered;


@end
