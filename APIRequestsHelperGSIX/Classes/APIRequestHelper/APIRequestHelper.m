//
//  APIRequestHelper.m
//  Grouper
//
//  Created by Dimitar Stojcev on 6/11/18.
//  Copyright © 2018 GSIX. All rights reserved.
//

#import "APIRequestHelper.h"

@implementation APIRequestHelper

+(void)errorHandler:(NSError *)error data:(NSData *)data response:(NSURLResponse *)response endpointURL:(NSString *)urlPath success:(BlockSuccess)success failed:(BlockFailed)failed{
    if (error || !data) {
        NSError *dataError = [NSError errorWithDomain:NSURLErrorDomain code:500 userInfo:@{@"NSLocalizedDescription": @"Data is nil."}];
        failed(error ? : dataError);
        return;
    }
    
    NSDictionary *dictReturn = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    if (dictReturn) {
        success(dictReturn);
        return;
    }
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
    CLog(@"Method: [%@] HTTP CODE: %d  BODY:%@",urlPath,(int)httpResponse.statusCode,[NSString.alloc initWithData:data encoding:NSUTF8StringEncoding]);
    NSError *jsonObjError = [NSError errorWithDomain:NSURLErrorDomain code:(int)httpResponse.statusCode userInfo:@{@"NSLocalizedDescription": @"The data is not a valid json object."}];
    failed(jsonObjError);
}

@end
