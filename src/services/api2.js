import axios from 'axios';
import { AsyncStorage } from 'react-native';

const api2 = axios.create({
    baseURL: 'http://132.255.99.34'
});

api2.interceptors.request.use(async (config) => {
    try {
      const api_token = await AsyncStorage.getItem('api_token');
  
      if (api_token) {
        config.headers.Authorization = `Bearer ${api_token}`;
      }

      return config;
      
    } catch (err) {
      alert(err);
    }
  });

export default api2;

export const isSignedIn = async () => {
  const token = await AsyncStorage.getItem('api_token');

  return (token !== null) ? true : false;
};


export const onSignOut = () => AsyncStorage.removeItem(TOKEN_KEY);