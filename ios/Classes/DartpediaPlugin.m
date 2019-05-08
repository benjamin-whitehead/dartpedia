#import "DartpediaPlugin.h"
#import <dartpedia/dartpedia-Swift.h>

@implementation DartpediaPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDartpediaPlugin registerWithRegistrar:registrar];
}
@end
