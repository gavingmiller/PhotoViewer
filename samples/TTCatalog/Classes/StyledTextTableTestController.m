#import "StyledTextTableTestController.h"

@implementation StyledTextTableTestController

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)init {
  if (self = [super init]) {
    self.autoresizesForKeyboard = YES;
    self.variableHeightRows = YES;

    NSArray* strings = [NSArray arrayWithObjects:
      [TTStyledText textFromXHTML:@"This is a whole bunch of text made from \
  characters and followed by this URL http://bit.ly/1234"],
      [TTStyledText textFromXHTML:@"Here we have a URL http://www.h0tlinkz.com \
  followed by another http://www.internets.com"],
      [TTStyledText textFromXHTML:@"http://www.cnn.com is a URL and the words you \
  are now reading are the text that follows"],
      [TTStyledText textFromXHTML:@"Here is text that has absolutely no styles. \
  Move along now. Nothing to see here. Goodbye now."],
  //    @"Let's test out some line breaks.\n\nOh yeah.",
  //    @"This is a message with a long URL in it http://www.foo.com/abra/cadabra/abrabra/dabarababa",
      nil];
    NSString* URL = @"tt://styledTextTableTest";

    TTListDataSource* dataSource = [[[TTListDataSource alloc] init] autorelease];
    for (int i = 0; i < 50; ++i) {
      TTStyledText* text = [strings objectAtIndex:i % strings.count];
      
      [dataSource.items addObject:[TTTableStyledTextItem itemWithText:text URL:URL]];
    }
    self.dataSource = dataSource;
  }
  return self;
}

- (void)dealloc {
  [super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// TTTableViewController

- (void)loadView {
  [super loadView];
  self.tableView.allowsSelection = NO;
}

@end
