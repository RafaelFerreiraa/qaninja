require 'pg'

class Database
    
    def initialize
        @connection = PG.connect(host: "localhost", dbname: 'nflix', user: "postgres", password: "qaninja")
    end
    def deleteMovie(titulo)
        @connection.exec("DELETE from public.movies where title = '#{titulo}';")  
    end

    def insertMovie(movie)    
        sql = "INSERT INTO public.movies(title, status, year, release_date, created_at, updated_at)" \
                        " VALUES('#{movie['titulo']}', '#{movie['status']}', '#{movie['ano']}', '#{movie['lancamento']}', current_timestamp, current_timestamp);"
        @connection.exec(sql)
    end
    
end