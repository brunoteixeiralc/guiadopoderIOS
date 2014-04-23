//
//  TableViewControllerArea.h
//  guiadopoder
//
//  Created by Bruno Corrêa on 22/04/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewControllerArea : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,retain) NSMutableArray *areas;

@property (nonatomic, strong) IBOutlet UITableView *areaTableView;



@end
