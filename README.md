# Foodie
'Tinder for Restaurants' service, based on a location (zip code, city, etc.),

So in this tinder for restaurants, you're able to quickly search by zip code. You will be able to like or dislike a restaurant.


## Assigment
### Technology requirements
- Rails 6
- MongoDB (using the Mongoid gem)
- Using Microservice architecture
- Building API Endpoints for React.js front-end
- Testing (integration + unit) ** (minitests)
- Heroku

### Requirements
- User input
  - Set of Zip Codes (address + autocomplete address bonus)
  - Search term (ex. Coffee, acai)
  - Sort search results by Zip Codes within radius of 5 miles
    - Default: user's current location
  - User can add more zip codes
    - Return top restaurant options to the user

### Evaluation Criteria
- Design implemented according to React Components and React Strap / Bootstrap equivalent or material-ui
- Connect to API - Restaurants retrieval, grouped by Restaurant types
- Try to use Single Table Inheritance, Polymorphism, and Abstract Classes
- Bonus: Implement a Swiping animation and tinder-like interface

# Setup
For development you need to make a cp of the .env_example file for both the test and development environment. Also make sure to populate any keys.

```
cp .env_example .env.development .env.test
```

### Notes

From Yelp API documentation
  > Businesses returned in the response may not be strictly within the specified location.
