## Makers BnB ##

The aim of this challeng was to build an AirBnB inspired web app that allows users to list and book spaces


### Live Demo ###




## Features ##

Create new user
Log in with account details
List a space 
View all spaces
Book a space
View all bookings 
Availabilty of space is dependent on previous bookings


### Setup ###
1. Clone the repo
2. Install the required gems:

```
bundle install
```
3. Set-up the PostgreSQL database, instructions can be found in db/migrations

4. Run the app
```
rackup
```
5. In your browser, head to localhost:9292



### Tech Stack ###
* Ruby 
* Sinatra
* PostgreSQL
* HTML & CSS

Testing:
* RSpec
* Capybara

### User Stories ###

* Any signed-up user can list a new space.

    ```
    As a User
    So that I can use Makers BnB
    I would like to sign up

    As a signed up User
    So that I can advertise my home
    I would like to list a new space
    ```

* Users can list multiple spaces.

    ```
    As a User
    So I can advertise many homes
    I would like to list multiple spaces
    ```

* Users should be able to name their space, provide a short description of the space, and a price per night.

    ```
    As a User
    So I can advertise my home effectively
    I would like to name my space, provide a short desciption and provide a price per name
    ```
* Users should be able to offer a range of dates where their space is available.

    ```
    As a Owner
    So people can book my home for a certain period
    I would like to offer a range of available dates
    ```

* Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.

    ```
    As a signed-up User
    So I can have a holiday 
    I would like to hire a space for one night

    As an Owner 
    So I can have guests in my space
    I would like to approve the request from a User
    ```

* Nights for which a space has already been booked should not be available for users to book that space.

    ```
    As a User
    So that I can only book available dates
    I should be prevented from booking unavailable dates
    ```

* Until a user has confirmed a booking request, that space can still be booked for that night.

    ```
    As a User
    So that my choices arent constrained
    The property should remain bookable until confirmation
    ```
