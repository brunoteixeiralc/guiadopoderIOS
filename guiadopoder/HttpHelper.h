//
//  HttpHelper.h
//  Created by Bruno Corrêa on 17/09/13.
//  Copyright (c) 2013 Sebrae. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpHelper : NSObject
{

}
- (NSData *) doGet:(NSString *) url;
@end
