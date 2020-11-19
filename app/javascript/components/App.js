import React, { useEffect } from 'react';
import { Route } from 'react-router-dom';
import Axios from './Helpers/AxiosApi';
import Restaurants from '../containers/Restaurants';

const App = () => {
  const setUser = () => {
    Axios.post('auth')
      .catch(error => {
        console.log(error);
      })
  }

  useEffect(() => {
    setUser();
  }, [])

  return (
    <div>
      <Route exact path='/' component={Restaurants} />
    </div>
  )
};

export default App;
