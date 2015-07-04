#line 1 "Tweak.xm"
#import <SpringBoard/SpringBoard.h>
#import <Cephei/HBPreferences.h>

#include <logos/logos.h>
#include <substrate.h>
@class SBPowerDownController; 
static void (*_logos_orig$_ungrouped$SBPowerDownController$orderFront)(SBPowerDownController*, SEL); static void _logos_method$_ungrouped$SBPowerDownController$orderFront(SBPowerDownController*, SEL); 

#line 4 "Tweak.xm"


static void _logos_method$_ungrouped$SBPowerDownController$orderFront(SBPowerDownController* self, SEL _cmd){
	
	BOOL enabled;
	NSArray *switches;
	BOOL sectionLabel, switchLabel;
	
	{Class _logos_class$_ungrouped$SBPowerDownController = objc_getClass("SBPowerDownController"); MSHookMessageEx(_logos_class$_ungrouped$SBPowerDownController, @selector(orderFront), (IMP)&_logos_method$_ungrouped$SBPowerDownController$orderFront, (IMP*)&_logos_orig$_ungrouped$SBPowerDownController$orderFront);} {
		HBPreferences *preferences = [HBPreferences preferencesForIdentifier:@"al.codeorigin.powerinjectprefs"];
		
		[preferences registerBool:&enabled default:YES forKey:@"Enabled"];
		[preferences registerObject:&switches default:@[  ] forKey:@"Switches"];
		[preferences registerBool:&sectionLabel default:YES forKey:@"SectionLabel"];
		[preferences registerBool:&switchLabel default:YES forKey:@"SwitchLabels"];
	}
	
	if(enabled){
		__block UIWindow *alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
		alertWindow.windowLevel = UIWindowLevelAlert;
		
		__block UIViewController *alertController = [UIViewController new];
		alertController.view.backgroundColor = [UIColor clearColor];
		alertWindow.rootViewController = alertController;
		alertWindow.alpha = 1;
		[alertWindow makeKeyAndVisible];
		
		void(^dismiss)(UIAlertAction*) = ^(UIAlertAction *alert){
			alertWindow.alpha = 0;
			[alertWindow.rootViewController.view removeFromSuperview];
			alertWindow.rootViewController = nil;
			alertController = nil;
			alertWindow = nil;
			return _logos_orig$_ungrouped$SBPowerDownController$orderFront(self, _cmd);
		};
		
		__block UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Woah!" message:@"You just pressed a button!" preferredStyle:UIAlertControllerStyleAlert];
		
		UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Close This Awesome Dialogue" style:UIAlertActionStyleDestructive handler:dismiss];
		
		[alert addAction:cancel];
		
		[alertController presentViewController:alert animated:YES completion:nil];
		






	} else {
		return _logos_orig$_ungrouped$SBPowerDownController$orderFront(self, _cmd);
	}
}


