PKNetworkActivityController
===========================
A simple and lightweight network activity indicator controller written in **Swift**, exclusively for **iOS 8**.
## Features
- **Thread-safe** implementation.
- Builds as an **iOS 8 framework**.

## How To
After adding the framework to your project, you need to import the module
```
import PKNetworkActivityController
```

When starting a network operation, make sure you register with the controller.

```
NetworkActivityController.sharedController.registerActivity()
```

After your network operation finishes (successful or not), remember to deregister.

```
NetworkActivityController.sharedController.deregisterActivity()
```

If you're interested in the number of registered activities, you can use the controller's property `numberOfRegisteredActivities`.

## Disclaimer

While basically feature complete and stable, make sure you understand that **Swift is still in beta**, thus the API might change.

## License

The MIT License (MIT)

Copyright (c) 2014 Philip Kluz (Philip.Kluz@zuui.org)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
