//
//  TableViewController.h
//  guiadopoder
//
//  Created by Bruno Corrêa on 22/04/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Orgao.h"

@protocol CustomerDelegate <NSObject>

-(void) didSelectCustomer:(NSInteger *) customer;

@end

@interface TableViewController : UITableViewController

@property(nonatomic,retain) IBOutlet UIImageView *sobre;
@property(nonatomic,retain) IBOutlet UIView *viewExecutivo;
@property(nonatomic,retain) IBOutlet UIView *viewLegislativo;
@property(nonatomic,retain) IBOutlet UIView *viewJudiciario;
@property(nonatomic,retain) IBOutlet UIView *viwEstadual;

@property (nonatomic,retain) id<CustomerDelegate> delegate;

@end
