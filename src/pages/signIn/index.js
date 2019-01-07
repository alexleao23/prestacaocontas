import React, { Component } from 'react';
import PropTypes from 'prop-types';


import { Container, Logo, Input, ErrorMessage, Button, ButtonText, SignUpLink, SignUpLinkText } from './styles';
import { StyleSheet, View, KeyboardAvoidingView, StatusBar, AsyncStorage, ScrollView, Image, TextInput, TouchableHighlight, Text } from 'react-native';

import { StackActions, NavigationActions } from 'react-navigation';

import api2 from '../../services/api2';

export default class signIn extends Component {


    // retirar parte de cima da tela
    static navigationOptions = {
        header: null,
    };

    static propTypes = {
        navigation: PropTypes.shape({
            navigate: PropTypes.func,
            dispatch: PropTypes.func,
        }).isRequired,
    };

    state = { email: 'lukas.liberato14@gmail.com', password: '123123', error: '' };

    handleEmailChange = (email) => {
        this.setState({ email });
    };

    handlePasswordChange = (password) => {
        this.setState({ password });
    };

    handleCreateAccountPress = () => {
        //NavigationActions.navigate({ routeName: 'signUp' })
        this.props.navigation.navigate('signUp');
    };




    handleSignInPress = async () => {
        if (this.state.email.length === 0 || this.state.password.length === 0) {
            this.setState({ error: 'Preencha usuário e senha para continuar!' }, () => false);
        } else {

            try {
                const response = await api2.post('/api/login', {
                    email: this.state.email,
                    password: this.state.password,
                });


                this.setState({ error: 'Logado' });

                //await AsyncStorage.setItem('@Precisava:api_token', response.data.api_token);

                AsyncStorage.setItem('api_token', response.data.api_token); //response.data.api_token

//                this.handleDeputado();

                const resetAction = StackActions.reset({
                    index: 0,
                    actions: [
                        NavigationActions.navigate({ routeName: 'Deputados' }),
                    ],
                });
                this.props.navigation.dispatch(resetAction);
            } catch (_err) {
                this.setState({ error: 'Houve um problema com o login, verifique suas credenciais!' });
            }
        }
    };

    

    render() {
        return (
            <KeyboardAvoidingView behavior="padding" style={styles.container}>

                    <View style={{ alignItems: "center" }}>
                        <Image style={styles.logo} source={require('../../img/precisava_logo.png')} resizeMode="contain" />
                    </View>
                    {/* <View style={{ flex: 1, flexDirection: 'column', justifyContent: 'space-between' }}> */}
                    <TextInput 
                        style={styles.input}
                        placeholder="Endereço de e-mail"
                        value={this.state.email}
                        onChangeText={this.handleEmailChange}
                        autoCapitalize="none"
                        autoCorrect={false}
                    />
                    <TextInput 
                        style={styles.input}
                        placeholder="Senha"
                        value={this.state.password}
                        onChangeText={this.handlePasswordChange}
                        autoCapitalize="none"
                        autoCorrect={false}
                        secureTextEntry
                    />
                    {this.state.error.length !== 0 && <Text style={styles.errorMessage}> {this.state.error} </Text>}
                     <TouchableHighlight style={styles.botao} onPress={this.handleSignInPress}> 
                    {/* <TouchableHighlight style={styles.botao} onPress={() => {
                        onSignIn().then(() => navigation.navigate("SignedIn"));
                    }}> */}
                     
                        <Text style={styles.buttonText}>Entrar</Text>
                    </TouchableHighlight>

                 <TouchableHighlight style={styles.botaoCadastro} onPress={this.handleCreateAccountPress}> 
                        <Text style={styles.botaoTextCadastro}>Criar conta grátis</Text>
                    </TouchableHighlight>
            </KeyboardAvoidingView>
        );
    }
}


const styles = StyleSheet.create({
    botao: {
        padding: 20,
        borderRadius: 5,
        backgroundColor: "#5DBA51",
        alignSelf: "stretch",
        margin: 15,
        marginHorizontal: 20,
    },
    buttonText: {
        color: "#FFF",
        fontWeight: "bold",
        fontSize: 16,
        textAlign: "center"
    },
    input: {
        paddingHorizontal: 20,
        paddingVertical: 15,
        borderRadius: 5,
        backgroundColor: "#FFF",
        //color: "green",
        alignSelf: "stretch",
        marginBottom: 15,
        marginHorizontal: 20,
        fontSize: 16,
    },
    botaoCadastro: {
        padding: 10,
        marginTop: 20
    },
    botaoTextCadastro: {
        color: "#999",
        fontWeight: "bold",
        fontSize: 16,
        textAlign: "center"
    },
    container: {
        flex: 1,
        justifyContent: 'center',
        backgroundColor: "#f5f5f5"
    },
    logo: {
        marginTop: 5,
        height: 140,
        marginBottom: 30,
    },
    errorMessage: {
        textAlign: "center",
        color: "#ce2029",
        fontSize: 16,
        marginBottom: 15,
        marginHorizontal: 20
    }
});

