import React, { Component } from 'react';

import {Text, View, Alert, TextInput, TouchableOpacity, StyleSheet, Image, ImageBackground} from 'react-native';

const botaoPressionado = () => {
    Alert.alert('Fazendo login...');
};

const botaoEsqueceuSenha = () => {
    Alert.alert('informar email para envio da nova  senha ..');
};

export default class Login extends Component {
    render(){
        return (
            // <View style={estilo.principal}>
            //       <Image source={require('../img/precisava.png')} style={estilo.logo} />

            //     <View>
            //          <TextInput style={estilo.entrada}  placeholder='E-mail' />
            //     </View>

            //     <View>
            //         <TextInput secureTextEntry={true} style={estilo.entrada}  placeholder="Senha" />
            //     </View>

            //     <View>
                    
            //         <TouchableOpacity onPress={(botaoPressionado) => {{this.props.navigation.navigate("Deputados")}}} style={estilo.botao} >
            //             <Text> ENTRAR </Text>
            //         </TouchableOpacity>
            //     </View>

            //     <View>
            //         <TouchableOpacity onPress={botaoEsqueceuSenha} style={estilo.botao} >
            //             <Text> Esqueceu Senha </Text>
            //         </TouchableOpacity>
            //     </View>

            // </View>
        
            <ImageBackground style={{flex:1}} source={require('../img/planodefundo.jpeg')} >
                <View style={estilo.principal}>
                <Image source={require('../img/precisava.png')} style={estilo.logo} />
                <View>
                     <TextInput style={estilo.entrada}  placeholder='E-mail' />
                </View>

                <View>
                    <TextInput secureTextEntry={true} style={estilo.entrada}  placeholder="Senha" />
                </View>

                <View>
                    
                    <TouchableOpacity onPress={(botaoPressionado) => {{this.props.navigation.navigate("Deputados")}}} style={estilo.botao} >
                        <Text style={estilo.entrar}> ENTRAR </Text>
                    </TouchableOpacity>
                </View>

                <View>
                    <TouchableOpacity onPress={botaoEsqueceuSenha} style={estilo.botao} >
                        <Text style={estilo.entrar}> Esqueceu Senha </Text>
                    </TouchableOpacity>
                </View>
                </View>
            </ImageBackground>
       
            
        );
    }
}

const estilo = StyleSheet.create({
    entrada: {
        width: 320,
        height: 50,
        borderColor: 'gray',
        borderWidth: 0,
        backgroundColor: 'white',
        //borderWidth: 1,
        marginTop: 10,
        borderRadius: 20,
    },
    logo: {
        //width: 200,
        //height: 200,
        margin: 20
    },
    principal: {
       // backgroundColor: '#91b8da',
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center'
    },
    botao: {
        borderRadius: 20,
        backgroundColor: '#5DBA51',
        paddingVertical: 10,
        paddingHorizontal: 40,
        marginTop: 20
    },
    esqueceuSenha: {
        marginTop: 20,
        color: '#D8D8D8',
        backgroundColor: 'transparent',
        textAlign: 'right',
        paddingRight: 15

    },
    entrar:{
        textAlign: 'center'
    }
});