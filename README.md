# Company Structure API

To use, clone this repository and cd into the directory.

From the terminal:
  - Run `bundle` to install gems.
  - Run `rails db:setup` to create and seed the database.
  - Run `rails s` to start the server on `localhost:3000`
 
### Endpoints

`/api/v1/structure`: returns a full list of the company structure
`/api/v1/structure/#{id}`: returns the manager and all direct reports
