#import <XCTest/XCTest.h>
#import "NSObject+ConventionalC.h"

@interface NSObject_ConventionalC_SharedTests : XCTestCase
@end

@interface TestObject : NSObject
  @property(retain) NSString* string;
  @property(retain) NSArray* strings;
  @property(retain) NSArray* testObjects;
  @property(retain) NSObject* nilValue;
@end

@implementation NSObject_ConventionalC_SharedTests

-(void)testPropertyNames
{
    XCTAssertEqualObjects(TestObject.new.propertyNames, (@[@"string", @"strings", @"testObjects", @"nilValue"]));
}

-(void)testAsDictionary
{
    XCTAssertEqualObjects(TestObject.new.asDictionary,
                         (@{@"string":@"string1",
                            @"strings":@[@"string2", @"string3"],
                            @"testObjects":@[
                                @{@"string":@"string4"},
                                NSNull.null
                            ],
                          }));
}

-(void)testIsKindOfClasses
{
    XCTAssertTrue([TestObject.new isKindOfClasses:@[NSObject.class]]);
    XCTAssertTrue([TestObject.new isKindOfClasses:@[TestObject.class]]);
    XCTAssertFalse([TestObject.new isKindOfClasses:@[NSString.class]]);
    XCTAssertTrue([TestObject.new isKindOfClasses:(@[NSString.class, TestObject.class])]);
}

@end

@implementation TestObject

+(instancetype)new
{
    TestObject* object = super.new;
    object.string = @"string1";
    object.strings = @[@"string2", @"string3"];
    TestObject* subObject = TestObject.alloc.init;
    subObject.string = @"string4";
    object.testObjects = @[subObject, object]; //Add object to test recursion.
    return object;
}

@end