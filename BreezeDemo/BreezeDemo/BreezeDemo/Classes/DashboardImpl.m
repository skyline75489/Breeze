
#import "DashboardImpl.h"
#import "BRInjector.h"

@implementation DashboardImpl

@synthesize engine;

-(instancetype)init{
    self = [super init];
    if (self) {
        self.engine = [[BRInjector sharedInstance] getObject:@protocol(EngineProtocol)];
    }
    
    return self;
}

-(void)display {
    NSLog(@"Readings: %d rpm", self.engine.rpm);
}

@end