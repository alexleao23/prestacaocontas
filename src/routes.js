import  {createStackNavigator} from 'react-navigation';

import Despesas from './pages/despesas_deputados/despesas';
import Deputados from './pages/deputados/deputados';
import signIn from './pages/signIn/index';
import signUp from './pages/signUp/index';
import Detalhes from  './pages/detalhes/detalhe';
import Ranking from './pages/ranking/ranking';


// export default createStackNavigator (
//     {
//     signIn,
//     Deputados,
//     Despesas,
//     Detalhes,
//     signUp,
//     Ranking
// }
//,
// {

    // initialRouteName: 'signIn',
    // navigationOptions: {
    //     headerStyle: {
    //        //height: 0,
    //         backgroundColor: "#F5F5F5",
    //     },
    //    headerTintColor : "#5DBA51"
    // }
//);

export const SignedOutRoutes = createStackNavigator({
    signIn: {
      screen: signIn,
      navigationOptions: {
            headerStyle: {
               //height: 0,
                backgroundColor: "#F5F5F5",
            },
           headerTintColor : "#5DBA51"
        }
    },
    Deputados: {
      screen: Deputados,
      navigationOptions: {
            headerStyle: {
               //height: 0,
                backgroundColor: "#F5F5F5",
            },
           headerTintColor : "#5DBA51"
        }
    },
    signUp: {
      screen: signUp,
      navigationOptions: {
        headerStyle: {
           //height: 0,
            backgroundColor: "#F5F5F5",
        },
       headerTintColor : "#5DBA51"
      }
    },

   

  });

  export const SignedInRoutes = createStackNavigator({
    Deputados: {
      screen: Deputados,
      navigationOptions: {
            headerStyle: {
               //height: 0,
                backgroundColor: "#F5F5F5",
            },
           headerTintColor : "#5DBA51"
        }
    },
    Despesas: {
      screen: Despesas,
      navigationOptions: {
            headerStyle: {
               //height: 0,
                backgroundColor: "#F5F5F5",
            },
           headerTintColor : "#5DBA51"
        }
    },
    Detalhes: {
      screen: Detalhes,
      navigationOptions: {
            headerStyle: {
               //height: 0,
                backgroundColor: "#F5F5F5",
            },
           headerTintColor : "#5DBA51"
        }
    },
    Ranking: {
      screen: Ranking,
      navigationOptions: {
            headerStyle: {
               //height: 0,
                backgroundColor: "#F5F5F5",
            },
           headerTintColor : "#5DBA51"
        }
    },
  });

  
export const createRootNavigator = (signedIn = false) => {
    return createStackNavigator({
      SignedIn: {  screen: SignedInRoutes },
      SignedOut: { screen: SignedOutRoutes }
    },
    {
      headerMode: "none",
      mode: "modal",
      initialRouteName: signedIn ? "SignedIn" : "SignedOut",
      navigationOptions: {
        gesturesEnabled: false
      }
    });
  };