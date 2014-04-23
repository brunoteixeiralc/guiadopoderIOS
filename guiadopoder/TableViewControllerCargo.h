//
//  TableViewControllerCargo.h
//  guiadopoder
//
//  Created by Bruno Corrêa on 22/04/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import "TableViewController.h"
#import "Area.h"

@interface TableViewControllerCargo : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain) NSMutableArray *cargos;

@property(nonatomic,retain) Area *areaSelecionada;

@property(nonatomic,retain) IBOutlet UILabel *endereco;
@property(nonatomic,retain) IBOutlet UILabel *telefone;
@property(nonatomic,retain) IBOutlet UILabel *site;

@property (nonatomic, strong) IBOutlet UITableView *cargoTableView;

@end
