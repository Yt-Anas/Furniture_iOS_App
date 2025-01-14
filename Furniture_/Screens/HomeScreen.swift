//
//  HomeScreen.swift
//  Furniture_
//
//  Created by Mac on 14/01/25.
//

import SwiftUI

struct HomeScreen: View {
    
    @State private var selectedIndex: Int = 0
    private let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table", "Time"]
    
    var body: some View {
        NavigationView {
            ZStack{
                Color("Bg")
                    .ignoresSafeArea()
                
                ScrollView(.vertical , showsIndicators: false ) {
                    VStack(alignment: .leading) {
                        AppBarView()
                        //.padding()
                        
                        TagLineView()
                            .padding()
                        
                        SearchAndScan()
                        
                        ScrollView(.horizontal , showsIndicators: false) {
                            HStack{
                                ForEach(0 ..< categories.count){ i in
                                    // If index == 1 then isActive is true
                                    CategoryView(isActive: i == selectedIndex, text: categories[i])
                                        .onTapGesture {
                                            selectedIndex = i
                                        }
                                }
                            }
                            .padding()
                        }
                        
                        Text ("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal , showsIndicators: false){
                            HStack {
                                ForEach(0 ..< 4){ index in
                                    NavigationLink(
                                        destination: DetailScreen() ,
                                        label: {
                                            ProductCardView(image: Image("chair_\(index + 1)"), size: 210)
                                        })
                                    .navigationBarHidden(true)
                                    .foregroundColor(.black)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        
                        Text ("Best")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                            .padding(.top)
                        
                        ScrollView(.horizontal , showsIndicators: false){
                            HStack {
                                ForEach(0 ..< 4){ index in
                                    ProductCardView(image: Image("chair_\(index + 1)"), size: 180)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        
                    }
                }
                
                // Custom Bottom Navbar
                HStack{
                    BottomNavbarItem(image: Image("Home")) {}
                    BottomNavbarItem(image: Image(systemName: "heart")) {}
                        .font(.title2)
                    BottomNavbarItem(image: Image(systemName: "cart")) {}
                        .font(.title2)
                    BottomNavbarItem(image: Image("User")) {}
                }
                .padding()
                .background(Color.white)
                .foregroundColor(Color("Primary"))
                .clipShape(Capsule())
                .padding()
                .shadow(color: Color.black.opacity(0.15) , radius: 8 , x: 2  , y: 6 )
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
}

#Preview {
    HomeScreen()
}


struct AppBarView: View {
    var body: some View {
        HStack {
            Button{
                
            }label: {
                Image("menu")
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image(uiImage: .profile)
                    .resizable()
                    .frame(width: 42 , height: 42)
            }
        }
        .padding()
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nbest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
        + Text ("Furniture!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .foregroundColor(Color("Primary"))
    }
}

struct SearchAndScan: View {
    
    @State private var search: String = ""
    
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Furniture" , text: $search)
            }
            .padding(.all , 20)
            .background(.white)
            .cornerRadius(10)
            .padding(.trailing)
            
            Button {
                
            }label: {
                Image(systemName: "qrcode.viewfinder")
                    .font(.title3)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color("Primary"))
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    
    let isActive: Bool
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor( isActive ? Color("Primary") : Color.black.opacity(0.5))
            
            if(isActive) {
                Color("Primary")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    
    let image: Image
    let size: CGFloat
    
    var body: some View {
        VStack{
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210) )
                .cornerRadius(20)
            
            Text("Luxury Swedian chair")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack(spacing: 2) {
                ForEach(0..<5 ){ item in
                    Image("star")
                }
                
                Spacer()
                
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct BottomNavbarItem: View {
    
    let image: Image
    let action: ()-> Void
    
    var body: some View {
        Button( action: action) {
            image
                .frame(maxWidth: .infinity)
        }
    }
}
