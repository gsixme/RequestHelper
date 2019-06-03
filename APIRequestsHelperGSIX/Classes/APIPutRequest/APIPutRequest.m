//
//  APIPutRequest.m
//  GSIX
//
//  Created by Dimitar Stojcev on 6/11/18.
//  Copyright © 2018 GSIX. All rights reserved.
//

#import "APIPutRequest.h"

@implementation APIPutRequest

+(void)put:(NSDictionary *)bodyParameters headerParameters:(NSDictionary *)headerParameters endpointURL:(NSString *)urlPath success:(BlockSuccess)success failed:(BlockFailed)failed{
    [self put:bodyParameters headerParameters:headerParameters endpointURL:urlPath success:success failed:failed timeout:-1];
}
+(void)put:(NSDictionary *)bodyParameters headerParameters:(NSDictionary *)headerParameters endpointURL:(NSString *)urlPath success:(BlockSuccess)success failed:(BlockFailed)failed timeout:(NSInteger)timeout{
    [self put:bodyParameters headerParameters:headerParameters endpointURL:urlPath success:success failed:failed timeout:-1 removeCache:NO];
}
+(void)put:(NSDictionary *)bodyParameters headerParameters:(NSDictionary *)headerParameters endpointURL:(NSString *)urlPath success:(BlockSuccess)success failed:(BlockFailed)failed timeout:(NSInteger)timeout removeCache:(BOOL)removeCache{
    CLog(@"PUT URL: %@",urlPath);
    NSURL *URL = [NSURL URLWithString:urlPath];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    
    for (NSString *key in headerParameters.allKeys) {
        [request addValue:headerParameters[key] forHTTPHeaderField:key];
    }
    
    if (removeCache) {
        request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    }
    
    NSError *jsonError;
    NSData *sendData = [NSJSONSerialization dataWithJSONObject:bodyParameters options:0 error:&jsonError];
    [request setHTTPMethod:@"PUT"];
    [request setHTTPBody:sendData];
    if (timeout > 0) {
        [request setTimeoutInterval:timeout];
    }
    
    CLog(@"PUT BODY PARAMS: %@",bodyParameters);
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    if (removeCache) {
        config.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        config.URLCache = nil;
    }
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if([[NSThread currentThread] isMainThread]){
            [APIRequestHelper errorHandler:error data:data response:response endpointURL:urlPath success:^(NSDictionary *response) {
                success(response);
            } failed:^(NSError *error) {
                failed(error);
            }];
            return;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [APIRequestHelper errorHandler:error data:data response:response endpointURL:urlPath success:^(NSDictionary *response) {
                success(response);
            } failed:^(NSError *error) {
                failed(error);
            }];
        });
    }] resume];
}

@end
