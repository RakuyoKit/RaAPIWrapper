# RaAPIWrapper

<p align="center">
<a href="https://swiftpackageindex.com/RakuyoKit/RaAPIWrapper"><img src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FRakuyoKit%2FRaAPIWrapper%2Fbadge%3Ftype%3Dswift-versions"></a>
<a href="https://swiftpackageindex.com/RakuyoKit/RaAPIWrapper"><img src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FRakuyoKit%2FRaAPIWrapper%2Fbadge%3Ftype%3Dplatforms"></a>
</p>
<p align="center">
<a href="https://cocoapods.org/pods/RaAPIWrapper"><img src="https://img.shields.io/github/v/tag/RakuyoKit/RaAPIWrapper.svg?include_prereleases=&sort=semver"></a>
<a href="https://raw.githubusercontent.com/RakuyoKit/RaAPIWrapper/master/LICENSE"><img src="https://img.shields.io/badge/license-MIT-black"></a>
</p>

`RaAPIWrapper` 利用 `@propertyWrapper` 来实现类似于 Android `Retrofit` 库中定义网络请求的效果。

在同一个文件中包含大量的网络请求接口时，`RaAPIWrapper` 可以帮助您以更聚合的形式定义每一个请求，让您不用在文件内来回跳转。

## 说在前面

**特别注意！**：`RaAPIWrapper` 仅仅是一个**定义**网络请求的语法糖。您需要在此基础上借助 `Alamofire`、`Moya` 、其他第三方网络框架或者直接调用 `URLSession` 来发起网络请求。

好的一点是，您只需要修改少量的代码，甚至无需修改代码，就可以很简单地将 `RaAPIWrapper` 集成进您已有的项目，`RaAPIWrapper` 可以很好的和您项目中现有的网络框架共存。

## 基本要求

- 运行 **iOS 12**、**macOS 10.14**、**watchOS 5.0**、**tvOS 12** 及以上版本的设备。
- 使用 **Xcode 14** 及以上版本编译运行。
- **Swift 5.7** 及以上版本。

## 示例

```swift
@GET("/api/v1/no_param")
static var noParamAPI: APIParameterBuilder<()>? = nil

@POST("/api/v1/tuple_param")
static var tupleParamAPI: APIParameterBuilder<(id: Int, name: String?)>? = .init {
    // 字典和数组可直接作为参数使用
    ["id": $0.id, "name": $0.name]
}

@POST("/post")
static var postWithModel: APIParameterBuilder<Arg>? = .init {
    // 当参数 `Arg` 遵守 `APIParameter`（`Encodable & Hashable`） 协议时，可直接作为参数使用。
    $0
}
```

## 安装

### CocoaPods

```ruby
pod 'RaAPIWrapper'
```

如果您的项目依赖了 `Alamofire`，那么您还可以考虑依赖 `RaAPIWrapper/AF`。该模块提供了针对 `ParameterEncoding` 的封装。

### Swift Package Manager

- 依次选择 File > Swift Packages > Add Package Dependency
- 输入 https://github.com/RakuyoKit/RaAPIWrapper.git
- 选择 "Up to Next Major" 并填入对应的版本号

或者将下面的内容添加到 `Package.swift` 文件中：

```swift
dependencies: [
  .package(
    url: "https://github.com/RakuyoKit/RaAPIWrapper.git", 
    .upToNextMajor(from: "1.2.1")
  )
]
```

## 使用

请参考 `Demo.playground` 中的示例。

> 因为 playground 以 Swift Package Manager 的形式依赖 `RaAPIWrapper`，所以请先通过 `Package.swift` 打开项目，再从左侧的导航栏中选择 `Demo.playground`，运行相关内容。

## License

`RaAPIWrapper` 在 **MIT** 许可下可用。 有关更多信息，请参见 [LICENSE](LICENSE) 文件。
