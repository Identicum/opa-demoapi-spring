# opa-demoapi-spring

Spring API using OPA for authorization

## Run the API

### Run locally

* Clone this repository
```
git clone https://github.com/Identicum/opa-demoapi-spring.git
```
- Adjust the [aplication.yml](/src/main/resources/application.yml)
- Run the app
```
mvn spring-boot:run
```
- You can access to the API on http://hostname:8081/api/v1

### Run as Test Environment

For a quick test, run the preset docker compose environment
```sh
docker-compose up
```
To be able to use this environment, you need to add this line to your local HOSTS file:
```sh
127.0.0.1  spa  idp  api
```
To access the SPA in the environment go to this URL: <http://spa/>

To see a reference of the architecture and diagrams, check [the docs](./docs/).
