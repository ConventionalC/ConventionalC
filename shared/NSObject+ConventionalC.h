#ifdef TARGET_OS_MAC
#else
  #import <Foundation/Foundation.h>
#endif

@interface NSObject (ConventionalC)

@property(nonatomic, readonly) NSDictionary* asDictionary;
@property(nonatomic, readonly) NSArray* propertyNames;

@end
