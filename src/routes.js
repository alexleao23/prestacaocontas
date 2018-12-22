import  {createStackNavigator} from 'react-navigation';


import Main from './pages/main';
import Product from './pages/product';
import Deputados from './pages/deputados';
import Login from './pages/login';



export default createStackNavigator ({
    Login,
    Deputados,
    Main,
    Product
}, {
    navigationOptions: {
        headerStyle: {
           //height: 0,
            backgroundColor: "#5DBA51",
        },
       headerTintColor : "#3E4095"
    }
});
