#import "ConventionalC_Shared.h"

@interface NSArray(ConventionalC)

@property(readonly) id first;
@property(readonly) id last;

-(NSArray*)arrayByRemovingLastObject;
-(NSArray*)arrayByRemovingObject:(id)anObject;

@end
