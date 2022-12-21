# RaAPIWrapper

<p align="center">
<a><img src="https://img.shields.io/badge/language-swift-ffac45.svg"></a>
<a href="https://github.com/rakuyoMo/RaAPIWrapper/releases"><img src="https://img.shields.io/cocoapods/v/RaAPIWrapper.svg"></a>
<a href="https://github.com/rakuyoMo/RaAPIWrapper/blob/main/LICENSE"><img src="https://img.shields.io/cocoapods/l/RaAPIWrapper.svg?style=flat"></a>
</p>

`RaAPIWrapper` 利用 `@propertyWrapper` 来实现类似于 Android `Retrofit` 库中定义网络请求的效果。

在同一个文件中包含大量的网络请求接口时，`RaAPIWrapper` 可以帮助您以更聚合的形式定义每一个请求，让您不用在文件内来回跳转。

## 说在前面

**特别注意！**：`RaAPIWrapper` 仅仅是一个**定义**网络请求的语法糖。您需要在此基础上借助 `Alamofire`、`Moya` 、其他第三方网络框架或者直接调用 `URLSession` 来发起网络请求。

好的一点是，您只需要修改少量的代码，甚至无需修改代码，就可以很简单地将 `RaAPIWrapper` 集成进您已有的项目，`RaAPIWrapper` 可以很好的和您项目中现有的网络框架共存。

## 基本要求

- 运行 **iOS 11**、**macOS 10.13**、**watchOS 4.0**、**tvOS 11** 及以上版本的设备。
- 使用 **Xcode 14** 及以上版本编译运行。
- **Swift 5.7** 及以上版本。

## 示例

```swift
@GET("/api/v1/no_param")
static var noParamAPI: APIParameterBuilder<()>? = nil

@POST("/api/v1/tuple_param")
static var tupleParamAPI: APIParameterBuilder<(id: Int, name: String?)>? = {
    // 通过显式转换为 `[String: Any?]` 来消除警告，同时确保为 `nil` 的参数能够被过滤。
    ["id": $0.id, "name": $0.name] as [String: Any?]
}

@POST("/post")
static var postWithModel: APIParameterBuilder<Arg>? = {
    // 您可以让您的模型遵循 `APIParameterConvertible` 协议，或者使用 `AnyAPIHashableParameter` 在外面包裹一层。
    AnyAPIHashableParameter($0)
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
- 输入 https://github.com/rakuyoMo/RaAPIWrapper.git
- 选择 "Up to Next Major" 并填入对应的版本号

或者将下面的内容添加到 `Package.swift` 文件中：

```swift
dependencies: [
  .package(
    url: "https://github.com/rakuyoMo/RaAPIWrapper.git", 
    .upToNextMajor(from: "1.0.0")
  )
]
```

## 使用

请参考 `Demo.playground` 中的示例。

> 因为 playground 以 Swift Package Manager 的形式依赖 `RaAPIWrapper`，所以请先通过 `Package.swift` 打开项目，再从左侧的导航栏中选择 `Demo.playground`，运行相关内容。

## License

`RaAPIWrapper` 在 **MIT** 许可下可用。 有关更多信息，请参见 [LICENSE](LICENSE) 文件。
