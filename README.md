# 基礎 iOS Swift 應用
### -- Click Game 點餅乾遊戲

下為應用程式設計、圖片，以及撰寫了一些程式的說明及教學。

![Launch Storyboard](/images/launch.png "Launch Storyboard")
![Main Storyboard](/images/main.png "Main Storyboard")

![執行結果](/images/view1.png "執行結果")
![執行結果](/images/view2.png "執行結果")

#### 在 Storyboard 定義圓角
> (1) 你必須在 Storyboard 當中選擇你要設定圓角的元件。\
> (2) 在右邊選擇 Show the Identity inspector (一個報紙的 icon) 的選單\
> (3) 在 User Defined Runtime Attributes 當中新增一個 Key Path\
> (4) Key Path = layer.cornerRadius\
> (5) Type = Number\
> (6) Value = 圓角的長度

#### 在程式賦予 Label 其 Text
```Swift
// 在全域建構 UILabel 元件
@IBOutlet weak var label: UILabel!
// 賦予資訊
self.label.text = "Text"
```

#### 在程式賦予 Button 其 Text
```Swift
// 在全域建構 UIButton 元件
@IBOutlet weak var button: UIButton!
// 賦予資訊
self.button.setTitle("Text", for: .normal)
```

#### 載入使用者預設資訊
```Swift
// 讀取記事本
let preferences = UserDefaults.standard
```

#### 如何在使用者預設寫入資訊
```Swift
// 在記事本上寫入一個 Key&Value
self.preferences.setValue("value", forKey: "Key")
// 儲存記事本資訊
preferences.synchronize()
```

#### 如何在程式當中讀取使用者預設當中的資訊
```Swift
self.變數 = self.preferences.object(forKey: "Key")
```

#### 如何在程式當中建構一個預存程序
```Swift
// 取得現在時間 = DispatchTime.now()
// 定義一個時間 = DispatchTime.init(uptimeNanoseconds: <#T##UInt64#>)
// 定義一個秒數 = .seconds(Int)
// 定義一個毫秒數 = .milliseconds(Int)
DispatchQueue.main.asyncAfter(deadline: Time) {
    // Code ...
}
```