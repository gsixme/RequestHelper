# RequestsHelper

## Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries your projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

## Installation

```ruby
pod 'RequestsHelper', :git => 'https://github.com/dstojchev/RequestHelper.git'
```

Then, run the following command:

```ruby
pod install
```

## If you are using Swift you need to add Bridge Header
### Add new header file
Click on File -> New -> File… and select “Header File” in the “Source” tab.

### Name Header File
Name this file Bridging.h

###  Locate Header File in Build Settings
Open your project Build Settings and search for “Bridging”. Edit the key “Objective-C Bridging Header” to project_name/Bridging.h.

### Import pod
You are now ready to add your imports into your Bridging.h file for the pods you want to use.
```objective-c
#ifndef Bridging_h
#define Bridging_h

#import <RequestsHelper/APIGetRequest.h>

#endif /* Bridging_h */
```
## Usage

```objective-c
[APIGetRequest get:headerParams endpointURL:strUrl success:^(NSDictionary *response) {
    // Use the response.
} failed:^(NSError *error) {
    // Handle the error.
} timeout:10];
```
```swift
APIGetRequest.get(headers, endpointURL: endpointUrl, success: { ([String : Any?]) in

}, failed: { (error) in

}, timeout: 10)
```

## Author

dimitar@gsix.me

## License

RequestsHelper is available under the MIT license. See the LICENSE file for more info.
