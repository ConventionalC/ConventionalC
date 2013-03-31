#import <SenTestingKit/SenTestingKit.h>
#import "NSDate+ConventionalC.h"

@interface NSDate_ConventionalC_SharedTests : SenTestCase
@end

@implementation NSDate_ConventionalC_SharedTests

-(NSDate*)date { return NSDate.distantPast; }

-(void)testDateSecond
{
    STAssertEquals((int)self.date.second, 58, nil);
}

-(void)testDateMinute
{
    STAssertEquals((int)self.date.minute, 3, nil);
}

-(void)testDateHour
{
    STAssertEquals((int)self.date.hour, 19, nil);
}

@end
