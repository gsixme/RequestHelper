//
//  APIDeleteRequest.h
//  Grouper
//
//  Created by Dimitar Stojcev on 6/11/18.
//  Copyright © 2018 Bosko Petreski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIRequestHelper.h"

@interface APIDeleteRequest : NSObject

+(void)deleteRequest:(NSDictionary *)bodyParameters headerParameters:(NSDictionary *)headerParameters endpointURL:(NSString *)urlPath success:(BlockSuccess)success failed:(BlockFailed)failed;
+(void)deleteRequest:(NSDictionary *)bodyParameters headerParameters:(NSDictionary *)headerParameters endpointURL:(NSString *)urlPath success:(BlockSuccess)success failed:(BlockFailed)failed timeout:(NSInteger)timeout;

@end
