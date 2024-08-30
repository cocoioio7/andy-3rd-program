import SwiftUI

struct ContentView: View {
    
    @State var user = ""
    @State var pass = ""
    @State var login = false
    @State var signup = false
    
    var body: some View {
        
        ZStack{
            
            LinearGradient(gradient: .init(colors: [Color("1"),Color("2")]), startPoint: .leading, endPoint: .trailing).edgesIgnoringSafeArea(.all)
            
            
            Login(login: $login, signup: $signup, user: $user, pass: $pass)
            
        }
        .alert(isPresented: $login) {
            if let storedUser = UserDefaults.standard.string(forKey: "Username"),
               let storedPass = UserDefaults.standard.string(forKey: "Password"),
               storedUser == user && storedPass == pass {
                return Alert(title: Text("Login Successful"), message: Text("Welcome \(self.user)"), dismissButton: .default(Text("OK")))
            } else {
                return Alert(title: Text("Login Failed"), message: Text("Incorrect Username or Password"), dismissButton: .default(Text("OK")))
            }
        }
        .sheet(isPresented: $signup) {
            signUp(signup: self.$signup)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Login : View {
    
    @Binding var login : Bool
    @Binding var signup : Bool
    @Binding var user : String
    @Binding var pass : String
    
    var body : some View{
        
        VStack(alignment: .center, spacing: 22, content: {
            
            Image("Taskshrek").resizable().frame(width: 350, height: 350).padding(.bottom, 15)
            
            HStack{
                
                Image(systemName: "person.fill").resizable().frame(width: 20, height: 20)
                
                TextField("Username", text: $user).padding(.leading, 12).font(.system(size: 20))
                
            }.padding(12)
            .background(Color("Color"))
            .cornerRadius(20)
            
            HStack{
                
                Image(systemName: "lock.fill").resizable().frame(width: 15, height: 20).padding(.leading, 3)
                
                SecureField("Password", text: $pass).padding(.leading, 12).font(.system(size: 20))
                
            }.padding(12)
            .background(Color("Color"))
            .cornerRadius(20)
            
            Button(action: {
                
                self.login.toggle()
                
            }) {
                
                Text("Login").foregroundColor(.white).padding().frame(width: 150)
                
            }
            .background(LinearGradient(gradient: .init(colors: [Color("1"),Color("2")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20)
            .shadow(radius: 25)
            
            Button(action: {
                
            }) {
                
                Text("Forget password?").foregroundColor(.white)
            }
            
            VStack{
                
                Text("Don't have an account yet?").foregroundColor(.white)
                
                Button(action: {
                    self.signup.toggle()
                }) {
                    Text("Sign Up").foregroundColor(.white).padding().frame(width: 150)
                }
                .background(LinearGradient(gradient: .init(colors: [Color("1"),Color("2")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(20)
                .shadow(radius: 25)
                
            }.padding(.top, 35)
            
        })
        .padding(.horizontal, 18)
    }
}

struct signUp : View  {
    
    @Binding var signup : Bool
    @State var user : String = ""
    @State var pass : String = ""
    @State var repass : String = ""
    
    var body : some View{
        
        ZStack{
            
            LinearGradient(gradient: .init(colors: [Color("1"),Color("2")]), startPoint: .leading, endPoint: .trailing).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 22, content: {
                     
                Image("yourLogo").resizable().frame(width: 80, height: 80).padding(.bottom, 15)
                
                HStack{
                    
                    Image(systemName: "person.fill").resizable().frame(width: 20, height: 20)
                    
                    TextField("Username", text: $user).padding(.leading, 12).font(.system(size: 20))
                    
                }.padding(12)
                .background(Color("Color"))
                .cornerRadius(20)
                
                HStack{
                    
                    Image(systemName: "lock.fill").resizable().frame(width: 15, height: 20).padding(.leading, 3)
                    
                    SecureField("Password", text: $pass).padding(.leading, 12).font(.system(size: 20))
                    
                }.padding(12)
                .background(Color("Color"))
                .cornerRadius(20)
                
                HStack{
                    
                    Image(systemName: "lock.fill").resizable().frame(width: 15, height: 20).padding(.leading, 3)
                    
                    SecureField("Re-Password", text: $repass).padding(.leading, 12).font(.system(size: 20))
                    
                }.padding(12)
                .background(Color("Color"))
                .cornerRadius(20)
                
                Button(action: {
                    if self.pass == self.repass {
                        UserDefaults.standard.set(self.user, forKey: "Username")
                        UserDefaults.standard.set(self.pass, forKey: "Password")
                        self.signup.toggle()
                    }
                }) {
                    Text("Sign Up").foregroundColor(.white).padding().frame(width: 150)
                }
                .background(LinearGradient(gradient: .init(colors: [Color("1"),Color("2")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(20)
                .shadow(radius: 25)
                
            })
            .padding(.horizontal, 18)
            
        }
        
    }
}
