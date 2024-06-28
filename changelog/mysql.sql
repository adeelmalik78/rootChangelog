# Reference: https://simplebackups.com/blog/how-to-create-and-grant-permissions-to-a-mysql-user/

# How to create a User in MySQL
CREATE USER 'username'@'hostname' IDENTIFIED BY 'password';

# How to show the list of users in MySQL
SELECT * FROM mysql.user;

# Show currently logged MySQL users
SELECT current_user();
SELECT user, host, command FROM information_schema.processlist;

# How to show all MySQL users
SELECT * FROM mysql.user;

# How to grant ALL privileges to a MySQL User
GRANT ALL PRIVILEGES ON database_name.* TO 'username'@'hostname';

# How to grant specific privileges to a MySQL User
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, on *.* TO 'username'@'localhost'

# How to show MySQL user permission
SHOW GRANTS FOR “username”@”localhost” ;

# Remove privileges from a MySQL User
REVOKE permission_1, permission_2 ON database_name.table_name FROM 'username'@'localhost';