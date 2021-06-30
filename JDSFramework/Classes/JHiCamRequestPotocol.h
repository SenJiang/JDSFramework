//
//  JHICamRequestPotocol.h
//  JXWSDKTest
//
//  Created by jiangdesheng on 2019/8/20.
//  Copyright © 2019 jiangdesheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JHICamRequestPotocol : NSObject

+ (void)CustomRequset:(NSString *)urlPath timeOut:(NSTimeInterval)timeOut;

@end

NS_ASSUME_NONNULL_END
