#What to configure ? 
-> create a database on postgres with the name "sys_inf"
-> go to application/config/database.php
-> search up for the line "
		'username' => 'postgres',
		'password' => 'postgres',
		'database' => 'sys_inf',
"
-> change the username and the password for your postgres credentials


#How to launch the project?
-> make sure to have php
-> go to the root path of the project(where folder application, session, db, system) are.
-> launch cmd from there
-> launch the application by entering : php -S localhost:8080


#How to work with the project?
Make sure to create branch and switch on it whenever you want to add some changes.