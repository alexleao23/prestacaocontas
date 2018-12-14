import React from 'react';
import { Image } from 'react-native';
import { createStackNavigator, createAppContainer } from "react-navigation";
import Home from './src/screens/Home';

const AppNavigator = createStackNavigator({
    Home: {
        screen: Home,
        navigationOptions: {
            headerTitle: (
                <Image
                    style={{ flex: 1, width: 105, height: 35, resizeMode: 'contain' }}
                    source={require('./src/assets/images/logo.png')}
                />
            ),
            headerStyle: {
                backgroundColor: '#787878',
            },
            headerTitleStyle: {
                color: '#fff'
            },
            // headerLeft: (
            //     <TouchableHighlight
            //         style={{  }}
            //             flex: 1,
            //             backgroundColor: '#5cd85c',
            //             marginLeft: 10,
            //             borderRadius: 2
            //         }}
            //     >
            //         <Icon
            //             name='bars'
            //             style={{ margin: 8 }}
            //             color="white"
            //             size={20}
            //         />
            //     </TouchableHighlight>
            // ),
        }
    }
});

export default createAppContainer(AppNavigator);