// main.mo
import Debug "mo:base/Debug";
import Text "mo:base/Text";

actor {

    // Struktur data untuk menyimpan informasi pengguna
    type User = {
        name: Text;
        bio: Text;
        email: Text;
        socialLinks: [Text];
    };

    // Struktur data untuk menyimpan konten
    type Content = {
        id: Nat;
        title: Text;
        body: Text;
        createdAt: Time;
    };

    // Data pribadi pengguna
    var user : User = {
        name = "Nama Anda";
        bio = "Deskripsi singkat tentang Anda";
        email = "email@example.com";
        socialLinks = ["https://twitter.com/username", "https://github.com/username"];
    };

    // Array untuk menyimpan konten
    var contents : [Content] = [];

    // Fungsi untuk mendapatkan data pengguna
    public func getUser() : async User {
        return user;
    };

    // Fungsi untuk memperbarui data pengguna
    public func updateUser(newUser: User) : async Text {
        user := newUser;
        return "User data updated successfully!";
    };

    // Fungsi untuk menambahkan konten baru
    public func addContent(title: Text, body: Text) : async Text {
        let newContent : Content = {
            id = Nat(contents.size());
            title = title;
            body = body;
            createdAt = Time.now();
        };
        contents := Array.append(contents, [newContent]);
        return "Content added successfully!";
    };

    // Fungsi untuk mendapatkan semua konten
    public func getContents() : async [Content] {
        return contents;
    };

    // Fungsi untuk menghapus konten berdasarkan ID
    public func deleteContent(contentId: Nat) : async Text {
        let indexOpt = Array.findIndex<Content>(contents, func (c) { c.id == contentId });
        switch (indexOpt) {
            case (?index) {
                contents := Array.filter<Content>(contents, func (c) { c.id != contentId });
                return "Content deleted successfully!";
            };
            case null {
                return "Content not found!";
            };
        };
    };

}
