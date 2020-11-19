import React, { useEffect } from 'react';
import Axios from '../components/Helpers/AxiosApi';
import { Container, Row } from 'react-bootstrap';

import RestaurantSearchForm from '../components/RestaurantSearchForm/RestaurantSearchForm';
import Restaurant from '../components/Restaurant/Restaurant';

class Restaurants extends React.Component {
  state = {
    restaurants: [],
    restaurant: null,
    zip_code: null,
    term: '',
    page: 0
  }

  getRestaurantsHandler = (zip_code, term) => {
    let page_num = this.state.page + 1
    this.setState({loading: true})
    Axios.get('restaurants/search', { params: { zip_code: zip_code, page: page_num, term: term } })
      .then(res => {
        const data = res.data;
        const restaurants = res.data.data;
        this.setState({
          restaurants: restaurants,
          restaurant: restaurants[0],
          zip_code: zip_code,
          term: term,
          page: data.meta.page,
        })
      })
  }

  formHandler = (values) => {
    this.setState({page: 0})
    this.getRestaurantsHandler(values.zip_code, values.term)
  }

  nextRestaurantHandler = () => {
    let restaurants = this.state.restaurants
    if (restaurants.length > 1) {
      restaurants.shift()
      let next_restaurant = restaurants[0]
      this.setState({
        restaurants: restaurants,
        restaurant: next_restaurant
      })
    } else {
      this.getRestaurantsHandler(this.state.zip_code, this.state.term)
    }
  }

  actionHandler = (restaurant, action) => {
    Axios.post(`restaurants/${restaurant.id}/${action}`, {restaurant})
    .then(res => {
      this.nextRestaurantHandler()
    })
  }

  render () {
    let restaurant = null;
    if (this.state.restaurant) {
      restaurant = <Restaurant
                      restaurant={this.state.restaurant.attributes}
                      action={this.actionHandler} />
    }

    return (
      <Container>
        <h1 className='text-center'>Foodie</h1>
        <RestaurantSearchForm submit={this.formHandler}/>
        {restaurant}
      </Container>
    );
  }
}

export default Restaurants;
