# pwned_password
Ruby gem to search against the Pwned Passwords API without using Devise. Borrows heavily from [devise-pwned_password](https://github.com/michaelbanfield/devise-pwned_password/).

# importing data
The Pwned Passwords list is available for download here: https://haveibeenpwned.com/Passwords

The file only includes the SHA-1 hash of each password with the count of how many times it's been observed in public data breaches.

To import data from SHA-1 archive:

1. create a target sql file e.g. `touch pwned-passwords-v5.sql`

2. run the ruby script `ruby prepare-sql.rb pwned-passwords-sha1-ordered-by-count-v5.txt pwned-password-v5.sql`

3. import "pwned-passwords-v5.sql" into a database.
