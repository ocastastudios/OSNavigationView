//
//  OSStepView.m
//  Ocasta Studios
//
//  Created by Chris Birch on 24/07/2014.
//  Copyright (c) 2014 Ocasta Studios. All rights reserved.
//

#import "OSNavigationView.h"
#import <UILabel+TextAnimation.h>

@interface OSNavigationView ()
{
    BOOL hasRunBefore;
}

@end
@implementation OSNavigationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        self.animateTitleChange = YES;
    }
    
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //Hack needed for the first run
    if (!hasRunBefore)
    {
        hasRunBefore = YES;
        self.title = self.title;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (IBAction)cmPreviousTapped:(UIButton *)sender
{
    if (_previousButtonTapped)
    {
        NSString* newTitle = _previousButtonTapped(sender);
        self.title =newTitle;
    }
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    
    if (_animateTitleChange)
    {
        [_lbTitle updateText:title];
    }
    else
    {
        _lbTitle.text = title;
    }
    
}

- (IBAction)cmNextTapped:(UIButton *)sender
{
    if (_nextButtonTapped)
    {
        NSString* newTitle = _nextButtonTapped(sender);
        self.title = newTitle;
        
    }
}

@end
