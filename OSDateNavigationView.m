//
//  OSDateNavigationView.m
//  Ocasta Studios
//
//  Created by Chris Birch on 24/07/2014.
//  Copyright (c) 2014 Ocasta Studios. All rights reserved.
//

#import "OSDateNavigationView.h"
#import <UIView+NibLoading.h>
#import <NSDate+OSDateFormatter.h>

@implementation OSDateNavigationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(NSDate *)dateEndOfWeek
{
    if (_type == OSDateNavigationViewTypeFullWeek)
    {
        return [_date addDays:6];
    }
    else if (_type == OSDateNavigationViewTypeWorkingWeek)
    {
        return [_date addDays:4];
    }
    else
        return nil;
}

-(void)setDate:(NSDate *)date
{
    if (!_date || [date compare:_date] != NSOrderedSame)
    {
        _date = date;
        
        if (_type == OSDateNavigationViewTypeDay)
            [self setTitle:date.dateDayMonYear];
        else if (_type == OSDateNavigationViewTypeWorkingWeek || _type == OSDateNavigationViewTypeFullWeek)
        {
            //make sure we have the first day of the week selected
            _date = [_date firstDayOfWeek];
            
            NSDate* lastDay = self.dateEndOfWeek;
            
            [self setTitle: [[NSString alloc] initWithFormat:@"%@ - %@", date.dateyyyy_MM_dd,lastDay.dateyyyy_MM_dd]];
        }
        else
            [self setTitle:date.dateMonthYYYY];
        
        //check if user code has registered a function to be called
        if (self.dateChanged)
        {
            self.dateChanged(date);
        }
    }
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        self.type = OSDateNavigationViewTypeDay;
        
        //set todays date and update title
        self.date = [NSDate date];
        
        __block OSDateNavigationView* this= self;
        
        //Handle the next button being tapped
        self.nextButtonTapped = ^NSString*(UIButton* button)
        {
            if (this.type == OSDateNavigationViewTypeDay)
                this.date = [this.date tomorrow];
            else if (this.type == OSDateNavigationViewTypeMonth)
                this.date = [this.date nextMonth];
            else
            {
                this.date = [this.date addDays:7];
            }
            
            
            
            
            
            return this.title;
        };
        
        //Handle the previous button being tapped
        self.previousButtonTapped = ^NSString*(UIButton* button)
        {
            if (this.type == OSDateNavigationViewTypeDay)
                this.date = [this.date yesterday];
            else if (this.type == OSDateNavigationViewTypeMonth)
                this.date = [this.date previousMonth];
            else
            {
                this.date = [this.date addDays:-7];
            }
            
            return this.title;
        };
    }
    
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
