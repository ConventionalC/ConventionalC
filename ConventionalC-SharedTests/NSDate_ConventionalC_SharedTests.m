#import <SenTestingKit/SenTestingKit.h>
#import "NSDate+ConventionalC.h"

@interface NSDate_ConventionalC_SharedTests : SenTestCase
@end

@implementation NSDate_ConventionalC_SharedTests

-(NSDate*)date { return NSDate.distantPast; }

-(void)testDateSecond
{
    STAssertEquals(self.date.second, 58, nil);
}

-(void)testDateMinute
{
    STAssertEquals(self.date.minute, 3, nil);
}

-(void)testDateHour
{
    STAssertEquals(self.date.hour, 19, nil);
}

@end
