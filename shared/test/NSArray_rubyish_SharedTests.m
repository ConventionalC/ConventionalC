#import "NSArray+rubyish.h"
#import <SenTestingKit/SenTestingKit.h>

@interface NSArray_rubyish_SharedTests:SenTestCase
@end

@interface NSArray_rubyish_SharedTests()
  @property(retain) NSArray* abc;
  @property(retain) NSArray* empty;
@end

@implementation NSArray_rubyish_SharedTests

@synthesize abc, empty;

-(void)setUp
{
    [super setUp];
    self.abc = [NSArray arrayWithObjects:@"a", @"b", @"c", nil];
    self.empty = [NSArray arrayWithObjects: nil];
}

-(void)testNewWithSizeAndObject
{
    id object = @"object";
    NSArray* array;
    STAssertNoThrow(array = [NSArray newWithSize:3 object:object], nil);
    STAssertNotNil(array, nil);
    STAssertTrue(3 == array.count, nil);
    for(id o in array)
        STAssertEquals(object, o, @"Object should match original object");
}

-(void)testNewWithSize
{
    NSArray* array;
    STAssertNoThrow(array = [NSArray newWithSize:3], nil);
    STAssertNotNil(array, nil);
    STAssertTrue(3 == array.count, nil);
    for(id o in array)
        STAssertEqualObjects(o, NSNull.null, @"Object should be NSNull");
}

-(void)testNewWithSizeAndBlock
{
    NSArray* array;
    STAssertNoThrow(array = [NSArray newWithSize:3 block:(id)^(int i){ return [NSNumber numberWithInt:i]; }], nil);
    STAssertNotNil(array, nil);
    STAssertTrue(3 == array.count, nil);
    for(int i=0; i<3; i++)
        STAssertEqualObjects([array objectAtIndex:i], [NSNumber numberWithInt:i], @"Object should match original object");
}

-(void)testAt
{
    STAssertEqualObjects([self.abc at:0], @"a", nil);
    STAssertEqualObjects([self.abc at:1], @"b", nil);
    STAssertEqualObjects([self.abc at:2], @"c", nil);
    STAssertNil([self.abc at:3], nil);
}

-(void)testCompacted
{
    STAssertEqualObjects((@[NSNull.null, @"a", @"b", NSNull.null, @"c"]).compacted, self.abc, nil);
}

-(void)testCollected
{
    [self testMapped];
}

-(void)testEach
{
    __block int count=0;
    STAssertNoThrow([abc each:^(id o){ count++; }], nil);
    STAssertTrue(abc.count == count, nil);
}

-(void)testEachIndex
{
    __block int count=0;
    STAssertNoThrow([abc eachIndex:^(NSUInteger i){ count+=i+1; }], nil);
    STAssertTrue(6 == count, nil);
}

-(void)testIsEmpty
{
    STAssertFalse(abc.isEmpty, nil);
    STAssertTrue(empty.isEmpty, nil);
}

-(void)testFirst
{
    STAssertEqualObjects(self.abc.first, @"a", nil);
    STAssertNil(NSArray.new.first, nil);
}

-(void)testLast
{
    STAssertEqualObjects(self.abc.last, @"c", nil);
    STAssertNil(NSArray.new.last, nil);
}

-(void)testLength
{
    STAssertEquals(self.abc.length, 3u, nil);
}

-(void)testMapped
{
    NSArray* result = [self.abc mapped:(id)^(NSString *o){ return [o stringByAppendingString:o]; }];
    STAssertEqualObjects(result, (@[@"aa", @"bb", @"cc"]), nil);
}

-(void)testReversed
{
    STAssertEqualObjects(self.abc.reversed, (@[@"c", @"b", @"a"]), nil);
    STAssertEqualObjects(self.abc.reversed.reversed, self.abc, nil);
}

-(void)testSample
{
    NSArray* result = [NSArray newWithSize:100 block:(id)^(NSUInteger i){return self.abc.sample;}];
    STAssertEqualObjects([[NSSet setWithArray:result] allObjects], self.abc, nil);
}

-(void)testSelected
{
    STAssertEqualObjects([self.abc selected:^BOOL(id o) { return [@"b" isEqual:o]; }], (@[@"b"]), nil);
}

-(void)testSize
{
    STAssertEquals(self.abc.size, 3u, nil);
}

-(void)testSorted
{
    STAssertEqualObjects((@[@"c", @"a", @"b"].sorted), self.abc, nil);
    STAssertEqualObjects((self.abc.reversed.sorted), self.abc, nil);
}

@end
