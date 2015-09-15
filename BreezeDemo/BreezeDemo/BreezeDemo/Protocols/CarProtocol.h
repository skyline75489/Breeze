
#import <Foundation/Foundation.h>
#import "EngineProtocol.h"
#import "DashboardProtocol.h"

@protocol CarProtocol <NSObject>

@property id<EngineProtocol> engine;
@property id<DashboardProtocol> dashboard;

- (void)start;
- (void)showStatus;

@end