//
//  ViewControllerFuncionario.h
//  guiadopoder
//
//  Created by Bruno Corrêa on 22/04/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerFuncionario : UIViewController

@property(nonatomic,retain) NSMutableArray *funcionarios;

@property(nonatomic,retain) IBOutlet UILabel *nome;
@property(nonatomic,retain) IBOutlet UILabel *aniversario;
@property(nonatomic,retain) IBOutlet UILabel *telefone;
@property(nonatomic,retain) IBOutlet UILabel *fax;
@property(nonatomic,retain) IBOutlet UILabel *email;
@property(nonatomic,retain) IBOutlet UIView *lineColor;

@end
