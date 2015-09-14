
#import "BRInjector.h"

@interface BRInjector()

@property(nonatomic, strong) NSMutableArray *registeredProtocols;
@property(nonatomic, strong) NSMutableDictionary *protoImplByName;

@end
@implementation BRInjector

- (instancetype)init {
    self = [super init];
    if (self) {
        self.registeredProtocols = [[NSMutableArray alloc] init];
        self.protoImplByName = [[NSMutableDictionary alloc] init];
    }
    return self;
    
}

+ (instancetype)sharedInstance {
    static BRInjector *injector = nil;
    static dispatch_once_t t;
    
    dispatch_once(&t, ^{
        injector = [[BRInjector alloc] init];
    });
    
    return injector;
}

- (void)injectImplOfClass:(Class)klass withProtocol:(Protocol *)protocol {
    if (![klass conformsToProtocol:protocol]) {
        return;
    }
    
    NSString *protoName = NSStringFromProtocol(protocol);
    if (self.protoImplByName[protoName] != nil ) {
        return;
    }
    
    [self.protoImplByName setObject:klass forKey:protoName];
}

- (id)getObject:(Protocol *)protocol {
    Class klass = self.protoImplByName[NSStringFromProtocol(protocol)];
    id instance = [[klass alloc] init];
    
    return instance;
}


@end