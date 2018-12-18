import React, {Component} from 'react';
import api from '../services/api';
import {View, Text, FlatList, TouchableOpacity, StyleSheet, Image, ScrollView}  from 'react-native';




export default class Deputados extends Component {

    static navigationOptions = {
        title: 'Deputados Federais'
        //backgroundImage: URL('./img/precisava.png')
    };


  
    render() {
        return (
            <ScrollView style={{flex: 1, flexDirection: 'column'}}>
                {/* <View  style={{flexDirection: 'row'}}>
                    <View>
                        <TouchableOpacity style={styles.botao}  onPress={() => {this.props.navigation.navigate("Main", {main: "ANDRÉ+ABDON"})}}>
                            <View>
                                <Image style={{height: 80, width: 80, borderRadius: 50, marginLeft: 5, marginTop: 5}}
                                    source={require('../img/deputados/andreabdon.jpg')}
                                />
                            </View>
                            <View style={styles.viewDeputados}>
                                <Text style={styles.nomeDeputado}>ANDRÉ ABDON</Text>
                                <Text style={styles.partidoDeputado}>PP     Belém, Pará</Text>
                            </View>

                            <View style={{flexDirection: "row"}} >
                                <Image style={{marginTop: 30, marginLeft: 30, tintColor: 'green'}}
                                    source={require('../img/icons/like.png')}
                                />
                                <Image  style={{marginTop: 30,  marginLeft: 30, tintColor: 'red'}}
                                    source={require('../img/icons/deslike.png')}
                                />
                                
                            </View>
                        </TouchableOpacity>
                    </View>
                </View>
                <View  style={{flexDirection: 'row'}}>
                    <View>
                        <TouchableOpacity style={styles.botao}  onPress={() => {this.props.navigation.navigate("Main", {main: "CABUÇU+BORGES"})}}>
                            <View>
                                <Image style={{height: 80, width: 80, borderRadius: 50, marginLeft: 5, marginTop: 5}}
                                    source={require('../img/deputados/cabucuborges.jpg')}
                                />
                            </View>
                            <View style={styles.viewDeputados}>
                                <Text style={styles.nomeDeputado}>CABUÇU BORGES</Text>
                                <Text style={styles.partidoDeputado}>PP     Porto Velho, RO</Text>
                            </View>
                        </TouchableOpacity>
                    </View>
                </View>

                <View  style={{flexDirection: 'row'}}>
                    <View>
                        <TouchableOpacity style={styles.botao}  onPress={() => {this.props.navigation.navigate("Main", {main: "JANETE+CAPIBERIBE"})}}>
                            <View>
                                <Image style={{height: 80, width: 80, borderRadius: 50, marginLeft: 5, marginTop: 5}}
                                    source={require('../img/deputados/janetecapiberibe.jpg')}
                                />
                            </View>
                            <View style={styles.viewDeputados}>
                                <Text style={styles.nomeDeputado}>JANETE CAPIBERIBE</Text>
                                <Text style={styles.partidoDeputado}>PP     Amapá, AP</Text>
                            </View>
                        </TouchableOpacity>
                    </View>
                </View>

                <View  style={{flexDirection: 'row'}}>
                    <View>
                        <TouchableOpacity style={styles.botao}  onPress={() => {this.props.navigation.navigate("Main", {main: "JOZI+ARAÚJO"})}}>
                            <View>
                                <Image style={{height: 80, width: 80, borderRadius: 50, marginLeft: 5, marginTop: 5}}
                                    source={require('../img/deputados/joziaraujo.jpg')}
                                />
                            </View>
                            <View style={styles.viewDeputados}>
                                <Text style={styles.nomeDeputado}>JOZI ARAÚJO</Text>
                                <Text style={styles.partidoDeputado}>PP     Itaituba, PA</Text>
                            </View>
                        </TouchableOpacity>
                    </View>
                </View>    

               <View  style={{flexDirection: 'row'}}>
                    <View>
                        <TouchableOpacity style={styles.botao}  onPress={() => {this.props.navigation.navigate("Main", {main: "MARCOS+REATEGUI"})}}>
                            <View>
                                <Image style={{height: 80, width: 80, borderRadius: 50, marginLeft: 5, marginTop: 5}}
                                    source={require('../img/deputados/marcosreategui.jpg')}
                                />
                            </View>
                            <View style={styles.viewDeputados}>
                                <Text style={styles.nomeDeputado}>MARCOS REATEGUI</Text>
                                <Text style={styles.partidoDeputado}>PP     Macapá. AP</Text>
                            </View>
                        </TouchableOpacity>
                    </View>
                </View>

                <View  style={{flexDirection: 'row'}}>
                    <View>
                        <TouchableOpacity style={styles.botao}  onPress={() => {this.props.navigation.navigate("Main", {main: "PROFESSORA+MARCIVANIA"})}}>
                            <View>
                                <Image style={{height: 80, width: 80, borderRadius: 50, marginLeft: 5, marginTop: 5}}
                                    source={require('../img/deputados/professoramarcivania.jpg')}
                                />
                            </View>
                            <View style={styles.viewDeputados}>
                                <Text style={styles.nomeDeputado}>PROFESSORA MARCIVANIA</Text>
                                <Text style={styles.partidoDeputado}>PP     Santana, AP</Text>
                            </View>
                        </TouchableOpacity>
                    </View>
                </View>

                <View  style={{flexDirection: 'row'}}>
                    <View>
                        <TouchableOpacity style={styles.botao}  onPress={() => {this.props.navigation.navigate("Main", {main: "ROBERTO+GÓES"})}}>
                            <View>
                                <Image style={{height: 80, width: 80, borderRadius: 50, marginLeft: 5, marginTop: 5}}
                                    source={require('../img/deputados/robertogoes.jpg')}
                                />
                            </View>
                            <View style={styles.viewDeputados}>
                                <Text style={styles.nomeDeputado}>ROBERTO GÓES</Text>
                                <Text style={styles.partidoDeputado}>PP     Porto Grande, AP</Text>
                            </View>
                            <View style={{flexDirection: "row"}} >
                                <Image style={{marginTop: 30, marginLeft: 30, tintColor: 'green'}}
                                    source={require('../img/icons/like.png')}
                                />
                                <Image  style={{marginTop: 30,  marginLeft: 30, tintColor: 'red'}}
                                    source={require('../img/icons/deslike.png')}
                                />
                                
                            </View>
                        </TouchableOpacity>
                    </View>
                </View>

                <View  style={{flexDirection: 'row'}}>
                    <View>
                        <TouchableOpacity style={styles.botao}  onPress={() => {this.props.navigation.navigate("Main", {main: "VINICIUS+GURGEL"})}}>
                            <View>
                                <Image style={{height: 80, width: 80, borderRadius: 50, marginLeft: 5, marginTop: 5}}
                                    source={require('../img/deputados/viniciusgurgel.jpg')}
                                />
                            </View>
                            <View style={styles.viewDeputados}>
                                <Text style={styles.nomeDeputado}>VINICIUS GURGEL</Text>
                                <Text style={styles.partidoDeputado}>PP    Macapá, AP</Text>
                            </View>
                        </TouchableOpacity>
                    </View>
                </View>
                     */}
                     {/* André Abdon */}
            <View style={styles.productContainer} >
                <TouchableOpacity style={styles.productButton} onPress={() => {this.props.navigation.navigate("Main", {main: "ANDRÉ+ABDON"})}}>
                    <View style={{flex:1, flexDirection: 'row' }}>
                        <View style={styles.productDeputado}> 
                        <Image style={{height: 95, width: 95, borderRadius: 50 }}
                                    source={require('../img/deputados/andreabdon.jpg')}
                                />                        
                        </View>
                        
                        <View style={{flex: 1, flexDirection: 'column'}}>
                            <View style={{ flex: 1, marginTop: 15}}>
                                <Text style={styles.productTitle}>André Abdon</Text>
                                <Text style={{flex: 1, fontSize: 12, marginTop: 1, color: '#458F6C', marginLeft: 5}}>MDB</Text>
                            </View>
                            <View style={{flex: 1, fontSize: 12, marginTop: 1, marginLeft: 5}} >
                                <Text style={{ color: '#458F6C'}} >Porto Velho, RO</Text>
                                <Text style={{ color: '#458F6C'}}>(61) 3215-5380</Text>
                            </View>
                        </View>
                        
                       <View style={{flex:1}}> 
                            <View style={{flex: 1, flexDirection: "row", justifyContent: 'center', alignItems: 'center', margin: 5}} >
                                
                                    <Image style={{ height: 50, width: 50,tintColor: 'green'}}
                                        source={require('../img/icons/like.png')}
                                    />
                                    <Text>  </Text>
                                    <Image  style={{ height: 50, width: 50,tintColor: 'red'}}
                                        source={require('../img/icons/deslike.png')}
                                    />
                                
                            </View>
                        </View>
                    </View>
                </TouchableOpacity>
            </View>
            
                     {/* Cabuçu Borges */}
            <View style={styles.productContainer} >
                <TouchableOpacity style={styles.productButton} onPress={() => {this.props.navigation.navigate("Main", {main: "CABUÇU+BORGES"})}}>
                    <View style={{flex:1, flexDirection: 'row' }}>
                        <View style={styles.productDeputado}> 
                        <Image style={{height: 95, width: 95, borderRadius: 50 }}
                                    source={require('../img/deputados/cabucuborges.jpg')}
                                />                        
                        </View>
                        
                        <View style={{flex: 1, flexDirection: 'column'}}>
                            <View style={{ flex: 1, marginTop: 15}}>
                                <Text style={styles.productTitle}>Cabuçu Borges</Text>
                                <Text style={{flex: 1, fontSize: 12, marginTop: 1, color: '#458F6C', marginLeft: 5}}>PP</Text>
                            </View>
                            <View style={{flex: 1, fontSize: 12, marginTop: 1, marginLeft: 5}} >
                                <Text style={{ color: '#458F6C'}} >Belém, PA</Text>
                                <Text style={{ color: '#458F6C'}}>(61) 3215-5380</Text>
                            </View>
                        </View>
                        
                       <View style={{flex:1}}> 
                            <View style={{flex: 1, flexDirection: "row", justifyContent: 'center', alignItems: 'center', margin: 5}} >
                                
                                    <Image style={{ height: 50, width: 50,tintColor: 'green'}}
                                        source={require('../img/icons/like.png')}
                                    />
                                    <Text>  </Text>
                                    <Image  style={{ height: 50, width: 50,tintColor: 'red'}}
                                        source={require('../img/icons/deslike.png')}
                                    />
                                
                            </View>
                        </View>
                    </View>
                </TouchableOpacity>
            </View>

                {/* Janete Capiberibe */}
            <View style={styles.productContainer} >
                <TouchableOpacity style={styles.productButton} onPress={() => {this.props.navigation.navigate("Main", {main: "JANETE+CAPIBERIBE"})}}>
                    <View style={{flex:1, flexDirection: 'row' }}>
                        <View style={styles.productDeputado}> 
                        <Image style={{height: 95, width: 95, borderRadius: 50 }}
                                    source={require('../img/deputados/janetecapiberibe.jpg')}
                                />                        
                        </View>
                        
                        <View style={{flex: 1, flexDirection: 'column'}}>
                            <View style={{ flex: 1, marginTop: 15}}>
                                <Text style={styles.productTitle}>Janete Capiberibe</Text>
                                <Text style={{flex: 1, fontSize: 12, marginTop: 1, color: '#458F6C', marginLeft: 5}}>PSB</Text>
                            </View>
                            <View style={{flex: 1, fontSize: 12, marginTop: 1, marginLeft: 5}} >
                                <Text style={{ color: '#458F6C'}} >Amapá, AP</Text>
                                <Text style={{ color: '#458F6C'}}>(61) 3215-5209</Text>
                            </View>
                        </View>
                        
                       <View style={{flex:1}}> 
                            <View style={{flex: 1, flexDirection: "row", justifyContent: 'center', alignItems: 'center', margin: 5}} >
                                
                                    <Image style={{ height: 50, width: 50,tintColor: 'green'}}
                                        source={require('../img/icons/like.png')}
                                    />
                                    <Text>  </Text>
                                    <Image  style={{ height: 50, width: 50,tintColor: 'red'}}
                                        source={require('../img/icons/deslike.png')}
                                    />
                                
                            </View>
                        </View>
                    </View>
                </TouchableOpacity>
            </View>

                     {/* Jozi Araujo */}
            <View style={styles.productContainer} >
                <TouchableOpacity style={styles.productButton} onPress={() => {this.props.navigation.navigate("Main", {main: "JOZI+ARAÚJO"})}}>
                    <View style={{flex:1, flexDirection: 'row' }}>
                        <View style={styles.productDeputado}> 
                        <Image style={{height: 95, width: 95, borderRadius: 50 }}
                                    source={require('../img/deputados/joziaraujo.jpg')}
                                />                        
                        </View>
                        
                        <View style={{flex: 1, flexDirection: 'column'}}>
                            <View style={{ flex: 1, marginTop: 15}}>
                                <Text style={styles.productTitle}>Jozi Araújo</Text>
                                <Text style={{flex: 1, fontSize: 12, marginTop: 1, color: '#458F6C', marginLeft: 5}}>PODEMOS</Text>
                            </View>
                            <View style={{flex: 1, fontSize: 12, marginTop: 1, marginLeft: 5}} >
                                <Text style={{ color: '#458F6C'}} >Itaítuba, PA</Text>
                                <Text style={{ color: '#458F6C'}}>(61) 3215-5309</Text>
                            </View>
                        </View>
                        
                       <View style={{flex:1}}> 
                            <View style={{flex: 1, flexDirection: "row", justifyContent: 'center', alignItems: 'center', margin: 5}} >
                                
                                    <Image style={{ height: 50, width: 50,tintColor: 'green'}}
                                        source={require('../img/icons/like.png')}
                                    />
                                    <Text>  </Text>
                                    <Image  style={{ height: 50, width: 50,tintColor: 'red'}}
                                        source={require('../img/icons/deslike.png')}
                                    />
                                
                            </View>
                        </View>
                    </View>
                </TouchableOpacity>
            </View>


                     {/* Marcos Reategui */}
            <View style={styles.productContainer} >
                <TouchableOpacity style={styles.productButton} onPress={() => {this.props.navigation.navigate("Main", {main: "MARCOS+REATEGUI"})}}>
                    <View style={{flex:1, flexDirection: 'row' }}>
                        <View style={styles.productDeputado}> 
                        <Image style={{height: 95, width: 95, borderRadius: 50 }}
                                    source={require('../img/deputados/marcosreategui.jpg')}
                                />                        
                        </View>
                        
                        <View style={{flex: 1, flexDirection: 'column'}}>
                            <View style={{ flex: 1, marginTop: 15}}>
                                <Text style={styles.productTitle}>Marcos Reategui</Text>
                                <Text style={{flex: 1, fontSize: 12, marginTop: 1, color: '#458F6C', marginLeft: 5}}>PSD</Text>
                            </View>
                            <View style={{flex: 1, fontSize: 12, marginTop: 1, marginLeft: 5}} >
                                <Text style={{ color: '#458F6C'}} >Macapá, AP</Text>
                                <Text style={{ color: '#458F6C'}}>(61) 3215-5344</Text>
                            </View>
                        </View>
                        
                       <View style={{flex:1}}> 
                            <View style={{flex: 1, flexDirection: "row", justifyContent: 'center', alignItems: 'center', margin: 5}} >
                                
                                    <Image style={{ height: 50, width: 50,tintColor: 'green'}}
                                        source={require('../img/icons/like.png')}
                                    />
                                    <Text>  </Text>
                                    <Image  style={{ height: 50, width: 50,tintColor: 'red'}}
                                        source={require('../img/icons/deslike.png')}
                                    />
                                
                            </View>
                        </View>
                    </View>
                </TouchableOpacity>
            </View>
                     
                     {/* Professora Marcivania */}
            <View style={styles.productContainer} >
                <TouchableOpacity style={styles.productButton} onPress={() => {this.props.navigation.navigate("Main", {main: "PROFESSORA+MARCIVANIA"})}}>
                    <View style={{flex:1, flexDirection: 'row' }}>
                        <View style={styles.productDeputado}> 
                        <Image style={{height: 95, width: 95, borderRadius: 50 }}
                                    source={require('../img/deputados/professoramarcivania.jpg')}
                                />                        
                        </View>
                        
                        <View style={{flex: 1, flexDirection: 'column'}}>
                            <View style={{ flex: 1, marginTop: 15}}>
                                <Text style={styles.productTitle}>Professora Marcivania</Text>
                                <Text style={{flex: 1, fontSize: 12, marginTop: 1, color: '#458F6C', marginLeft: 5}}>PC do B</Text>
                            </View>
                            <View style={{flex: 1, fontSize: 12, marginTop: 1, marginLeft: 5}} >
                                <Text style={{ color: '#458F6C'}} >Santana, AP</Text>
                                <Text style={{ color: '#458F6C'}}>(61) 3215-5338</Text>
                            </View>
                        </View>
                        
                       <View style={{flex:1}}> 
                            <View style={{flex: 1, flexDirection: "row", justifyContent: 'center', alignItems: 'center', margin: 5}} >
                                
                                    <Image style={{ height: 50, width: 50,tintColor: 'green'}}
                                        source={require('../img/icons/like.png')}
                                    />
                                    <Text>  </Text>
                                    <Image  style={{ height: 50, width: 50,tintColor: 'red'}}
                                        source={require('../img/icons/deslike.png')}
                                    />
                                
                            </View>
                        </View>
                    </View>
                </TouchableOpacity>
            </View>
                     
                     {/* Roberto Góes */}
            <View style={styles.productContainer} >
                <TouchableOpacity style={styles.productButton} onPress={() => {this.props.navigation.navigate("Main", {main: "ROBERTO+GÓES"})}}>
                    <View style={{flex:1, flexDirection: 'row' }}>
                        <View style={styles.productDeputado}> 
                        <Image style={{height: 95, width: 95, borderRadius: 50 }}
                                    source={require('../img/deputados/robertogoes.jpg')}
                                />                        
                        </View>
                        
                        <View style={{flex: 1, flexDirection: 'column'}}>
                            <View style={{ flex: 1, marginTop: 15}}>
                                <Text style={styles.productTitle}>Roberto Góes</Text>
                                <Text style={{flex: 1, fontSize: 12, marginTop: 1, color: '#458F6C', marginLeft: 5}}>PDT</Text>
                            </View>
                            <View style={{flex: 1, fontSize: 12, marginTop: 1, marginLeft: 5}} >
                                <Text style={{ color: '#458F6C'}} >Porto Grande, AP</Text>
                                <Text style={{ color: '#458F6C'}}>(61) 3215-5462</Text>
                            </View>
                        </View>
                        
                       <View style={{flex:1}}> 
                            <View style={{flex: 1, flexDirection: "row", justifyContent: 'center', alignItems: 'center', margin: 5}} >
                                
                                    <Image style={{ height: 50, width: 50,tintColor: 'green'}}
                                        source={require('../img/icons/like.png')}
                                    />
                                    <Text>  </Text>
                                    <Image  style={{ height: 50, width: 50,tintColor: 'red'}}
                                        source={require('../img/icons/deslike.png')}
                                    />
                                
                            </View>
                        </View>
                    </View>
                </TouchableOpacity>
            </View>
                     
                     {/* Vinicius Gurgel */}
            
                     <View style={styles.productContainer} >
                <TouchableOpacity style={styles.productButton} onPress={() => {this.props.navigation.navigate("Main", {main: "VINICIUS+GURGEL"})}}>
                    <View style={{flex:1, flexDirection: 'row' }}>
                        <View style={styles.productDeputado}> 
                        <Image style={{height: 95, width: 95, borderRadius: 50 }}
                                    source={require('../img/deputados/viniciusgurgel.jpg')}
                                />                        
                        </View>
                        
                        <View style={{flex: 1, flexDirection: 'column'}}>
                            <View style={{ flex: 1, marginTop: 15}}>
                                <Text style={styles.productTitle}>Vinicius GURGEL</Text>
                                <Text style={{flex: 1, fontSize: 12, marginTop: 1, color: '#458F6C', marginLeft: 5}}>PR</Text>
                            </View>
                            <View style={{flex: 1, fontSize: 12, marginTop: 1, marginLeft: 5}} >
                                <Text style={{ color: '#458F6C'}} >Macapá, AP</Text>
                                <Text style={{ color: '#458F6C'}}>(61) 3215-5852</Text>
                            </View>
                        </View>
                        
                       <View style={{flex:1}}> 
                            <View style={{flex: 1, flexDirection: "row", justifyContent: 'center', alignItems: 'center', margin: 5}} >
                                
                                    <Image style={{ height: 50, width: 50,tintColor: 'green'}}
                                        source={require('../img/icons/like.png')}
                                    />
                                    <Text>  </Text>
                                    <Image  style={{ height: 50, width: 50,tintColor: 'red'}}
                                        source={require('../img/icons/deslike.png')}
                                    />
                                
                            </View>
                        </View>
                    </View>
                </TouchableOpacity>
            </View>

   
                
            </ScrollView>
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
        backgroundColor: '#FFF',
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


