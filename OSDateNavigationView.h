//
//  OSDateNavigationView.h
//  Ocasta Studios
//
//  Created by Chris Birch on 24/07/2014.
//  Copyright (c) 2014 Ocasta Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OSNavigationView.h"

typedef enum
{
    OSDateNavigationViewTypeDay,
   OSDateNavigationViewTypeMonth,
    OSDateNavigationViewTypeWorkingWeek,
    OSDateNavigationViewTypeFullWeek
    
    
} OSDateNavigationViewType;


typedef void(^OSDateNavigationViewDateChangedFunction)(NSDate* newDate);

@interface OSDateNavigationView : OSNavigationView

/**
 * Configures the type of navigation
 */
@property (nonatomic,assign) OSDateNavigationViewType type;
/**
 * The currently selected date.
 * If type == OSDateNavigationWorkingWeek or OSDateNavigationFullWeek then this is the monday and any 
 * date that isnt a monday will be converted to the monday of the week
 */
@property (nonatomic,strong) NSDate* date;

/**
 * Only applicable when type == OSDateNavigationWorkingWeek or OSDateNavigationViewTypeFullWeek.
 * This is the date is friday or sunday respectively.
 * Otherwise this is nil
 */
@property (nonatomic,readonly) NSDate* dateEndOfWeek;


/**
 * Provide a block implementation to be notified when the date changes
 */
@property (nonatomic,copy) OSDateNavigationViewDateChangedFunction dateChanged;


@end
