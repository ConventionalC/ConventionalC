#import "UITableView+ConventionalC.h"

@implementation UITableView(ConventionalC)


+(UITableView*)tableViewWithFrame:(CGRect)bounds style:(UITableViewStyle)style
{
    return [[UITableView alloc] initWithFrame:bounds style:style];
}

// Returns YES if there are no rows in any section.
-(BOOL)isEmpty
{
    for(int s=0; s<self.numberOfSections; s++)
        if([self numberOfRowsInSection:s] > 0)
            return NO;
    
    return YES;
}

-(BOOL)isNotEmpty
{
    for(int s=0; s<self.numberOfSections; s++)
        if([self numberOfRowsInSection:s] > 0)
            return YES;
    
    return NO;
}

-(UITableViewCell*)cellForRow:(int)r inSection:(int)s
{
    return [self cellForRowAtIndexPath:[NSIndexPath indexPathForRow:r inSection:s]];
}

// Defaults to the first section
-(UITableViewCell*)cellForRow:(int)r
{
    return [self cellForRow:r inSection:0];
}

-(UITableViewCell*)cellForSelectedRow
{
    return [self cellForRowAtIndexPath: self.indexPathForSelectedRow];
}

-(void)insertRowAtIndexPath:(NSIndexPath*)indexPath withRowAnimation:(UITableViewRowAnimation)animation
{
    [self insertRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

-(void)insertRow:(int)r inSection:(int)s withRowAnimation:(UITableViewRowAnimation)a
{
    [self insertRowAtIndexPath:[NSIndexPath indexPathForRow:r inSection:s] withRowAnimation:a];
}

-(void)insertRow:(int)r withRowAnimation:(UITableViewRowAnimation)a
{
    [self insertRow:r inSection:0 withRowAnimation:a];
}

-(void)insertSection:(int)s withRowAnimation:(UITableViewRowAnimation)a
{
    [self insertSections:[NSIndexSet indexSetWithIndex:s] withRowAnimation:a];
}

-(void)scrollToRow:(int)r inSection:(int)s atScrollPosition:(UITableViewScrollPosition)p animated:(BOOL)a
{
    [self scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:r inSection:s] atScrollPosition:p animated:a];
}

-(void)scrollToRow:(int)r atScrollPosition:(UITableViewScrollPosition)p animated:(BOOL)a
{
    [self scrollToRow:r inSection:0 atScrollPosition:p animated:a];
}

-(void)reloadRowAtIndexPath:(NSIndexPath*)ip withRowAnimation:(UITableViewRowAnimation)a
{
    [self reloadRowsAtIndexPaths:@[ip] withRowAnimation:a];
}

-(void)reloadRowAtIndexPath:(NSIndexPath*)ip
{
    [self reloadRowAtIndexPath:ip withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void)deleteRowAtIndexPath:(NSIndexPath*)i withRowAnimation:(UITableViewRowAnimation)a
{
    [self deleteRowsAtIndexPaths:@[i] withRowAnimation:a];
}

-(void)deleteRow:(int)r inSection:(int)s withRowAnimation:(UITableViewRowAnimation)a
{
    [self deleteRowAtIndexPath:[NSIndexPath indexPathForRow:r inSection:s] withRowAnimation:a];
}

-(void)deleteRow:(int)r withRowAnimation:(UITableViewRowAnimation)a
{
    [self deleteRow:r inSection:0 withRowAnimation:a];
}

-(void)deleteSection:(int)s withRowAnimation:(UITableViewRowAnimation)a
{
    [self deleteSections:[NSIndexSet indexSetWithIndex:s] withRowAnimation:a];
}

-(void)selectFirstRow:(BOOL)animated;
{
    if(self.numberOfSections > 0 && [self numberOfRowsInSection:0] > 0)
        [self selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:animated scrollPosition:UITableViewScrollPositionTop];
}

-(void)deselectAll
{
    [self deselectRowAtIndexPath:self.indexPathForSelectedRow animated:YES];
}

@end
