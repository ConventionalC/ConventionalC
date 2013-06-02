#import <SenTestingKit/SenTestingKit.h>
#import "NSObject+ConventionalC.h"

@interface NSObject_ConventionalC_SharedTests : SenTestCase
@end

@interface TestObject : NSObject
  @property(retain) NSString* stringProperty;
@end

@implementation NSObject_ConventionalC_SharedTests

-(void)testPropertyNames
{
    STAssertEqualObjects(TestObject.new.propertyNames, @[@"stringProperty"], nil);
}

-(void)testAsDictionary
{
    STAssertEqualObjects(TestObject.new.asDictionary, @{@"stringProperty":@"testString"}, nil);
}


@end

@implementation TestObject

+(instancetype)new
{
    TestObject* object = super.new;
    object.stringProperty = @"testString";
    return object;
}

@end