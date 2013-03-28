#ifdef TARGET_OS_MAC
#else
  #import <Foundation/Foundation.h>
#endif

@interface NSArray(ConventionalC)

@property(readonly) id first;
@property(readonly) id last;

-(NSArray*)arrayByRemovingLastObject;
-(NSArray*)arrayByRemovingObject:(id)anObject;

@end
