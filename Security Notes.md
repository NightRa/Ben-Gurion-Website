## Security notes
This has been many years ago and for a school project.  
Just looking at the code for 5 minutes, it's easy to find:  
1. Passwords are stored in the db under MD5 without a salt. (I do remember I knew MD5 was bad, but ignored it since it's a school project)  
2. SQL injections possible basically everywhere.
