#import "NSSet+rubyish.h"
#import <XCTest/XCTest.h>

@interface NSSet_rubyish_sharedTests : XCTestCase
@end

@interface NSSet_rubyish_sharedTests()
  @property(retain) NSSet* abc;
  @property(retain) NSSet* empty;
@end

@implementation NSSet_rubyish_sharedTests

@synthesize abc, empty;

-(void)setUp
{
    [super setUp];
    self.abc = [NSSet setWithObjects:@"a", @"b", @"c", nil];
    self.empty = [NSSet setWithObjects: nil];
}

@end
