//
//  main.m
//  BreezeDemo
//
//  Created by skyline on 15/9/14.
//  Copyright (c) 2015年 skyline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarProtocol.h"
#import "DashboardProtocol.h"
#import "EngineProtocol.h"

#import "CarImpl.h"
#import "DashboardImpl.h"
#import "EngineImpl.h"

#import "BRInjector.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        [[BRInjector sharedInstance] injectImplOfClass:[CarImpl class] withProtocol:@protocol(CarProtocol)];
        [[BRInjector sharedInstance] injectImplOfClass:[DashboardImpl class] withProtocol:@protocol(DashboardProtocol)];
        [[BRInjector sharedInstance] injectImplOfClass:[EngineImpl class] withProtocol:@protocol(EngineProtocol)];
        
        id<CarProtocol> car = [[BRInjector sharedInstance] getObject:@protocol(CarProtocol)];
        
        [car showStatus];
        [car start];
        [car showStatus];
                
    }
    return 0;
}
