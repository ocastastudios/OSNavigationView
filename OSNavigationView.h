//
//  OSStepView.h
//  Ocasta Studios
//
//  Created by Chris Birch on 24/07/2014.
//  Copyright (c) 2014 Ocasta Studios. All rights reserved.
//

/**
 * Simple view offering forward and back navigation buttons with a title
 */
#import <UIKit/UIKit.h>

/**
 * Block definition for handling taps on the next and previous buttons
 */
typedef NSString*(^OSNavigationViewButtonFunction)(UIButton* button);

@interface OSNavigationView : UIView

@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UIButton *buttonPrevious;
@property (weak, nonatomic) IBOutlet UIButton *buttonNext;

/**
 * If YES then changes to the title will be animated
 */
@property (nonatomic,assign) BOOL animateTitleChange;

/**
 * Fired when the previous button is tapped. The function should return the new title of the control
 */
@property (nonatomic,copy) OSNavigationViewButtonFunction previousButtonTapped;
/**
* Fired when the next button is tapped. The function should return the new title of the control
*/
@property (nonatomic,copy) OSNavigationViewButtonFunction nextButtonTapped;

/**
 * Updates the text of the control
 */
@property (nonatomic,strong) NSString* title;

@end
