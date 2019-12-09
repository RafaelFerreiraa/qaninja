# WebNinka
*Necessário:*
- Criar a rede no docker:
`docker network create webninja`

- Baixar imagem do postgres:
`docker pull postgres` 

- Criar o containner:
`docker run --name pgdb --network=webninja -e "POSTGRES_PASSWORD=qaninja" -p 5432:5432 -v var/lib/postgresql/data -d postgres`

- Cria containner gerenciador do banco:
`docker run --name pgadmin --network=webninja -e "PGADMIN_DEFAULT_EMAIL=sf.rafael20@gmail.com" -e "PGADMIN_DEFAULT_PASSWORD=qaninja" -p 15432:80 -d dpage/pgadmin4`

- Baixa imagem da API de usuarios
`docker pull papitoio/nflix-api-users`

- Cria o containner da API de usuários
`docker run --name nflix-api-users --network=webninja -e "DATABASE=pgdb" -p 3001:3001 -d papitoio/nflix-api-users`

- Baixa imagem da API de movies
`docker pull papitoio/nflix-api-movies`

- Cria o containner da API de movies
`docker run --name nflix-api-movies --network=webninja -e "DATABASE=pgdb" -p 3002:3002 -d papitoio/nflix-api-movies`

- Baixa imagem da API de movies
`docker pull papitoio/nflix-api-gateway`

- Cria o containner da API de movies
`docker run --name nflix-api-gateway --network=webninja -e "DATABASE=pgdb" -e "API_USERS=http://nflix-api-users:3001" -e "API_MOVIES=http://nflix-api-movies:3002" -p 3000:3000 -d papitoio/nflix-api-gateway`