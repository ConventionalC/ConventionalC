#import <SenTestingKit/SenTestingKit.h>
#import "NSArray+ConventionalC.h"

@interface NSArray_ConventionalC_SharedTests : SenTestCase
@end

@implementation NSArray_ConventionalC_SharedTests

-(void)testFirst
{
    id result = @[@1, @2, @3].first;
    STAssertEqualObjects(result, @1, nil);
}

-(void)testLast
{
    id result = @[@1, @2, @3].last;
    STAssertEqualObjects(result, @3, nil);
}

-(void)testArrayByRemovingObjects
{
    id result = [@[@1, @2, @3] arrayByRemovingObject:@2];
    STAssertEqualObjects(result, (@[@1, @3]), nil);
}

-(void)testArrayByRemovingLastObject
{
    id result = [@[@1, @2, @3] arrayByRemovingLastObject];
    STAssertEqualObjects(result, (@[@1, @2]), nil);
}

-(void)testSubarrayFromWithLength
{
    id result = [@[@1, @2, @3] subarrayFrom:1 length:1];
    STAssertEqualObjects(result, (@[@2]), nil);
}

-(void)testSubarrayFrom
{
    id result = [@[@1, @2, @3] subarrayFrom:1];
    STAssertEqualObjects(result, (@[@2, @3]), nil);
}

-(void)testSubarrayTo
{
    id result = [@[@1, @2, @3] subarrayTo:1];
    STAssertEqualObjects(result, (@[@1, @2]), nil);
}

@end
