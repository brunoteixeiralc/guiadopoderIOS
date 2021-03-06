//
//  ViewControllerFuncionario.m
//  guiadopoder
//
//  Created by Bruno Corrêa on 22/04/14.
//  Copyright (c) 2014 Bruno. All rights reserved.
//

#import "ViewControllerFuncionario.h"
#import "SWRevealViewController.h"
#import "Funcionario.h"
#import "TableViewControllerCargo.h"
#import "TableViewControllerFilterName.h"
#import "AddressBook/AddressBook.h"
#import "AddressBookUI/AddressBookUI.h"
#import "TableViewControllerFuncionarios.h"

@interface ViewControllerFuncionario ()

@end

@implementation ViewControllerFuncionario

@synthesize nome,aniversario,telefone,fax,email,lineColor,funcionarios,isFiltroNome,funcionarioSelecionada,cargoNome,telefone2,telefone3,complemento;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *mainMenuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu.png"] style:UIBarButtonItemStyleBordered target:self.revealViewController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = mainMenuButton;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithRed:41.0/255.0 green:128.0/255.0 blue:185.0/255.0 alpha:1];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:41.0/255.0 green:128.0/255.0 blue:185.0/255.0 alpha:1]};
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Voltar" style: UIBarButtonItemStyleBordered target:self action:@selector(Back)];
    self.navigationItem.rightBarButtonItem = backButton;

    self.nome.text =funcionarioSelecionada.nome;
    self.aniversario.text = funcionarioSelecionada.aniversario;
    self.telefone.text = funcionarioSelecionada.telefone.length == 0 ? @"-" : funcionarioSelecionada.telefone;
    self.fax.text = funcionarioSelecionada.fax.length == 0 ? @"-" : funcionarioSelecionada.fax;
    self.email.text = funcionarioSelecionada.email;
    self.telefone2.text = funcionarioSelecionada.telefone2.length == 0 ? @"-" : funcionarioSelecionada.telefone2;
    self.telefone3.text = funcionarioSelecionada.telefone3.length == 0 ? @"-" : funcionarioSelecionada.telefone3;
    self.complemento.text = funcionarioSelecionada.complemento.length == 0 ? @"-" : funcionarioSelecionada.complemento;
    
    UITapGestureRecognizer* callGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(call)];
    [self.telefone setUserInteractionEnabled:YES];
    [self.telefone addGestureRecognizer:callGesture];
    
    UITapGestureRecognizer* callGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(call2)];
    [self.telefone2 setUserInteractionEnabled:YES];
    [self.telefone2 addGestureRecognizer:callGesture2];
    
    UITapGestureRecognizer* callGesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(call3)];
    [self.telefone3 setUserInteractionEnabled:YES];
    [self.telefone3 addGestureRecognizer:callGesture3];
    
    if([self.funcionarioSelecionada.poder isEqual: @"Executivo"]){
        
        self.lineColor.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:196.0/255.0 blue:15.0/255.0 alpha:1];
        
    }else if([self.funcionarioSelecionada.poder isEqual: @"Estadual"]){
        
        self.lineColor.backgroundColor = [UIColor colorWithRed:52.0/255.0 green:152.0/255.0 blue:219.0/255.0 alpha:1];
        
    }else if([self.funcionarioSelecionada.poder isEqual: @"Legislativo"]){
        
        self.lineColor.backgroundColor = [UIColor colorWithRed:22.0/255.0 green:160.0/255.0 blue:133.0/255.0 alpha:1];
        
    }else{
        
        self.lineColor.backgroundColor =  [UIColor colorWithRed:192.0/255.0 green:57.0/255.0 blue:43.0/255.0 alpha:1];
   }


    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    UINavigationController *destViewControllerBack = (UINavigationController*)segue.destinationViewController;
    
    if([segue.identifier isEqual:@"backToFuncionarioList"]){
       
        destViewControllerBack.title = self.cargoNome;

    
    }else{
        
        destViewControllerBack.title = @"Buscar por nome";
        
    }
    
    

}

-(void)call
{
    UIDevice *device = [UIDevice currentDevice];
    NSString *tel = self.telefone.text;
    tel = [tel stringByReplacingOccurrencesOfString: @"(" withString: @""];
    tel = [tel stringByReplacingOccurrencesOfString: @")" withString: @""];
    tel= [tel stringByReplacingOccurrencesOfString: @"-" withString: @""];
    tel = [tel stringByReplacingOccurrencesOfString: @" " withString: @""];
    if ([[device model] isEqualToString:@"iPhone"] ) {
        NSString *phoneNumber = [@"tel://" stringByAppendingString:tel];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    } else {
        UIAlertView *Notpermitted=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Seu aparelho não suporta telefonar" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Notpermitted show];
    }

}

-(void)call2
{
    UIDevice *device = [UIDevice currentDevice];
    NSString *tel2 = self.telefone.text;
    tel2 = [tel2 stringByReplacingOccurrencesOfString: @"(" withString: @""];
    tel2 = [tel2 stringByReplacingOccurrencesOfString: @")" withString: @""];
    tel2= [tel2 stringByReplacingOccurrencesOfString: @"-" withString: @""];
    tel2 = [tel2 stringByReplacingOccurrencesOfString: @" " withString: @""];
    if ([[device model] isEqualToString:@"iPhone"] ) {
        NSString *phoneNumber = [@"tel://" stringByAppendingString:tel2];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    } else {
        UIAlertView *Notpermitted=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Seu aparelho não suporta telefonar" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Notpermitted show];
    }
    
}


-(void)call3
{
    UIDevice *device = [UIDevice currentDevice];
    NSString *tel3 = self.telefone.text;
    tel3 = [tel3 stringByReplacingOccurrencesOfString: @"(" withString: @""];
    tel3 = [tel3 stringByReplacingOccurrencesOfString: @")" withString: @""];
    tel3= [tel3 stringByReplacingOccurrencesOfString: @"-" withString: @""];
    tel3 = [tel3 stringByReplacingOccurrencesOfString: @" " withString: @""];
    if ([[device model] isEqualToString:@"iPhone"] ) {
        NSString *phoneNumber = [@"tel://" stringByAppendingString:tel3];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    } else {
        UIAlertView *Notpermitted=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Seu aparelho não suporta telefonar" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Notpermitted show];
    }
    
}



- (IBAction)showEmail:(id)sender {
    
    // Email Subject
    // NSString *emailTitle = @"Test Email";
    // Email Content
    // NSString *messageBody = @"iOS programming is so fun!";
    // To address
    
    NSArray *toRecipents = [NSArray arrayWithObject:self.email.text];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
   // [mc setSubject:emailTitle];
   // [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}



- (IBAction)Back
{
    [self.navigationController popViewControllerAnimated:YES];

}

-(void)scheduleAlarm:(id)sender{
    
    NSCalendar *gregCalendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponent = [gregCalendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit fromDate:[NSDate date]];
    
    [dateComponent setYear:[dateComponent year]];
    [dateComponent setMonth:[self.aniversario.text substringWithRange:NSMakeRange(3, 2)].intValue];
    [dateComponent setDay:[self.aniversario.text substringWithRange:NSMakeRange(0, 2)].intValue];
    [dateComponent setHour:10];
    [dateComponent setMinute:00];
    
    /*[dateComponent setYear:[dateComponent year]];
     [dateComponent setMonth:05];
     [dateComponent setDay:01];
     [dateComponent setHour:00];
     [dateComponent setMinute:35];*/
    
    UIDatePicker *dd = [[UIDatePicker alloc]init];
    [dd setDate:[gregCalendar dateFromComponents:dateComponent]];
    
    UILocalNotification *notificacao = [[UILocalNotification alloc]init];
    [notificacao setAlertBody:[NSString stringWithFormat:@"Hoje é aniversário da %@", self.nome.text]];
    //[notificacao setFireDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    [notificacao setFireDate:dd.date];
    [notificacao setTimeZone:[NSTimeZone defaultTimeZone]];
    [[UIApplication sharedApplication] setScheduledLocalNotifications:[NSArray arrayWithObject:notificacao]];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Guia do Poder" message:@"Aniversário salvo" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil,nil];
    [alert show];
}


-(void)verifyAuthorizationAddContact:(id)sender{
    
    // Request authorization to Address Book
    ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, NULL);
    
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {
        ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error) {
            // First time access has been granted, add the contact
            [self addContact];
        });
    }
    else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized) {
        // The user has previously given access, add the contact
        [self addContact];
    }
    else {
        // The user has previously denied access
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Guia do Poder" message:@"Acesso não permitido dos contatos" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil,nil];
        [alert show];
    }
    
}

-(void)addContact{
    
    CFErrorRef error = NULL;
    NSLog(@"%@", [self description]);
    ABAddressBookRef iPhoneAddressBook = ABAddressBookCreate();
    
    ABRecordRef newPerson = ABPersonCreate();
    
    ABRecordSetValue(newPerson, kABPersonFirstNameProperty, (__bridge CFTypeRef)(nome.text), &error);
    //ABRecordSetValue(newPerson, kABPersonLastNameProperty, @"teste last", &error);
    
    ABMutableMultiValueRef multiPhone =     ABMultiValueCreateMutable(kABMultiStringPropertyType);
    ABMultiValueAddValueAndLabel(multiPhone, (__bridge CFTypeRef)(telefone.text), kABPersonPhoneMainLabel, NULL);
    //ABMultiValueAddValueAndLabel(multiPhone, @"111-111", kABOtherLabel, NULL);
    ABRecordSetValue(newPerson, kABPersonPhoneProperty, multiPhone,nil);
    CFRelease(multiPhone);
    
    ABMutableMultiValueRef multiEmail = ABMultiValueCreateMutable(kABMultiStringPropertyType);
    ABMultiValueAddValueAndLabel(multiEmail, (__bridge CFTypeRef)(email.text), kABHomeLabel, NULL);
    ABRecordSetValue(newPerson, kABPersonEmailProperty, multiEmail, nil);
    CFRelease(multiEmail);
    
    ABAddressBookAddRecord(iPhoneAddressBook, newPerson, &error);
    
    ABAddressBookSave(iPhoneAddressBook, &error);
    CFRelease(newPerson);
    CFRelease(iPhoneAddressBook);
    if (error != NULL)
    {
        CFStringRef errorDesc = CFErrorCopyDescription(error);
        NSLog(@"Contact not saved: %@", errorDesc);
        CFRelease(errorDesc);
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Guia do Poder" message:@"Contato adicionado com sucesso" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil,nil];
        [alert show];
        
    }

}


@end
