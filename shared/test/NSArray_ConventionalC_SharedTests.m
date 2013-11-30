#import <XCTest/XCTest.h>
#import "NSArray+ConventionalC.h"

@interface NSArray_ConventionalC_SharedTests : XCTestCase
@end

@implementation NSArray_ConventionalC_SharedTests

-(void)testFirst
{
    id result = @[@1, @2, @3].first;
    XCTAssertEqualObjects(result, @1);
}

-(void)testLast
{
    id result = @[@1, @2, @3].last;
    XCTAssertEqualObjects(result, @3);
}

-(void)testArrayByRemovingObjects
{
    id result = [@[@1, @2, @3] arrayByRemovingObject:@2];
    XCTAssertEqualObjects(result, (@[@1, @3]));
}

-(void)testArrayByRemovingLastObject
{
    id result = [@[@1, @2, @3] arrayByRemovingLastObject];
    XCTAssertEqualObjects(result, (@[@1, @2]));
}

-(void)testSubarrayFromWithLength
{
    id result = [@[@1, @2, @3] subarrayFrom:1 length:1];
    XCTAssertEqualObjects(result, (@[@2]));
}

-(void)testSubarrayFrom
{
    id result = [@[@1, @2, @3] subarrayFrom:1];
    XCTAssertEqualObjects(result, (@[@2, @3]));
}

-(void)testSubarrayTo
{
    id result = [@[@1, @2, @3] subarrayTo:1];
    XCTAssertEqualObjects(result, (@[@1, @2]));
}

@end
