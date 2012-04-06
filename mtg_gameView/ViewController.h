//
//  ViewController.h
//  mtg_gameView
//
//  Created by Michael Osiecki on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


#define myAppDelegate [[UIApplication sharedApplication] delegate]

@interface ViewController : UIViewController
{
}

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;

@end
