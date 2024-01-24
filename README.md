# RaAPIWrapper

<p align="center">
<a href="https://swiftpackageindex.com/RakuyoKit/RaAPIWrapper"><img src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FRakuyoKit%2FRaAPIWrapper%2Fbadge%3Ftype%3Dswift-versions"></a>
<a href="https://swiftpackageindex.com/RakuyoKit/RaAPIWrapper"><img src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FRakuyoKit%2FRaAPIWrapper%2Fbadge%3Ftype%3Dplatforms"></a>
</p>
<p align="center">
<a href="https://cocoapods.org/pods/RaAPIWrapper"><img src="https://img.shields.io/github/v/tag/RakuyoKit/RaAPIWrapper.svg?include_prereleases=&sort=semver"></a>
<a href="https://raw.githubusercontent.com/RakuyoKit/RaAPIWrapper/master/LICENSE"><img src="https://img.shields.io/badge/license-MIT-black"></a>
</p>

> [中文](https://github.com/RakuyoKit/RaAPIWrapper/blob/main/README_CN.md)

`RaAPIWrapper` uses `@propertyWrapper` to achieve a similar effect to that of defining network requests in the Android `Retrofit` library.

When you have a large number of network request apis in the same file `RaAPIWrapper` can help you define each request in a more aggregated form, so you don't have to jump back and forth within the file.

## Say it before

**Special Note!** : `RaAPIWrapper` is just a syntactic sugar for **defining** web requests. You need to use `Alamofire`, `Moya`, other third-party web framework or call `URLSession` directly to initiate web requests on this basis.

The good thing is that you can easily integrate `RaAPIWrapper` into your existing project with few or no code changes, and `RaAPIWrapper` can coexist very well with the existing web framework in your project.

## Requirements

- **iOS 12**、**macOS 10.14**、**watchOS 5.0**、**tvOS 12** or later.
- **Xcode 14** or later required.
- **Swift 5.7** or later required.

## Example

```swift
@GET("/api/v1/no_param")
static var noParamAPI: APIParameterBuilder<()>? = nil

@POST("/api/v1/tuple_param")
static var tupleParamAPI: APIParameterBuilder<(id: Int, name: String?)>? = .init {
    // `Dictionary` and `Array` can be used directly as parameters.
    ["id": $0.id, "name": $0.name]
}

@POST("/post")
static var postWithModel: APIParameterBuilder<Arg>? = .init {
    // When the parameter `Arg` complies with the `APIParameter` (`Encodable & Hashable`) protocol, 
    // it can be used directly as a parameter.
    $0
}
```

## Install

### CocoaPods

```ruby
pod 'RaAPIWrapper'
```

If your project relies on `Alamofire`, then you may also consider relying on `RaAPIWrapper/AF`. This module provides a wrapper for `ParameterEncoding`.

### Swift Package Manager

- File > Swift Packages > Add Package Dependency
- Add https://github.com/RakuyoKit/RaAPIWrapper.git
- Select "Up to Next Major" and fill in the corresponding version number

Or add the following to your `Package.swift` file:

```swift
dependencies: [
  .package(
    url: "https://github.com/RakuyoKit/RaAPIWrapper.git", 
    .upToNextMajor(from: "1.2.1")
  )
]
```

## Usage

Please refer to the example in `Demo.playground`.

> Since playground depends on `RaAPIWrapper` in the form of Swift Package Manager, please open the project via `Package.swift` first, then select `Demo.playground` from the left navigation bar and run the content.

## License

`RaAPIWrapper` is available under the **MIT** license. For more information, see [LICENSE](LICENSE).
