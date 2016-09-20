# Load jdbc_driver
drv <- JDBC(driverClass = "org.apache.drill.jdbc.Driver",
            classPath = pathDriverDrill)

# Connection to Drill
drillConnectionURL <- "jdbc:drill:drillbit=IP_Drill:Port_Drill"
conn <- dbConnect(drv, "drillConnectionURL")

# Show tables
dbListTables(conn) 

# Name of BDD
BDD_Name <- "cp"
# Name of table
Table_Name <- "`employee.json`"

# Read table
dbReadTable(conn, paste(BDD_Name, ".", Table_Name, sep=""))

# Query
dbGetQuery(conn, paste("select count(*) from ", BDD_Name, ".", Table_Name, sep=""))

