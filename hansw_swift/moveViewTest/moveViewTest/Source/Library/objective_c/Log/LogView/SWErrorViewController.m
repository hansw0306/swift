//
//  SWErrorViewController.m
//  Searchi_Obj
//
//  Created by SANGWON HAN on 2020/09/22.
//

#import "SWErrorViewController.h"
#import "SWErrorViewDetailController.h"
#import "SWErrorViewCell.h"
#import "CommDefine.h"
#pragma mark- SWError

@implementation SWError
@end
#pragma mark- SWErrorList
@implementation SWErrorList
SWErrorList* gErrorList = nil;
+ (SWErrorList*) Share
{
    if(gErrorList == nil ) {
        gErrorList = [[SWErrorList alloc] init];
        gErrorList.mList = [[NSMutableArray alloc] initWithCapacity:100];
    }
    return gErrorList;
}

-(void) InsertList:(NSNumber*)Line Error:(NSString*)sError File:(NSString*)sFile
{
    SWError* error = [[SWError alloc] init];
    error.sLine = [NSString stringWithFormat:@"%d",Line.intValue];
    error.sError = sError;
    error.sFile = sFile;
    [self.mList insertObject:error atIndex:0];
}

-(void) ClearList
{
    [self.mList removeAllObjects];
}
@end


#pragma mark- SWErrorViewController

@interface SWErrorViewController()
@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@property (weak, nonatomic) IBOutlet UITextField *mFilter;
@property (nonatomic,retain) SWErrorList* mFilterList;
@end

@implementation SWErrorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //스토리보드에서 작업하였다.
    //_mFilter.delegate = self;
    //_mTableView.dataSource = self;
    //_mTableView.delegate = self;
    NSString* sFilter = [[NSUserDefaults standardUserDefaults] objectForKey:@"_SWErrorFilter_"];
    if(sFilter) {
        self.mFilter.text = sFilter;
        [self SetFilter:sFilter];
    }
}



- (IBAction)OnClose:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
- (IBAction)OnClear:(id)sender {
    [[SWErrorList Share] ClearList];
    self.mFilterList = nil;
    [self.mTableView reloadData];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell* RowCellView = nil;

    SWErrorList* List = [SWErrorList Share];
    if(self.mFilterList)
        List = self.mFilterList;
    SWError* error = [List.mList objectAtIndex:indexPath.row];

    if([error.sLine compare:@"-1"] == 0)
    {
        SWErrorViewCell* InRowCellView = [tableView dequeueReusableCellWithIdentifier:@"SWErrorViewCell"];
        if(InRowCellView == nil)
        {
            InRowCellView = [[[NSBundle bundleWithIdentifier:_BUNDLEID_] loadNibNamed:@"SWErrorViewCell" owner:self options:nil] objectAtIndex:0];
            InRowCellView.autoresizesSubviews = YES;
            [InRowCellView setSelectionStyle:UITableViewCellSelectionStyleDefault];
        }
        InRowCellView.mType.text =  [error.sFile substringToIndex:1];
        InRowCellView.mMsg.text = error.sError;
        RowCellView = InRowCellView;
    }
    else
    {
        //새로운 셀...
    }
    return RowCellView;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    SWErrorList* List = [SWErrorList Share];
    if(self.mFilterList)
        List = self.mFilterList;
    return List.mList.count;
}

+(void) ShowJSErrorView:(UIViewController*)Con
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SWErrorView" bundle:[NSBundle bundleWithIdentifier:_BUNDLEID_]];
    SWErrorViewController *JSCon = [storyboard instantiateViewControllerWithIdentifier:@"SWErrorViewController"];
    [Con presentViewController:JSCon animated:YES completion:nil];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 62;
}
//셀을 선택할때
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SWErrorList* List = [SWErrorList Share];
    if(self.mFilterList)
        List = self.mFilterList;
    SWError* error = [List.mList objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"GoSWErrorViewDetail" sender:error];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"GoSWErrorViewDetail"]) {
        SWError* error = (SWError*)sender;
        SWErrorViewDetailController *controller = (SWErrorViewDetailController *)segue.destinationViewController;
        controller.mError = error;
    }
}


//텍스트 검색 관련
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString * sFilter = [textField.text stringByReplacingCharactersInRange:range withString:string];
    [self SetFilter:sFilter];

    [[NSUserDefaults standardUserDefaults] setObject:sFilter forKey:@"_SWErrorFilter_"];
    //[[NSUserDefaults standardUserDefaults] synchronize];
    return YES;
}

- (void)SetFilter:(NSString*)sFilter
{
    SWErrorList* List = [SWErrorList Share];

    if(sFilter.length != 0)
    {
        if(self.mFilterList == nil)
        {
            self.mFilterList = [[SWErrorList alloc] init];
            self.mFilterList.mList = [[NSMutableArray alloc] initWithCapacity:100];
        }
        else
            [self.mFilterList.mList removeAllObjects];

        for (SWError* error in List.mList) {
            if(strstr(error.sError.UTF8String, sFilter.UTF8String))
            {
                [self.mFilterList.mList addObject:error];
            }
        }
    }
    else
    {
        [self.mFilterList.mList removeAllObjects];
        self.mFilterList = nil;
    }
    [self.mTableView reloadData];
}





@end
