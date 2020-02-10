require "pg"

class Database

    def initialize
        conection = {host: "localhost", dbname: "nflix", user: "postgres", password: "qaninja"}
        @conection = PG.connect(conection)
    end

    def deleteUser(email)
        @conection.exec("DELETE from public.users where email = '#{email}' ")
    end

end