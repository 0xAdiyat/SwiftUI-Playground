//
//  Intro.swift
//  SwiftUI-Bootcamp
//
//  Created by Ahsaf Hussain Adiyat on 6/2/24.
//

import SwiftUI

struct Info: Decodable, Identifiable {
    let id: Int
    let name: String
    let roll: Int
    let position: String
    let skills: [String]
}

struct Fhixa: View {
    let members: [Info] = [
        Info(id: 1, name: "Adiyat", roll: 3434323, position: "Leader", skills: ["HTML", "CSS", "Python"]),
        Info(id: 2, name: "Charlie", roll: 3434324, position: "Executive", skills: ["HTML", "CSS", "Python"]),
        Info(id: 3, name: "Enson", roll: 3434324, position: "Co-Executive", skills: ["C++", "Py", "JavaScript"]),
        Info(id: 4, name: "Robert", roll: 3434324, position: "Member", skills: ["HTML", "CSS", "Python"]),
        Info(id: 5, name: "Sydra", roll: 3434324, position: "Member", skills: ["HTML", "CSS", "Python"]),
        Info(id: 6, name: "Alex", roll: 3434324, position: "Member", skills: ["HTML", "CSS", "Python"]),
   
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(members.indices, id: \.self) { index in
                    let member = members[index]
                    let isLastMember = index == members.count - 1
                    memberView(member: member, isLastMember: isLastMember)
                }
                .padding(.horizontal)

                .navigationTitle("G")
                
                copyrightLabel
                    .padding()
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
    
    private func memberView(member: Info) -> some View {
        VStack {
            memberInfoView(member: member)
            Divider().padding(.horizontal)
        }
    }
    
    private func memberInfoView(member: Info) -> some View {
        ZStack(alignment: .leading) {
            HStack {
                Spacer()
                Spacer()
                VStack(alignment: .leading) {
                    Text(member.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text(member.position)
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)
                }
                .frame(width: 200, height: 140)
                .background(.black40)
                .cornerRadius(12)
                Spacer()
                Text(member.skillsString)
                    .fontWeight(.semibold)
                    .foregroundStyle(.yellow)
                Spacer()
            }
            .frame(height: 200)
            
            memberFirstLetterView(member: member)
        }
    }
    
    private func memberFirstLetterView(member: Info) -> some View {
        Text(String(member.name.first ?? Character("")))
            .font(.largeTitle)
            .foregroundStyle(.black)
            .frame(width: 90, height: 90)
            .background(.white)
            .cornerRadius(100)
            .offset(x: 0, y: -40)
    }
    private func memberView(member: Info, isLastMember: Bool) -> some View {
        VStack {
            memberInfoView(member: member)
            if !isLastMember {
                Divider().padding(.horizontal)
            }
        }
    }

    private var copyrightLabel: some View {
        Label("Copyright Team Fhixa", systemImage: "c.circle")
    }
        
}

extension Info {
    var skillsString: String {
        ListFormatter.localizedString(byJoining: skills.map { $0.lowercased() })
    }
}


#Preview {
    Fhixa()
}
