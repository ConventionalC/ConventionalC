#import "ConventionalC_Shared.h"

@interface NSArray(ConventionalC)

-(NSArray*)arrayByRemovingLastObject;
-(NSArray*)arrayByRemovingObject:(id)anObject;

-(NSArray*)subarrayFrom:(NSUInteger)from length:(NSUInteger)length;
-(NSArray*)subarrayFrom:(NSUInteger)from;
-(NSArray*)subarrayTo:(NSUInteger)to;

@end
