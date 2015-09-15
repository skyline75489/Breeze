
#import "CarImpl.h"
#import "BRInjector.h"

@implementation CarImpl

@synthesize engine;
@synthesize dashboard;

-(instancetype)init {
    self = [super init];
    if (self) {
        self.engine = [[BRInjector sharedInstance] getObject:@protocol(EngineProtocol)];
        self.dashboard = [[BRInjector sharedInstance] getObject:@protocol(DashboardProtocol)];

    }
    
    return self;
}

-(void)start
{
    NSLog(@"Starting engine; setting RPM to 1000");
    self.engine.rpm = 1000;
}

-(void)showStatus
{
    [self.dashboard display];
}

- (void)afterPropertiesSet {
    NSLog(@"Car is fully set up and operational!");
    
}
@end
