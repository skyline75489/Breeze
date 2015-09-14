
#import <Foundation/Foundation.h>
#import "BRInjectable.h"

@interface BRInjector : NSObject

+ (instancetype)sharedInstance;

- (void)injectImplOfClass:(Class)klass withProtocol:(Protocol *)protocol;
- (id)getObject:(Protocol *)protocol;

@end