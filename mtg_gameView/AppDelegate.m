//
//  AppDelegate.m
//  mtg_gameView
//
//  Created by Michael Osiecki on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "/usr/include/sqlite3.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)createEditableCopyOfDatabaseIfNeeded {
    
    NSLog(@"Creating editable copy of database");
    // First, test for existence.
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"CardDb.sqlite"];
    success = [fileManager fileExistsAtPath:writableDBPath];
    if (success) return;
    // The writable database does not exist, so copy the default to the appropriate location.
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"CardDb.sqlite"];
    success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    if (!success) {
        NSAssert1(0, @"Failed to create writable database file with message ‘%@’.", [error localizedDescription]);
    }
}
+(sqlite3 *) getNewDBConnection{
    sqlite3 *newDBconnection;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"CardDb.sqlite"];
    // Open the database. The database was prepared outside the application.
    if (sqlite3_open([path UTF8String], &newDBconnection) == SQLITE_OK) {
        
        NSLog(@"Database Successfully Opened  ");
        
    } else {
        NSLog(@"Error in opening database  ");
    }
    
    return newDBconnection; 
}
-(void) initializeTableData
{
    sqlite3 *db = [AppDelegate getNewDBConnection];
    sqlite3_stmt *statement = nil;
    const char *sql = "select name from CardDb";
    if(sqlite3_prepare_v2(db, sql, -1, &statement, NULL) != SQLITE_OK)
    {
        NSLog(0,@"Error initializing database. ", sqlite3_errmsg(db));
    }
    else
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            //NSLog([NSString stringWithFormat:@"%s",(char*)sqlite3_column_text(statement, 0)]);
                  
        }
        sqlite3_finalize(statement);
        
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Initialize Card Db
    [self createEditableCopyOfDatabaseIfNeeded];
    
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
