//
//  HttpHelper.m
//  Created by Bruno Corrêa on 17/09/13.
//  Copyright (c) 2013 Sebrae. All rights reserved.
//

#import "HttpHelper.h"

@implementation HttpHelper

- (NSData *) doGet:(NSString *) url {
    // Cria a request, sem cache e com timeout de 30seg
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:(NSURLRequestReloadIgnoringLocalCacheData) timeoutInterval:30];

	NSHTTPURLResponse* urlResponse = nil;
	
	NSError *error = nil;
	
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
	
//	NSString *xml = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
//    NSLog(@"http sinc: %@", xml);
    
	return data;
}
    
@end
