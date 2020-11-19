import Axios from 'axios';

const token = document.querySelector('[name="csrf-token"]')
const instance = Axios.create({
  baseURL: '/api',
  responseType: 'json',
  headers: {
    'Content-Type': 'application/json',
    common: {
      'X-CSRF-TOKEN': token.content
    }
  },
  withCredentials: true
})

export default instance;
