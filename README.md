# nivisheafricapi
This is the api for nivishe africa. It is one of the potential backend support for the web app.

# Background
This api has been developed using Rails 5 at the moment this is mapped to the git branch of the rails project.
The key gems imported are:
- carrier-wave for image uploads
- s3 for the image storage
- ember-cli-rails for interaction with the ember framework
- jsonapi-resources for the json data between the api and ember
- pg for the database. 

# Setup
To get started with the development, your environment should ideally be unix based (Ubuntu 14.04 works best). 
  1. Ensure the environment has   
    a) git 2.7,   
    b) rails 5 , and   
    c) postgresql 9.3 installed.  
  2. Clone the project to your chosen folder.  
  3. Run the rails migrations.

# Test Setup
The best way to test the api is by running `rails server` and checking that the appropriate responses are returned.

**Example test:**  
To find the list of countries available use:  
 `curl http://localhost:3000/countries/1`  
It should return a response similar to:  
 ```
 {
  "data": {
    "id": "1",
    "type": "countries",
    "links": {
      "self": "http://localhost:3000/countries/1"
    },
    "attributes": {
      "name": "Gambia",
      "code": "GM"
    },
    "relationships": {
      "designers": {
        "links": {
          "self": "http://localhost:3000/countries/1/relationships/designers",
          "related": "http://localhost:3000/countries/1/designers"
        }
      },
      "customers": {
        "links": {
          "self": "http://localhost:3000/countries/1/relationships/customers",
          "related": "http://localhost:3000/countries/1/customers"
        }
      }
    }
  }
}
```

# Contributing
We are happy to have skilled developers join our team.   
1. Fork the project.  
2. Create your feature branch. `git checkout -b name-of-branch`  
3. Commit your changes to the branch.  
4. Push to the branch.  
5. Submit a pull request.  
 

