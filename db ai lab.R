install.packages("RMySQL")
library(RMySQL)
mysqlconnection = dbConnect(MySQL(), user = 'root', password = '', dbname = 'egyptstreetbank',host = 'localhost')
dbListTables(mysqlconnection)
result = dbSendQuery(mysqlconnection, "select * from userinfotable")
data.frame = fetch(result, n = 5)
print(data.fame)
result = dbSendQuery(mysqlconnection, "select * from userinfotable where username = 'mahmoud'")
data.frame = fetch(result, n = -1)
print(data.frame)
dbSendQuery(mysqlconnection, "update userinfotable set username = 'ali' where password = 54321")
dbSendQuery(mysqlconnection,"insert into userinfotable(username,email,gender,password)values('ailab','ai@yahoo.com','male','321654')")
dbWriteTable(mysqlconnection, "mtcars", mtcars[, ], overwrite = TRUE)
dbSendQuery(mysqlconnection, 'drop table if exists mtcars')
