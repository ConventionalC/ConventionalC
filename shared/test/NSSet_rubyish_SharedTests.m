#import "NSSet+rubyish.h"
#import <SenTestingKit/SenTestingKit.h>

@interface NSSet_rubyish_sharedTests : SenTestCase
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
