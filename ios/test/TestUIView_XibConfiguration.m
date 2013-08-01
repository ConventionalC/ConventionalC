#import <SenTestingKit/SenTestingKit.h>
#import <QuartzCore/QuartzCore.h>
#import "UIView+XibConfiguration.h"

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
    self.view.borderColor = UIColor.redColor;
    STAssertEqualObjects(self.view.borderColor, UIColor.redColor, nil);
    STAssertEqualObjects([UIColor colorWithCGColor:self.view.layer.borderColor], UIColor.redColor, nil);
}

@end
