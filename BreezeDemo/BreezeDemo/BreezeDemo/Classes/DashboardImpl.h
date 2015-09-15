
#import <Foundation/Foundation.h>
#import "DashboardProtocol.h"
#import "EngineProtocol.h"

@interface DashboardImpl : NSObject<DashboardProtocol>

@property id<EngineProtocol> engine;

@end