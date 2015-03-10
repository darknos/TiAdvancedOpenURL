/**
 * TiAdvancedOpenURL
 *
 * Created by Your Name
 * Copyright (c) 2015 Your Company. All rights reserved.
 */

#import "ItAdvancedOpenUrlModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "TiApp.h"

@implementation ItAdvancedOpenUrlModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"bbb68214-dfb1-430e-a4c9-a5aa8fb46292";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"it.advanced.open.url";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];

	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably

	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(id)openURL:(id)args
{
    NSString * surl;
    ENSURE_ARG_COUNT(args, 1);
    ENSURE_ARG_AT_INDEX(surl, args, 0, NSString);
     NSURL *url = [[NSURL alloc] initWithString:surl];
    return NUMBOOL([[UIApplication sharedApplication] openURL:url]);
}

-(id)canOpenURL:(id)args
{
    NSString * surl;
    ENSURE_ARG_COUNT(args, 1);
    ENSURE_ARG_AT_INDEX(surl, args, 0, NSString);
    NSURL *url = [[NSURL alloc] initWithString:surl];
    NSLog([url absoluteString]);
    return NUMBOOL([[UIApplication sharedApplication] canOpenURL:url]);
}

@end
