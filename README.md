# Movies Catalog

<img src="https://user-images.githubusercontent.com/47276603/200172823-afd97da9-2d4b-47e1-89c2-84f059b1bd03.png" height = "220" align="right" hspace="50">

Movies Catalog is an [iOS](https://en.wikipedia.org/wiki/IOS) application designed to browse information about films and serials.

## Project characteristics and tech-stack

This project takes advantage of best practices, many popular libraries and tools in the iOS-development ecosystem.

* Tech-stack
    * [Swift](https://www.swift.org)
    * [Needle](https://github.com/uber/needle) - dependency injection
    * [Alamofire](https://github.com/Alamofire/Alamofire) - networking
    * [KeychainAccess](https://github.com/kishikawakatsumi/KeychainAccess) - wrapper for keychain operations
    * [SwiftyUserDefaults](https://github.com/sunshinejr/SwiftyUserDefaults) - modern api for NSUserDefaults
    * [SwiftLint](https://github.com/realm/SwiftLint) - code linting
    * [R.swift](https://github.com/mac-cain13/R.swift) - strong typed, autocompleted resources
* Modern Architecture
  * [Clean architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
  * MVVM
* UI
  * [Swift UI](https://developer.apple.com/xcode/swiftui/)
  * [SPAlert](https://github.com/ivanvorobei/SPAlert) - Apple Music-like popup
  * [Apple human interface guidelines](https://developer.apple.com/design/human-interface-guidelines/)

## Architecture
The entire application follows `clean architecture`.

It contains non-layer components and layers with distinct set of responsibilities.

<img src="https://user-images.githubusercontent.com/47276603/200173805-58b2a4bb-6db7-4a81-b9c4-ddc76347298b.png" width="700" hspace="5" vspace ="10">

## More project screenshots

<img src="https://user-images.githubusercontent.com/47276603/200174180-09f117ae-101a-4263-97f0-90d6085979cc.png" width="200" hspace="5" vspace ="10">
<img src="https://user-images.githubusercontent.com/47276603/200174178-0a2c89cc-dd9b-4520-b965-dd4436ffb147.png" width="200" hspace="5" align="left" vspace ="10">
<br/>
<img src="https://user-images.githubusercontent.com/47276603/200174176-c8f5c2dd-2582-4752-b417-264c47515922.png" width="200" hspace="5" vspace ="10">
<img src="https://user-images.githubusercontent.com/47276603/200174177-4ec6983b-1b3e-42b1-98e3-5d15e34e068d.png" width="200" hspace="5" align="left" vspace ="10">
<br/>
<img src="https://user-images.githubusercontent.com/47276603/200174167-3c04b2b2-c212-48a5-ab6e-cea489ec74f2.png" width="200" hspace="5" vspace ="10">
<img src="https://user-images.githubusercontent.com/47276603/200174171-d4fe4847-c59f-4896-98a0-501577969dcf.png" width="200" hspace="5" align="left" vspace ="10">
<br/>
<img src="https://user-images.githubusercontent.com/47276603/200174165-2fe10389-1e8a-4ba2-ba91-f2c90134d5d7.png" width="200" hspace="5" vspace ="10">
<br/>

## License
```
MIT License

Copyright (c) 2022 Igor Efimov

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
```