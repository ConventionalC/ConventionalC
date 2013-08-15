#import <SenTestingKit/SenTestingKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CALayer+XibConfiguration.h"

@interface TestUIView_XibConfiguration : SenTestCase
    @property UIView* view;
@end

@implementation TestUIView_XibConfiguration

-(void)setUp
{
    self.view = UIView.new;
}

-(void)testBorderColor
{
    self.view.layer.borderUIColor = UIColor.redColor;
    STAssertEqualObjects(self.view.layer.borderUIColor, UIColor.redColor, nil);
    STAssertEqualObjects([UIColor colorWithCGColor:self.view.layer.borderColor], UIColor.redColor, nil);
}

@end
