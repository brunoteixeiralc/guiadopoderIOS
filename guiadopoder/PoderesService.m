//
//  AppService.m
//  PortalSebraeMobile
//
//  Created by Bruno Corrêa on 17/09/13.
//  Copyright (c) 2013 Sebrae. All rights reserved.
//

#import "PoderesService.h"
#import "Poder.h"
#import "SMXMLDocument.h"
#import "SBJson.h"
#import "HttpHelper.h"
#import "Setor.h"
#import "Orgao.h"
#import "Cargo.h"
#import "Funcionario.h"

@implementation PoderesService

+ (NSMutableArray *) getPoderes {
    // URL
    NSString *url = [NSString stringWithFormat:URL_WEB_SERVICE];
    
    // Faz a requisição HTTP
    HttpHelper *http = [[HttpHelper alloc] init];
    
    NSData *data = [http doGet:url];

    // Faz o parser do XML
    NSMutableArray *apps = [self parserJSON:data];
    
    return apps;
}

+ (NSMutableArray *) parserJSON :(NSData *) data {
    
    if(!data || [data length]  == 0) {
        NSLog(@"Nenhum dado encontrado");
        return nil;
    }
    
    // Inicializa o parser de JSON
    SBJsonParser *jsonParser = [SBJsonParser new];
    
    // Carrega o NSData em um NSDictionary
    NSDictionary *json = (NSDictionary *) [jsonParser objectWithData:data];
    
    NSMutableArray * poderes = [[NSMutableArray alloc] init];
    
    // Para cada app
    for (NSDictionary *poderDic in json) {
        
        Poder *poder    = [[Poder alloc] init];
        poder.nome = [poderDic objectForKey:@"nome"];
        poder.setores = [[NSMutableArray alloc]init];
        
        for (NSDictionary *setorDic in [poderDic objectForKey:@"setores"]) {
            Setor *setor = [[Setor alloc] init];
            setor.nome = [setorDic objectForKey:@"nome"];
            setor.orgaos = [[NSMutableArray alloc]init];
            setor.poder = poder.nome;
            
            for (NSDictionary *orgaoDic in [setorDic objectForKey:@"orgaos"]) {
                Orgao *orgao = [[Orgao alloc]init];
                orgao.nome = [orgaoDic objectForKey:@"nome"];
                orgao.endereco = [orgaoDic objectForKey:@"endereco"];
                orgao.endWeb = [orgaoDic objectForKey:@"site"];
                orgao.telefone = [orgaoDic objectForKey:@"telefone"];
                orgao.poder = poder.nome;
                orgao.cargos = [[NSMutableArray alloc]init];
                
                for (NSDictionary *cargoDic in [orgaoDic objectForKey:@"cargos"]) {
                    Cargo *cargo = [[Cargo alloc]init];
                    cargo.nome = [cargoDic objectForKey:@"nome"];
                    cargo.poder = poder.nome;
                    cargo.funcionarios = [[NSMutableArray alloc]init];
                    
                    for (NSDictionary *funcionarioDic in [cargoDic objectForKey:@"funcionarios"]) {
                        Funcionario *funcionario = [[Funcionario alloc]init];
                        funcionario.nome = [funcionarioDic objectForKey:@"nome"];
                        
                        NSString *actDate = [funcionarioDic objectForKey:@"aniversario"];
                        NSDate *date = [NSDate dateWithTimeIntervalSince1970:([actDate doubleValue] / 1000)];
                        NSDateFormatter *dtfrm = [[NSDateFormatter alloc] init];
                        [dtfrm setDateFormat:@"dd/MM"];
                        NSString *nDate = [dtfrm stringFromDate:date];
                        
                        funcionario.aniversario = nDate;
                        funcionario.email = [funcionarioDic objectForKey:@"email"];
                        funcionario.fax = [funcionarioDic objectForKey:@"fax"];
                        funcionario.telefone = [funcionarioDic objectForKey:@"telefone1"];
                        funcionario.telefone2 = [funcionarioDic objectForKey:@"telefone2"];
                        funcionario.telefone3 = [funcionarioDic objectForKey:@"telefone3"];
                        funcionario.complemento = [funcionarioDic objectForKey:@"complemento"];
                        funcionario.poder = poder.nome;
                        
                        [cargo.funcionarios addObject:funcionario];
                        
                    }
                    
                    [orgao.cargos addObject:cargo];
                }
                
            [setor.orgaos addObject:orgao];
            
            }

        [poder.setores addObject:setor];
        
        }

        
        [poderes addObject:poder];
       
        
    }
    // Retorna a lista apps
    return poderes;
    
}


@end
