//
//  TableViewControllerSetor.h
//  guiadopoder
//
//  Created by Bruno Corrêa on 26/05/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewControllerSetor : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) IBOutlet UITableView *setorTableView;
@property(nonatomic, strong) IBOutlet UISearchBar *searchBar;

@property(nonatomic,retain) NSMutableArray *setores;
@property(strong, nonatomic) NSMutableArray* filteredTableData;
@property(nonatomic, assign) bool isFiltered;
@property(nonatomic,retain) NSArray *sortedArray;

@end
