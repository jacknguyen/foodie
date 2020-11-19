import React from 'react';
import { Card, Button } from 'react-bootstrap';
import { Link } from 'react-router-dom';
import classes from './Restaurant.module.css';

const Restaurant = ({ restaurant, action}) => (
  <Card className={classes.box} style={{ width: '40rem', padding: '0.3rem'}}>
    <Link to={{pathname: restaurant.url}} target='_blank'>
      <Card.Img
        variant="top"
        src={restaurant.image_url} alt={restaurant.name}
        style={{width: '40rem', height: '40rem', maxWidth: '100%', maxHeight: '100%'}}/>
    </Link>
    <Link to={{pathname: restaurant.url}} target='_blank'>
      <Card.Header as="h5">{restaurant.name}</Card.Header>
    </Link>
    <Card.Body>
      <Card.Text>
        <strong>Rating:</strong> {restaurant.rating} <br />
        <strong>Price:</strong> {restaurant.price} <br />
        <strong>Review Count:</strong> {restaurant.review_count}
      </Card.Text>
    </Card.Body>
    <Button variant="primary" onClick={() => action(restaurant, 'like')}>YAY</Button>
    <Button variant="danger" onClick={() => action(restaurant, 'dislike')}>NAY</Button>
  </Card>
)

export default Restaurant;
