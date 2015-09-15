
#import <Foundation/Foundation.h>

@interface BRInjector : NSObject

+ (instancetype)sharedInstance;

- (void)injectImplOfClass:(Class)klass withProtocol:(Protocol *)protocol;
- (id)getObject:(Protocol *)protocol;

@end