//
//  ContentView.swift
//  SwiftUI_@Published@EnvironmentObject
//
//  Created by Paymint on 2020/05/28.
//  Copyright © 2020 Paymint. All rights reserved.
//

import SwiftUI

/**
 ##@Published
 
 User 클래스의 score앞에 @Published를 붙여주면 score의 숫자가 증가하게 된다.
 
 만약에 @published처럼 프로퍼티의 변경값을 즉시 알리는 것이 아닌, 그 시점을 자신이 정하여 알리고 싶은 경우엔 ObservableObject 프로토콜에
 선언된 ObjectWillChange 프로퍼티를 사용할 수 있다.
 
 해당 프로퍼티를 적용한 사례는 User클래스를 보면 된다.
 
 사실은 @Published는 이 ObjectWillChangePublisher가 send 메소드를 호출하는 코드를 좀 더 간소화시킨 형태이다.
 각 프로퍼티마다 send메소드를 호출하는 코드를 압축 시켜놓은 형태가 @Published인 것이다.
 
 ##@EnvironmentObject
 
 @EnvironmentObject 수식어를 이용하여 특정 뷰에 대한 환경 요소로 ObservableObject 모델을 등록한다.
 그럼 그 뷰를 포함한 모든 자식 뷰에서 @EvironmentObject 프로퍼티 래퍼를 이용하여 등록해 두었던 모델에 대한 의존성을 만들 수 있다.
 
 뷰 계층 구조 전반에서 동일 모델의 인스턴스를 참조하기 위해 @ObservedObject는 뷰의 서브트리에서 해당 모델을 사용하지 않는 뷰가 있더라도
 또 다른 자식 뷰가 사용해야 한다면 모델을 꼭 전달받아 넘겨줄 책임이 따른다. 매번 데이터를 연결해 주어야 하므로 일부 뷰에서만 띄엄띄엄 사용하는
 상황에서는 꽤 번거로워진다. 하지만 @Environment는 @ObservedObject와 똑같은 기능을 수행하면서도 이런 문제에 대해서 자유로운 특징을 가지고 있다. **부모 뷰가 어떤 값을 가진다면 그 자식 뷰들은 직접 전달받지 않더라도 어떤 뷰든지 간에 부모 뷰와 동일한 데이터에 접근할 수 있다.**
 
 */

struct ContentView: View {
    
    @ObservedObject var user: User
    
    var body: some View {
        VStack(spacing: 30){
            Text(user.name)
            
            Button(action: {self.user.score += 1}){
                Text(user.score.description)
            }
            
            
            Superview().environmentObject(User())
        }
    }
}

struct Superview: View{
    var body: some View{Subview()}
}
struct Subview: View {
    @EnvironmentObject var user: User
    var body: some View {Text(user.name.description)}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(user: User())
    }
}
