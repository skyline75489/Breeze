
#import "BRInjector.h"

@interface BRInjector()

@property(nonatomic, strong) NSMutableArray *registeredProtocols;
@property(nonatomic, strong) NSMutableDictionary *protoImplByName;
@property(nonatomic, strong) NSMutableDictionary *instanceCache;

@end

@implementation BRInjector

- (instancetype)init {
    self = [super init];
    if (self) {
        self.registeredProtocols = [[NSMutableArray alloc] init];
        self.protoImplByName = [[NSMutableDictionary alloc] init];
        self.instanceCache = [[NSMutableDictionary alloc] init];
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
    NSString *protoName = NSStringFromProtocol(protocol);
    
    Class klass = self.protoImplByName[protoName];
    id instance = nil;
    if (self.instanceCache[protoName] != nil) {
        instance = self.instanceCache[protoName];
    } else {
        instance = [[klass alloc] init];
        [self.instanceCache setObject:instance forKey:protoName];
    }
    return instance;
}


@end