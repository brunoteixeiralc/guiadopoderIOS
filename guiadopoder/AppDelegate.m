//
//  AppDelegate.m
//  guiadopoder
//
//  Created by Bruno Corrêa on 21/04/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import "AppDelegate.h"
#import "TableViewController.h"
#import "TableViewControllerOrgao.h"
#import "PoderesService.h"
#import "SingletonPoder.h"
#import "SingletonFuncionarios.h"
#import "Poder.h"
#import "Setor.h"
#import "Orgao.h"
#import "Cargo.h"
#import "Funcionario.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.poderes = [PoderesService getPoderes];
    
    SingletonPoder *singletonPoder = [SingletonPoder sharedManager];
    singletonPoder.mySNRArray = self.poderes;
    
    NSMutableArray *funcionarios = [[NSMutableArray alloc]init];
    
    for (Poder *poder in singletonPoder.mySNRArray) {
        for (Setor *setor in poder.setores) {
            for (Orgao *orgao in setor.orgaos) {
                for (Cargo *cargo in orgao.cargos) {
                    for (Funcionario *funcionario in cargo.funcionarios) {
                        [funcionarios addObject:funcionario];
                    }
                }
            }
        }
    }
    
    SingletonFuncionarios *singletonFuncionarios = [SingletonFuncionarios sharedManager];
    singletonFuncionarios.funcionarioArray = funcionarios;
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    
    
    
}

@end
