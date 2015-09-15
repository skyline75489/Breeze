# Breeze

A minimal [Dependency Injection](https://en.wikipedia.org/wiki/Dependency_injection) framework.

Inject your implementation like this:

```objective-c

#import "BRInjector.h"

[[BRInjector sharedInstance] injectImplOfClass:[EngineImpl class] 
                                  withProtocol:@protocol(EngineProtocol)];

```

Check out the [demo](https://github.com/skyline75489/Breeze/tree/master/BreezeDemo/BreezeDemo/BreezeDemo) for more detail.

