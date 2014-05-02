//
//  TableViewControllerArea.h
//  guiadopoder
//
//  Created by Bruno Corrêa on 22/04/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewControllerArea : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) IBOutlet UITableView *areaTableView;
@property(nonatomic, strong) IBOutlet UISearchBar *searchBar;

@property(nonatomic,retain) NSMutableArray *areas;
@property(strong, nonatomic) NSMutableArray* filteredTableData;
@property(nonatomic, assign) bool isFiltered;


@end
