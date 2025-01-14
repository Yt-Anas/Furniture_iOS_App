//
//  DetailScreen.swift
//  Furniture_
//
//  Created by Mac on 14/01/25.
//

import SwiftUI

struct DetailScreen: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Color("Bg")
                .ignoresSafeArea()
            
            ScrollView {
                Image("chair_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                DescriptionView()
                    .offset(y:-40)
            }
            .ignoresSafeArea()
            
            HStack{
                Text("$1299")
                    .font(.title)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button{
                    
                }label: {
                    Text("Add to Cart")
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(10)
                        .foregroundColor(Color("Primary"))
                }
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .cornerRadius(50 , corners: .topLeft)
            .frame(maxHeight: .infinity , alignment: .bottom)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                CustomBackButtonView(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot")
        )
    }
}

#Preview {
    DetailScreen()
}


struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners,  cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat , corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Luxury Swedia \nChair")
                .font(.title)
                .fontWeight(.bold)
            
            HStack (spacing: 4) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Text("Luxury Swedian chair is a contemporary chair based on the virtues of modern craft. It carries on the simplicity and honestly of the archetypical")
                .lineSpacing(8)
                .opacity(0.6)
            
            HStack(alignment: .top){
                VStack(alignment: .leading) {
                    Text("Size")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("Height: 120 cm")
                        .opacity(0.6)
                    Text("Wide: 80 cm")
                        .opacity(0.6)
                    Text("Dismeter: 70 cm")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity , alignment: .leading)
                
                VStack (alignment: .leading){
                    Text("Treatment")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    
                    Text("JatiWood, Canvas , \nAmazing Love")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity , alignment: .leading)
            }
            .padding(.vertical)
            
            HStack (alignment: .bottom){
                VStack(alignment: .leading){
                    Text("Colors")
                        .fontWeight(.semibold)
                    
                    HStack{
                        ColorDotView(color: .white)
                        ColorDotView(color: .black)
                        ColorDotView(color: Color("Primary"))
                    }
                }
                
                Spacer()
                
                VStack(alignment: .leading){
                    Text("Quantity")
                        .fontWeight(.semibold)
                    HStack{
                        Button {
                            
                        } label: {
                            Image(systemName: "minus")
                                .padding(.all , 8)
                        }
                        .frame(width: 30 , height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(.black)
                        
                        Text("1")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.horizontal , 8)
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "plus")
                                .padding(.all , 8)
                        }
                        .frame(width: 30 , height: 30)
                        .background(Color("Primary"))
                        .clipShape(.circle)
                        .foregroundColor(.white)

                    }
                }
            }
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(40)
    }
}

struct ColorDotView: View {
    
    let color: Color
    var body: some View {
        color
            .frame(width: 24 , height: 24)
            .clipShape(.circle)
    }
}


struct CustomBackButtonView: View {
    
    let action: ()-> Void
    var body: some View {
        Button( action: action, label: {
            Image(systemName: "chevron.backward")
                .padding(.all, 12)
                .background(.white)
                .cornerRadius(8)
                .foregroundColor(.black)
        })
    }
}
