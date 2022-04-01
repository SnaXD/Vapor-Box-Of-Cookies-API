# General
To open the project go to the folder and type:
vapor xcode

Vapor & Fluent docs: [Docs](https://docs.vapor.codes/4.0/fluent/overview/)

# SQLite
## Migration - Create database or update keys
Open project and type: `vapor run migration`

# MySQL
###Change to the MySQL branch
## Migration - Create database or update keys
###Its important you start your docker database first
Open project and type: `vapor run migration`
                            
##Docker Database
To create do:
Open Docker desktop to start Docker Daemon

`docker pull mariadb`
                            
`docker run --name cookie-box -e MYSQL_ROOT_PASSWORD=vapor -p 3306:3306 -d mariadb`
                            
Username will be "root" and password "vapor"

To test the connection do:
`docker exec -it cookie-box mysql -u root -p sys`

