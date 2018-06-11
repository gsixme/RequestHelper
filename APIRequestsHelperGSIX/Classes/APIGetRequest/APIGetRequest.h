//
//  APIGetRequest.h
//  Grouper
//
//  Created by Dimitar Stojcev on 6/11/18.
//  Copyright © 2018 Bosko Petreski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIRequestHelper.h"

@interface APIGetRequest : NSObject

+(void)get:(NSDictionary *)headerParameters endpointURL:(NSString *)urlPath success:(BlockSuccess)success failed:(BlockFailed)failed;
+(void)get:(NSDictionary *)headerParameters endpointURL:(NSString *)urlPath success:(BlockSuccess)success failed:(BlockFailed)failed timeout:(NSInteger)timeout;

@end
