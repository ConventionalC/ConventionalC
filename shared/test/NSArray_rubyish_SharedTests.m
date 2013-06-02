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

-(void)testNewWithSizeAndBlock
{
    NSArray* array;
    STAssertNoThrow(array = [NSArray newWithSize:3 block:(id)^(int i){ return [NSNumber numberWithInt:i]; }], nil);
    STAssertNotNil(array, nil);
    STAssertTrue(3 == array.count, nil);
    for(int i=0; i<3; i++)
        STAssertEqualObjects([array objectAtIndex:i], [NSNumber numberWithInt:i], @"Object should match original object");
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

@end
