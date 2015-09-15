
#import <Foundation/Foundation.h>
#import "EngineProtocol.h"

@protocol DashboardProtocol <NSObject>

@property id<EngineProtocol> engine;

- (void)display;

@end