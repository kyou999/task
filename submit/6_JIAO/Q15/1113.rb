p "studentテーブルへの処理を入力してください(s:select,i:insert,d:delete,e:exit)"
require "sqlite3"
class User 
    def initialize(cmd)
        @cmd = cmd
        @db = SQLite3::Database.open 'test.db'
        @db.execute "CREATE TABLE IF NOT EXISTS  users(id INT not null ,name TEXT)"
    end
    def createUsers
        p "idの入力"
        id = gets.to_i
        p "nameの入力"
        name = gets.chomp
        @db.execute "INSERT INTO users(id,name) values(?,?)", id,name
    end
    def showUsers
        select = @db.execute "SELECT * FROM users"
        if select == []
            p "table empty."
        else
            select.each do |row|
                p "#{row[0]}:#{row[1]}"
            end
        end
    end 
    def deleteUsers
        p "idの削除"
        id = gets.chomp
        @db.execute "DELETE FROM users WHERE id=?" ,id
    end
end
def getCmd
    cmd = ""
    while cmd != "e"
        cmd = gets.chomp
        user = User.new(cmd)
        if(cmd == "s")
            user.showUsers
        elsif(cmd == "i")
            user.createUsers
        elsif(cmd == "d")
            user.deleteUsers
        end
    end
end

getCmd 