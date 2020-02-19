require "pg"

class Database

    def initialize
        conection = {host: "localhost", dbname: "nflix", user: "postgres", password: "qaninja"}
        @conection = PG.connect(conection)
    end

    def clean_db
        @conection.exec("DELETE FROM public.users where id > 3;")
    end

    def find_user(email)
        query = "SELECT id, full_name, password, email, created_at, updated_at" \
                " FROM public.users  WHERE email = '#{email}';"
        @conection.exec(query).first
    end

    def deleteUser(email)
        @conection.exec("DELETE from public.users where email = '#{email}' ")
    end

end