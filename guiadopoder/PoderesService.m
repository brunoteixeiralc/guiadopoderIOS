//
//  PoderesService.m
//  guiadopoder
//
//  Created by Bruno Corrêa on 22/04/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import "PoderesService.h"
#import "Area.h"
#import "Funcionario.h"
#import "Cargo.h"


@implementation PoderesService


+ (NSMutableArray *) getEstadual {
    
    NSMutableArray *areas = [[NSMutableArray alloc] init];
    
    Area *area = [[Area alloc] init];
    
    [area setPoder:@"Poder Estadual"];
    
    [area setNome:@"Governadoria do estado do Acre - AC"];
    [area setEndereco:@"Avenida Brasil, 402, Centro 69.900-100 Rio Branco/AC"];
    [area setEndWeb:@"http://www.ac.gov.br"];
    [area setTelefone:@""];
    
    Cargo *cargo = [[Cargo alloc]init];
    [cargo setCargo:@"Governador"];
    
    Funcionario *funcionario = [[Funcionario alloc]init];
    [funcionario setNome:@"Sebastião Afonso Viana Macedo Neves"];
    [funcionario setAniversario:@"09/02"];
    [funcionario setEmail:@"gabinete.governador@ac.gov.br"];
    [funcionario setFax:@"3215-2819"];
    
    NSMutableArray *telefones = [[NSMutableArray alloc]init];
    [telefones addObject:@"(68)3215-2880"];
    [telefones addObject:@"(68)3215-2812"];
    
    [funcionario setTelefones:telefones];
    
    NSMutableArray *funcionarios = [[NSMutableArray alloc]init];
    [funcionarios addObject:funcionario];
    
    [cargo setFuncionarios:funcionarios];
    
    Cargo *cargo2 = [[Cargo alloc]init];
    [cargo2 setCargo:@"Vice-Governador"];
    
    Funcionario *funcionario2 = [[Funcionario alloc]init];
    [funcionario2 setNome:@"Carlos César de Messias"];
    [funcionario2 setAniversario:@"05/07"];
    [funcionario2 setEmail:@"vicegovernador@ac.gov.br"];
    [funcionario setFax:@"3224-1929"];
    
    NSMutableArray *telefones2 = [[NSMutableArray alloc]init];
    [telefones2 addObject:@"(68)3224-4345"];
    [telefones2 addObject:@"(68)3224-3364"];
    [telefones2 addObject:@"(68)3224-1602"];
    
    [funcionario2 setTelefones:telefones2];
    
    NSMutableArray *funcionarios2 = [[NSMutableArray alloc]init];
    [funcionarios2 addObject:funcionario2];
    
    [cargo2 setFuncionarios:funcionarios2];
    
    Cargo *cargo3 = [[Cargo alloc]init];
    [cargo3 setCargo:@"Chefe"];

    NSMutableArray *cargos = [[NSMutableArray alloc]init];
    [cargos addObject:cargo];
    [cargos addObject:cargo2];
    [cargos addObject:cargo3];
    
    [area setCargos:cargos];
    
    
    //####################################################################
    
    Area *area1 = [[Area alloc] init];
    
    [area1 setPoder:@"Poder Estadual"];
    
    [area1 setNome:@"Governadoria do estado do Amapá - AP"];
    [area1 setEndereco:@"Palácio dos Sententrião, Rua General Rondon, 259 - Centro 68.906-130 Macapá/AP"];
    [area1 setEndWeb:@"http://www.amapa.gov.br"];
    [area1 setTelefone:@""];
    
    Cargo *cargo4 = [[Cargo alloc]init];
    [cargo4 setCargo:@"Governador"];
    
    Cargo *cargo5 = [[Cargo alloc]init];
    [cargo5 setCargo:@"Vice-Governadora"];
    
    Cargo *cargo6 = [[Cargo alloc]init];
    [cargo6 setCargo:@"Chefe"];
    
    NSMutableArray *cargos1 = [[NSMutableArray alloc]init];
    [cargos1 addObject:cargo4];
    [cargos1 addObject:cargo5];
    [cargos1 addObject:cargo6];
    
    [area1 setCargos:cargos1];

//####################################################################

    
    Area *area2 = [[Area alloc] init];
    
    [area2 setPoder:@"Poder Estadual"];
    
    [area2 setNome:@"Governadoria do estado do Amapá - AP"];
    [area2 setEndereco:@"Palácio dos Sententrião, Rua General Rondon, 259 - Centro 68.906-130 Macapá/AP"];
    [area2 setEndWeb:@"http://www.amapa.gov.br"];
    [area2 setTelefone:@""];
    
    Cargo *cargo7 = [[Cargo alloc]init];
    [cargo7 setCargo:@"Governador"];
    
    Cargo *cargo8 = [[Cargo alloc]init];
    [cargo8 setCargo:@"Vice-Governadora"];
    
    Cargo *cargo9 = [[Cargo alloc]init];
    [cargo9 setCargo:@"Chefe"];
    
    NSMutableArray *cargos2 = [[NSMutableArray alloc]init];
    [cargos2 addObject:cargo7];
    [cargos2 addObject:cargo8];
    [cargos2 addObject:cargo9];
    
    [area2 setCargos:cargos2];
    
    //####################################################################
    
    [areas addObject:area];
    [areas addObject:area1];
    [areas addObject:area2];

    
    return areas;
}

+ (NSMutableArray *) getExecutivo {
    
    NSMutableArray *areas = [[NSMutableArray alloc] init];
    
    Area *area = [[Area alloc] init];
    
    [area setPoder:@"Poder Executivo"];
    
    [area setNome:@"Presidência da República"];
    [area setEndereco:@"Palácio do Planalto - Praça dos Três Poderes - 70.150-900 Brasília/DF"];
    [area setEndWeb:@"http://www.planalto.gov.br"];
    [area setTelefone:@"(61) 3411-1221"];
    
    Cargo *cargo = [[Cargo alloc]init];
    [cargo setCargo:@"Presidenta"];
    
    Funcionario *funcionario = [[Funcionario alloc]init];
    [funcionario setNome:@"Dilma Vana Rousseff"];
    [funcionario setAniversario:@"14/12"];
    [funcionario setEmail:@"gabinetepessoal@planalto.gov.br"];
    [funcionario setFax:@"(61)3411-2222"];
    
    NSMutableArray *telefones = [[NSMutableArray alloc]init];
    [telefones addObject:@"(68)3411-1200"];
    [telefones addObject:@"(68)3411-1201"];
    
    [funcionario setTelefones:telefones];
    
    NSMutableArray *funcionarios = [[NSMutableArray alloc]init];
    [funcionarios addObject:funcionario];
    
    [cargo setFuncionarios:funcionarios];
    
    NSMutableArray *cargos = [[NSMutableArray alloc]init];
    [cargos addObject:cargo];
    
    [area setCargos:cargos];
    
    
    //####################################################################
    
    Area *area1 = [[Area alloc] init];
    
    [area1 setPoder:@"Poder Executivo"];
    
    [area1 setNome:@"Vice Presidência da República"];
    [area1 setEndereco:@"Palácio do Planalto, Anexo II, Térreo 70.083-900 Brasília/DF"];
    [area1 setEndWeb:@"http://www.planalto.gov.br"];
    [area1 setTelefone:@"(61) 3411-1221"];
    
    Cargo *cargo4 = [[Cargo alloc]init];
    [cargo4 setCargo:@"Vice-Presidente"];
    
    NSMutableArray *cargos1 = [[NSMutableArray alloc]init];
    [cargos1 addObject:cargo4];
    
    [area1 setCargos:cargos1];
    
    //####################################################################
    
    
    Area *area2 = [[Area alloc] init];
    
    [area2 setPoder:@"Poder Executivo"];
    
    [area2 setNome:@"Casa Civil da Presidência da República"];
    [area2 setEndereco:@"Palácio do Planalto, 4 andar, Térreo 70.150-900 Brasília/DF"];
    [area2 setEndWeb:@"http://www.planalto.gov.br"];
    [area2 setTelefone:@"(61) 3411-1221"];
    
    Cargo *cargo7 = [[Cargo alloc]init];
    [cargo7 setCargo:@"Ministra de Estado"];
    
    NSMutableArray *cargos2 = [[NSMutableArray alloc]init];
    [cargos2 addObject:cargo7];

    [area2 setCargos:cargos2];
    
    //####################################################################
    
    [areas addObject:area];
    [areas addObject:area1];
    [areas addObject:area2];
    
    
    return areas;
}

+ (NSMutableArray *) getJudiciario {
    
    NSMutableArray *areas = [[NSMutableArray alloc] init];
    
    Area *area = [[Area alloc] init];
    
    [area setPoder:@"Poder Judiciário"];
    
    [area setNome:@"Tribunal de Contas da União - TCU"];
    [area setEndereco:@"SAFS Quadra 4, Lote 1, Edfício Sede, 70.042-900 Brasília/DF"];
    [area setEndWeb:@"http://www.tcu.jus.br"];
    [area setTelefone:@"(61) 3316-7222"];
    
    Cargo *cargo1 = [[Cargo alloc]init];
    [cargo1 setCargo:@"Presidente"];
    
    Cargo *cargo2 = [[Cargo alloc]init];
    [cargo2 setCargo:@"Vice-Presidente"];
    
    Cargo *cargo3 = [[Cargo alloc]init];
    [cargo3 setCargo:@"Ministro"];
    
    
    NSMutableArray *cargos = [[NSMutableArray alloc]init];
    [cargos addObject:cargo1];
    [cargos addObject:cargo2];
    [cargos addObject:cargo3];
    
    [area setCargos:cargos];
    
    
    //####################################################################
    
    Area *area1 = [[Area alloc] init];
    
    [area1 setPoder:@"Poder Judiciário"];
    
    [area1 setNome:@"Supremo Tribunal Federal - STF"];
    [area1 setEndereco:@"Praça dos Três Poderes, 70.175-900 Brasília/DF"];
    [area1 setEndWeb:@"http://www.stf.jus.br"];
    [area1 setTelefone:@"(61) 3217-3000"];
    
    Cargo *cargo4 = [[Cargo alloc]init];
    [cargo4 setCargo:@"Presidente"];
    
    Cargo *cargo5 = [[Cargo alloc]init];
    [cargo5 setCargo:@"Vice-Presidente"];
    
    Cargo *cargo6 = [[Cargo alloc]init];
    [cargo6 setCargo:@"Ministro"];
    
    NSMutableArray *cargos1 = [[NSMutableArray alloc]init];
    [cargos1 addObject:cargo4];
    [cargos1 addObject:cargo5];
    [cargos1 addObject:cargo6];
    
    [area1 setCargos:cargos1];
    
    //####################################################################
    
    
    Area *area2 = [[Area alloc] init];

    [area2 setPoder:@"Poder Judiciário"];
    
    [area2 setNome:@"Superior Tribunal da Justiça - STJ"];
    [area2 setEndereco:@"SAFS Quadra 6, Lote 1, Trecho III, 70.095-900 Brasília/DF"];
    [area2 setEndWeb:@"http://www.stf.jus.br"];
    [area2 setTelefone:@"(61) 3319-8000"];
    
    Cargo *cargo7 = [[Cargo alloc]init];
    [cargo4 setCargo:@"Presidente"];
    
    Cargo *cargo8 = [[Cargo alloc]init];
    [cargo5 setCargo:@"Vice-Presidente"];
    
    Cargo *cargo9 = [[Cargo alloc]init];
    [cargo6 setCargo:@"Ministro"];
    
    NSMutableArray *cargos2 = [[NSMutableArray alloc]init];
    [cargos2 addObject:cargo7];
    [cargos2 addObject:cargo8];
    [cargos2 addObject:cargo9];
    
    [area2 setCargos:cargos2];
    
    //####################################################################
    
    [areas addObject:area];
    [areas addObject:area1];
    [areas addObject:area2];
    
    return areas;
}

+ (NSMutableArray *) getLegislativo {
    
    NSMutableArray *areas = [[NSMutableArray alloc] init];
    
    Area *area = [[Area alloc] init];
    
    [area setPoder:@"Poder Legislativo"];
    
    [area setNome:@"Congresso Nacional"];
    [area setEndereco:@"Palácio do Congresso Nacional, Edifício Principal, Praça dos Três Poderes- 70.160-900 Brasília/DF"];
    [area setEndWeb:@"http://www.senado.gov.br"];
    [area setTelefone:@"(61) 3303-4141"];
    
    Cargo *cargo1 = [[Cargo alloc]init];
    [cargo1 setCargo:@"Presidente"];
    
    Cargo *cargo2 = [[Cargo alloc]init];
    [cargo2 setCargo:@"Primeira Vice-Presidente"];
    
    Cargo *cargo3 = [[Cargo alloc]init];
    [cargo3 setCargo:@"2A Vice-Presidente"];
    
    
    NSMutableArray *cargos = [[NSMutableArray alloc]init];
    [cargos addObject:cargo1];
    [cargos addObject:cargo2];
    [cargos addObject:cargo3];
    
    [area setCargos:cargos];
    
    
    //####################################################################
    
    Area *area1 = [[Area alloc] init];
    
    [area1 setPoder:@"Poder Legislativo"];
    
    [area1 setNome:@"Senado Federal"];
    [area1 setEndereco:@"Palácio do Congresso Nacional, Edifício Principal, Praça dos Três Poderes- 70.165-900 Brasília/DF"];
    [area1 setEndWeb:@"http://www.senado.gov.br"];
    [area1 setTelefone:@"(61) 3303-4141"];
    
    Cargo *cargo4 = [[Cargo alloc]init];
    [cargo4 setCargo:@"Presidente"];
    
    Cargo *cargo5 = [[Cargo alloc]init];
    [cargo5 setCargo:@"Primeira Vice-Presidente"];
    
    Cargo *cargo6 = [[Cargo alloc]init];
    [cargo6 setCargo:@"2A Vice-Presidente"];
    
    NSMutableArray *cargos1 = [[NSMutableArray alloc]init];
    [cargos1 addObject:cargo4];
    [cargos1 addObject:cargo5];
    [cargos1 addObject:cargo6];
    
    [area1 setCargos:cargos1];
    
    //####################################################################
    
    
    Area *area2 = [[Area alloc] init];
    
    [area2 setPoder:@"Poder Legislativo"];
    
    [area2 setNome:@"Câmara dos Deputados"];
    [area2 setEndereco:@"Palácio do Congresso Nacional, Edifício Principal, Praça dos Três Poderes- 70.165-900 Brasília/DF"];
    [area2 setEndWeb:@"http://www.senado.gov.br"];
    [area2 setTelefone:@"(61) 3216-0000"];
    
    Cargo *cargo7 = [[Cargo alloc]init];
    [cargo4 setCargo:@"Presidente"];
    
    Cargo *cargo8 = [[Cargo alloc]init];
    [cargo5 setCargo:@"Vice-Presidente"];
    
    Cargo *cargo9 = [[Cargo alloc]init];
    [cargo6 setCargo:@"Ministro"];
    
    NSMutableArray *cargos2 = [[NSMutableArray alloc]init];
    [cargos2 addObject:cargo7];
    [cargos2 addObject:cargo8];
    [cargos2 addObject:cargo9];
    
    [area2 setCargos:cargos2];
    
    //####################################################################
    
    [areas addObject:area];
    [areas addObject:area1];
    [areas addObject:area2];
    
    return areas;
}

@end
