# SGSnackBar

## Requirements
Xcode 9.0+ and Swift 4.0

> To use swift 2.0 version, please use 1.0.0 cocoapod version or swift 2 tag of the repo

## Info

A android material style snackbar lib for iOS. Can be used to show as a simple toast or for more complicated operations like undo a mail delete etc.
Auto dismisses after the duration you set so easy management from code point of view.


## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

#### Show the snackbar on any view or window

```
self.view.showSnackbar(message: "My Snackbar message", duration: SnackbarDuration.SHORT, actionButtonText: "OK") { () -> () in
```
##### Params

```
message                     - Text to show in the snackbar message
duration                    - SHORT - 4 second or LONG - 7 second
actionButtonText            - optional - if set shows the action button
actionButtonClickHandler    - Swift closure that is executed when user presses the action button
```


##### UIAppearance

```
SGSnackBarView.appearance().actionButtonBackgroundColor
SGSnackBarView.appearance().descLabelTextColor
SGSnackBarView.appearance().snackBarBgColor
SGSnackBarView.appearance().actionButtonTextColor
```
All of the above can be set to display custom snackbar.

## Demo

![Demo](http://i.imgur.com/P8nfd80.gif)


## Installation

SGSnackBar is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SGSnackBar"
```

## Author

Shubhank Gupta, shubhankscores@gmail.com

## License

SGSnackBar is available under the MIT license. See the LICENSE file for more info.
