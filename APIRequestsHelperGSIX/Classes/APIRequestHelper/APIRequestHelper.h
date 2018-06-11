//
//  APIRequestHelper.h
//  Grouper
//
//  Created by Dimitar Stojcev on 6/11/18.
//  Copyright © 2018 Bosko Petreski. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CLog(FORMAT, ...) fprintf(stderr,"[%s][Line %d]%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

@interface APIRequestHelper : NSObject

typedef void(^BlockSuccess)(NSDictionary *response);
typedef void(^BlockFailed)(NSError *error);

+(void)errorHandler:(NSError *)error data:(NSData *)data response:(NSURLResponse *)response endpointURL:(NSString *)urlPath success:(BlockSuccess)success failed:(BlockFailed)failed;

@end
