import Foundation

public class SwiftDi {
    static var appComponent: AppComponent!
    public static func configure(_ appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}

//https://medium.com/flawless-app-stories/create-your-own-cocoapods-library-da589d5cd270

// pod trunk register profugo.canis@gmail.com 'Oleh Kyrhan'


//git add .
//git commit -m "Added SwiftyLib.podspec"
//git push
//git push origin master --force

//git tag 1.0.6
//git push origin 1.0.6

//pod trunk push
