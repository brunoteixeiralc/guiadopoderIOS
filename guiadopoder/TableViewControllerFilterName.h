//
//  TableViewControllerFilterName.h
//  guiadopoder
//
//  Created by Bruno Corrêa on 30/04/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewControllerFilterName : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) IBOutlet UITableView *filterNameTableView;
@property(nonatomic, strong) IBOutlet UISearchBar *searchBar;

@property(nonatomic,retain) NSMutableArray *funcionarios;
@property(strong, nonatomic) NSMutableArray* filteredTableData;
@property(nonatomic, assign) bool isFiltered;
@property(nonatomic,retain) NSArray *sortedArray;

@end
