#import "NSArray+rubyish.h"
#import <XCTest/XCTest.h>

@interface NSArray_rubyish_SharedTests:XCTestCase
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
    abc = @[@"a", @"b", @"c"];
    empty = NSArray.new;
}

-(void)testNewWithSizeAndObject
{
    id o = @"object";
    XCTAssertEqualObjects([NSArray newWithSize:3 object:o], (@[o, o, o]));
}

-(void)testNewWithSize
{
    XCTAssertEqualObjects([NSArray newWithSize:3], (@[NSNull.null, NSNull.null, NSNull.null]));
}

-(void)testNewWithSizeAndBlock
{
    XCTAssertEqualObjects([NSArray newWithSize:3 block:(id)^(int i){return @(i);}], (@[@(0), @(1), @(2)]));
}

-(void)testAt
{
    XCTAssertEqualObjects([NSArray newWithSize:3 block:(id)^(int i){return [abc at:i];}], abc);
    XCTAssertNil([abc at:3]);
}

-(void)testCompacted
{
    XCTAssertEqualObjects((@[NSNull.null, @"a", @"b", NSNull.null, @"c"]).compacted, abc);
}

-(void)testCollected
{
    [self testMapped];
}

-(void)testCount
{
    XCTAssertEqual([abc count:@"b"], (NSUInteger)1);
    XCTAssertEqual([abc count:@"z"], (NSUInteger)0);
}

-(void)testCountWithBlock
{
    XCTAssertEqual([abc countWithBlock:^BOOL(id o){return [o isEqual:@"b"];}], (NSUInteger)1);
    XCTAssertEqual([abc countWithBlock:^BOOL(id o){return YES;}], (NSUInteger)3);
    XCTAssertEqual([abc countWithBlock:^BOOL(id o){return NO;}], (NSUInteger)0);
}

-(void)testEach
{
    __block int count=0;
    XCTAssertEqualObjects([abc each:^(id o){ count++; }], abc);
    XCTAssertTrue(abc.count == count);
}

-(void)testEachIndex
{
    __block int count=0;
    XCTAssertEqualObjects([abc eachIndex:^(NSUInteger i){ count+=i+1; }], abc);
    XCTAssertTrue(6 == count);
}

-(void)testIsEmpty
{
    XCTAssertFalse(abc.isEmpty);
    XCTAssertTrue(empty.isEmpty);
}

-(void)testFetch
{
    XCTAssertEqualObjects([abc fetch:1], @"b");
    
    XCTAssertEqualObjects([abc fetch:1 default:@"z"], @"b");
    XCTAssertEqualObjects([abc fetch:5 default:@"z"], @"z");
    
    XCTAssertEqualObjects([abc fetch:1 defaultBlock:^id(NSUInteger i){return @"z";}], @"b");
    XCTAssertEqualObjects([abc fetch:6 defaultBlock:^id(NSUInteger i){return @"z";}], @"z");
}

-(void)testFirst
{
    XCTAssertEqualObjects(abc.first, @"a");
    XCTAssertNil(NSArray.new.first);
    
    XCTAssertEqualObjects([abc first:2], (@[@"a", @"b"]));
}

-(void)testFlattened
{
    NSArray* source = @[@(1), @(2), @[@(3), @[@(4), @(5)]]];
    XCTAssertEqualObjects(source.flattened, (@[@(1),@(2),@(3),@(4),@(5)]));
}

-(void)testFlattenedToLevel
{
    NSArray* source = @[@(1), @(2), @[@(3), @[@(4), @(5)]]];
    XCTAssertEqualObjects([source flattenedToLevel:1], (@[@(1),@(2),@(3),@[@(4),@(5)]]));
}

-(void)testIndex
{
    //a = [ "a", "b", "c" ]
    XCTAssertEqual([abc index:@"b"], (NSUInteger)1);// a.index("b")              #=> 1
    XCTAssertEqual([abc index:@"z"], (NSUInteger)NSNotFound);//a.index("z")              #=> nil
    XCTAssertEqual([abc indexWithBlock:^id{return @"b";}], (NSUInteger)1);//a.index { |x| x == "b" }  #=> 1
}

-(void)testLast
{
    XCTAssertEqualObjects(abc.last, @"c");
    XCTAssertEqualObjects([abc last:2], (@[@"b",@"c"]));
    XCTAssertEqualObjects([abc last:6], abc);
    XCTAssertNil(NSArray.new.last);
}

-(void)testLength
{
    XCTAssertEqual(abc.length, (NSUInteger)3);
}

-(void)testMapped
{
    NSArray* result = [abc mapped:(id)^(NSString *o){ return [o stringByAppendingString:o]; }];
    XCTAssertEqualObjects(result, (@[@"aa", @"bb", @"cc"]));
}

-(void)testRejected
{
    XCTAssertEqualObjects([abc rejected:^BOOL(NSString* o){return [o isEqualToString:@"b"];}], (@[@"b"]));
    XCTAssertNil([abc rejected:^BOOL(NSString* o){return YES;}]);
}

-(void)testReversed
{
    XCTAssertEqualObjects(abc.reversed, (@[@"c", @"b", @"a"]));
    XCTAssertEqualObjects(abc.reversed.reversed, abc);
}

-(void)testReverseEach
{
    __block int count=0;
    NSMutableArray* reversed = NSMutableArray.new;
    XCTAssertEqualObjects([abc reverseEach:^(id o){ count++; [reversed push:o];}], abc);
    XCTAssertEqualObjects(reversed, (@[@"c", @"b", @"a"]));
    XCTAssertTrue(abc.count == count);
}

-(void)testSample
{
    NSArray* result = [NSArray newWithSize:100 block:(id)^(NSUInteger i){return abc.sample;}];
    XCTAssertEqualObjects([[NSSet setWithArray:result] allObjects], abc);
}

-(void)testSelected
{
    XCTAssertEqualObjects([abc selected:^BOOL(id o) { return [@"b" isEqual:o]; }], (@[@"b"]));
}

-(void)testShuffled
{
    NSArray* oneTo99 = [NSArray newWithSize:100 block:(id)^(int i){return @(i+1);}];
    NSArray* result = oneTo99.shuffled;
    XCTAssertFalse([oneTo99 isEqual:result]);
    XCTAssertEqualObjects(result.sorted, oneTo99);
}

-(void)testSize
{
    XCTAssertEqual(abc.size, (NSUInteger)3);
}

-(void)testSliced
{
    XCTAssertEqualObjects([abc sliced:1], @"b");//a.slice(1)     #=> "b"
    //not implemented: a.slice!(-1)    #=> "c"
    XCTAssertNil([abc sliced:100]);//a.slice(100)   #=> nil
}

-(void)testSlicedRange
{
    XCTAssertEqualObjects([abc sliced:1 length:1], (@[@"b"]));//a.slice!(1)     #=> "b"
    //not implemented: a.slice!(-1)    #=> "c"
    XCTAssertNil([abc sliced:100 length:1]);//a.slice!(100)   #=> nil
}

-(void)testSorted
{
    XCTAssertEqualObjects((@[@"c", @"a", @"b"].sorted), abc);
    XCTAssertEqualObjects((abc.reversed.sorted), abc);
}

@end
