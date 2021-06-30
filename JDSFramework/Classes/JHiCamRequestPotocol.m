//
//  JHICamRequestPotocol.m
//  JXWSDKTest
//
//  Created by jiangdesheng on 2019/8/20.
//  Copyright © 2019 jiangdesheng. All rights reserved.
//

#import "JHiCamRequestPotocol.h"

@implementation JHICamRequestPotocol

#pragma mark - Custom
+ (void)CustomRequset:(NSString *)urlPath timeOut:(NSTimeInterval)timeOut{
    NSString* wifiUrl = urlPath;
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    __block NSError *__error = nil;
    __block NSData *__result = nil;
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    NSMutableURLRequest  * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:wifiUrl]];
    [request setHTTPMethod:@"POST"];
    request.timeoutInterval = 10;//timeOut;
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            __error = error;
        }else __result = data;
        
        dispatch_semaphore_signal(semaphore);
    }];
    [task resume];
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    if (__error || __result.length == 0) {
    }
  
   
}

@end
