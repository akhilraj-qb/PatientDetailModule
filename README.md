# PatientDetailModule
 
## Overview

Patient Detail Module is an example implementation of a test module that can be addressible by its containing application using HTTP GET. The module will show a detail screen if correct parameter is passed in URL or shows an error screen.

## Example

To run the example project, clone the repo, and run `pod install` from the directory.

## Installation

PatientDetailModule is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "PatientDetailModule"
```

## Usage

```swift
import PatientDetailModule
```

Add module

```swift
let moduleConnector = ModuleConnector()
    
override func viewDidLoad() {
    super.viewDidLoad()
    moduleConnector.mount(module: DetailModule())
}
```

Module accessing

```swift
guard let url = URL(string: "PatientDetail://patientDetailVC?patientID=1234") ,
      let viewController = moduleConnector.get(url: url) as? UIViewController
      else { return }
        
navigationController?.pushViewController(viewController, animated: true)
```

## License

PatientDetailModule is available under the Apache license. See the LICENSE file for more info.
