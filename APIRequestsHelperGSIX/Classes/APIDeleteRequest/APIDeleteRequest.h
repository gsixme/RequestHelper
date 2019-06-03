//
//  APIDeleteRequest.h
//  GSIX
//
//  Created by Dimitar Stojcev on 6/11/18.
//  Copyright © 2018 GSIX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIRequestHelper.h"

@interface APIDeleteRequest : NSObject

+(void)deleteRequest:(NSDictionary *)bodyParameters headerParameters:(NSDictionary *)headerParameters endpointURL:(NSString *)urlPath success:(BlockSuccess)success failed:(BlockFailed)failed;
+(void)deleteRequest:(NSDictionary *)bodyParameters headerParameters:(NSDictionary *)headerParameters endpointURL:(NSString *)urlPath success:(BlockSuccess)success failed:(BlockFailed)failed timeout:(NSInteger)timeout;
+(void)deleteRequest:(NSDictionary *)bodyParameters headerParameters:(NSDictionary *)headerParameters endpointURL:(NSString *)urlPath success:(BlockSuccess)success failed:(BlockFailed)failed timeout:(NSInteger)timeout removeCache:(BOOL)removeCache;

@end
