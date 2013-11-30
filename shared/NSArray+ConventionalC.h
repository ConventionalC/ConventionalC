#import "ConventionalC_Shared.h"

@interface NSArray(ConventionalC)

-(NSArray*)arrayByRemovingLastObject;
-(NSArray*)arrayByRemovingObject:(id)anObject;

// deprecated: Use NSArray(rubyish) -sliced:start length:length
-(NSArray*)subarrayFrom:(NSUInteger)from length:(NSUInteger)length __attribute__((deprecated));

// deprecated: Use NSArray(rubyish) -last:n
-(NSArray*)subarrayFrom:(NSUInteger)from __attribute__((deprecated));

// deprecated: Use NSArray(rubyish) -first:n
-(NSArray*)subarrayTo:(NSUInteger)to __attribute__((deprecated));

@end
