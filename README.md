# APIRequestsHelperGSIX

[![CI Status](https://img.shields.io/travis/dimitar@gsix.me/APIRequestsHelperGSIX.svg?style=flat)](https://travis-ci.org/dimitar@gsix.me/APIRequestsHelperGSIX)
[![Version](https://img.shields.io/cocoapods/v/APIRequestsHelperGSIX.svg?style=flat)](https://cocoapods.org/pods/APIRequestsHelperGSIX)
[![License](https://img.shields.io/cocoapods/l/APIRequestsHelperGSIX.svg?style=flat)](https://cocoapods.org/pods/APIRequestsHelperGSIX)
[![Platform](https://img.shields.io/cocoapods/p/APIRequestsHelperGSIX.svg?style=flat)](https://cocoapods.org/pods/APIRequestsHelperGSIX)

## Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like AFNetworking in your projects. See the ["Getting Started" guide for more information](https://github.com/AFNetworking/AFNetworking/wiki/Getting-Started-with-AFNetworking). You can install it with the following command:

```bash
$ gem install cocoapods
```

## Installation

APIRequestsHelperGSIX is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'APIRequestsHelperGSIX'
```

## Installation

```ruby
pod 'APIRequestsHelperGSIX', :git => 'https://dstojcev@bitbucket.org/dstojcev/apirequestshelpergsix.git'
```

Then, run the following command:

```ruby
pod install
```

## If using Swift you need to add Bridge Header
### Add new header file
Click on File -> New -> File… and select “Header File” in the “Source” tab.

### Name Header File
Name this file Bridging.h

###  Locate Header File in Build Settings
Open your project Build Settings and search for “Bridging”. Edit the key “Objective-C Bridging Header” to project_name/project_name-Bridging-Header.h.

### Import pod
You are now ready to add your imports into your Bridging-Header.h file for the pods you want to use.
```objective-c
#ifndef Bridging_h
#define Bridging_h

#import <APIRequestsHelperGSIX/APIGetRequest.h>

#endif /* Bridging_h */
```
## Usage

### Create instance

```objective-c
[APIGetRequest get:headerParams endpointURL:strUrl success:^(NSDictionary *response) {
if([response[@"error"] boolValue]){
failed([[[response valueForKeyPath:@"data.messages"] allObjects] componentsJoinedByString:@"\n"]);
return;
}
success(response);
} failed:^(NSError *error) {
if ([error.userInfo[@"NSLocalizedDescription"] isEqualToString:@"The Internet connection appears to be offline."]) {
failed(@"Немате интернет пристап.");
return;
}
failed(error.userInfo[@"NSLocalizedDescription"]);
} timeout:-1];
```
```swift

```

## Author

dimitar@gsix.me, dimitar@gsix.me

## License

APIRequestsHelperGSIX is available under the MIT license. See the LICENSE file for more info.
