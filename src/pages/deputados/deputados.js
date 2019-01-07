import React, {Component} from 'react';
import api2 from '../../services/api2';
import {  View, Text, FlatList, TouchableOpacity, StyleSheet, Image, AsyncStorage}  from 'react-native';
import Icon2 from 'react-native-vector-icons/FontAwesome';




export default class Deputados extends Component {

    goBack = async () => {
        try {

            AsyncStorage.removeItem('api_token');

            const resetAction = StackActions.reset({
                index: 0,
                actions: [
                    NavigationActions.navigate({ routeName: 'signIn' }),
                ],
            });
            this.props.navigation.dispatch(resetAction);

        } catch (err) {
            console.log(err);
        }
    }


    static navigationOptions = ({navigation}) => ({
        headerLeft: <TouchableOpacity  onPress={() => navigation.navigate('Ranking')} style={{marginLeft: 5}}><Icon2 name="trophy" size={35} color="green" /></TouchableOpacity>,
        headerTitle: 'Deputados Federais',
        headerRight:<TouchableOpacity  onPress={this.goBack} style={{marginRight: 5}}><Icon2 name="sign-out" size={35} color="red" /></TouchableOpacity>,

    })

    
        
        //title: 'Deputados Federais'


    state = {
        //deputiesInfo: {},
        results: [],
        loggedInUser: null,
        deputados: [],
        deputado_id: [],
    };

    // classe que da get na apis

    componentDidMount() {
        this.getDeputadosList();
    }

    getDeputadosList = async() => {
        try {
            const response = await api2.get('/api/deputados');

            const deputados = response.data;
            this.setState({deputados});
        } catch (response) {
            console.log(response.data.message);
        }
    }

    
    




    // tentativa de pegar da apis

    renderItem = ({item}) => (
        <View style={styles.productContainer} > 
                                                                                                                                   {/* nome_eleitoral*/}
                <TouchableOpacity style={styles.productButton} onPress={() => {this.props.navigation.navigate("Despesas", {deputado_id: item.id})}}>  
                    <View style={{flex:1, flexDirection: 'row' }}>
                        <View style={styles.productDeputado}> 
                        <Text>{this.state.deputado_id}</Text>
                        <Image style={{height: 95, width: 95, borderRadius: 50 }}
                                    source={{ uri: item.url_foto }}
                                />                        
                        </View>
                        
                        <View style={{flex: 1, flexDirection: 'column'}}>
                            <View style={{ flex: 1, marginTop: 15}}>
                                
                                <Text style={styles.productTitle}> {item.nome_eleitoral} </Text>
                                <Text style={{flex: 1, fontSize: 12, marginTop: 1, color: '#458F6C', marginLeft: 5}}> {item.sigla_partido} </Text>
                            </View>
                            <View style={{flex: 1, fontSize: 12, marginTop: 1, marginLeft: 5}} >
                                <Text style={{ color: '#458F6C'}} > { item.municipio_nasc } </Text>
                                <Text style={{ color: '#458F6C'}}> {item.telefone} </Text>
                            </View>
                        </View>
                        
                       <View style={{flex:1}}> 
                            <View style={{flex: 1, flexDirection: "row", justifyContent: 'center', alignItems: 'center', margin: 5}} >
                                    <Icon2 name="thumbs-up" size={35} color="green" />
                                    
                                    <Icon2 name="thumbs-down" size={35} color="red" style={{ marginLeft: 10 }}/>
                            </View>
                        </View>
                    </View>
                </TouchableOpacity>
            </View>
    )


  
    render() {
        return (

            <View>                
                <FlatList
                contentContainerStyle={styles.list}
                data={this.state.deputados}
                keyExtractor={item => item.id}
                renderItem={this.renderItem}
                />
            </View>

        )
    }
}



const styles = StyleSheet.create({
    viewDeputados: {
        marginLeft: 30
    },
    nomeDeputado: {
        fontSize: 16,
        marginTop: 25,
        fontWeight: 'bold'
    },
    partidoDeputado: {
        fontSize: 12,
        marginTop: 1,
        color: '#5DBA51',
        fontWeight: 'bold',
        justifyContent: 'center',
        alignSelf: 'center',
    },
    botao: {      
        flexDirection: "row",
        //backgroundColor: 'red'
    },
    productContainer: {
        flex: 1,
        backgroundColor: '#F5F5F5',
        borderWidth: 1,
        borderColor: "#DDD",
        borderRadius: 5,
        padding: 5,
        marginBottom: 5,
        height: 150
    },

    productButton: {
        //height: 42,
        flex: 1,
        borderRadius: 5,
        borderWidth: 2,
        borderColor: "#5DBA51",
        backgroundColor: "transparent",
        justifyContent: "center",
        alignItems: "center",
        marginTop: 10
    },

    productDeputado: {
        flex:1, 
        flexDirection: 'row',
        justifyContent: 'center', 
        alignSelf: 'center'
    },
    productTitle: {
        //flex: 1,
        fontSize: 15,
        fontWeight: 'bold',
        color: "#5DBA51",
        justifyContent: 'center',
        alignSelf: 'flex-start',

    }
});


