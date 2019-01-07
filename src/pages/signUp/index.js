import React, { Component } from 'react';
import PropTypes from 'prop-types';

import { Container, Logo, Input, ErrorMessage, Button, ButtonText, SignUpLink, SignUpLinkText } from './styles';
import { StyleSheet, View, KeyboardAvoidingView, StatusBar, AsyncStorage, ScrollView, Image, TextInput, TouchableHighlight, Text } from 'react-native';
import DateTimePicker from 'react-native-modal-datetime-picker';
import { StackActions, NavigationActions } from 'react-navigation';


import moment from 'moment';


import api2 from '../../services/api2';

export default class signUp extends Component {


    static navigationOptions = {
        header: null,
    };

    //Variaveis de estado.

    state = {
        nome: '',
        email: '',
        password: '',
        password_confirmation: '',
        error: '',
        success: '',
        data_nasc: '',
        isVisible: false,
        chosenDate: 'Data de Nascimento'
    };

    handlePicker = (date) => {
        this.setState({
            isVisible: false,
            data_nasc: moment(date).format('YYYY-MM-DD'),
            chosenDate: moment(date).format('DD/MM/YYYY')
            //date = moment(date).format('YYYY-MM-DD')
            //chosenDate: moment(date).format('MMMM, Do YYYY')
        })
    }


    hidePicker = () => {
        this.setState({
            isVisible: false,
        })
    }

    showPicker = () => {
        this.setState({
            isVisible: true
        })
    }

    handleNomeChange = (nome) => {
        this.setState({ nome });
    };

    handleEmailChange = (email) => {
        this.setState({ email });
    };

    handlePasswordChange = (password) => {
        this.setState({ password });
    };

    handleConfirmPassword = (password_confirmation) => {
        this.setState({ password_confirmation });
    }

    handleDate = (data_nasc) => {
        this.setState({ data_nasc });
    }

    handleBackToLoginPress = () => {
        this.props.navigation.goBack();
    };

    handleSignUpPress = async () => {
        if (this.state.email.length === 0 || this.state.password.length === 0) {
            this.setState({ error: 'Preencha todos os campos para continuar!' }, () => false);
        } else {
            try {
                api2.post('/api/register/', {
                    nome: this.state.nome,
                    email: this.state.email,
                    password: this.state.password,
                    password_confirmation: this.state.password_confirmation,
                    data_nasc: this.state.data_nasc
                });

                this.setState({ success: 'Conta criada com sucesso! Redirecionando para o login', error: '' });
                //this.goToLogin();
                setTimeout(this.goToLogin, 2500);

            } catch (error) {
                this.setState({ error: 'Houve um problema com o cadastro, verifique os dados preenchidos!' });
            }
        }
    };

    goToLogin = () => {
        const resetAction = StackActions.reset({
            index: 0,
            actions: [
                NavigationActions.navigate({ routeName: 'signIn' }),
            ],
        });
        this.props.navigation.dispatch(resetAction);
    }


    render() {
        return (
            <View style={styles.container}>
                <StatusBar hidden />
                <KeyboardAvoidingView behavior='padding'>
                {this.state.success.length !== 0 && <Text style={styles.successMessage} >{this.state.success}</Text>}
                    {/* <View style={{ flex: 1, flexDirection: 'column', justifyContent: 'space-between' }}> */}
                    <TextInput
                        style={styles.input}
                        placeholder="Nome"
                        value={this.state.nome}
                        onChangeText={this.handleNomeChange}
                        autoCapitalize="none"
                        autoCorrect={false}
                    />
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
                    <TextInput
                        style={styles.input}
                        placeholder="Confirmação de senha"
                        value={this.state.password_confirmation}
                        onChangeText={this.handleConfirmPassword}
                        autoCapitalize="none"
                        autoCorrect={false}
                        secureTextEntry
                    />

                    <TouchableHighlight onPress={this.showPicker} style={styles.input} >
                        <Text placeholder="Data de Nascimento"> {this.state.chosenDate} </Text>
                    </TouchableHighlight>

                    <DateTimePicker
                        isVisible={this.state.isVisible}
                        onConfirm={this.handlePicker}
                        onCancel={this.hidePicker}
                        mode={'date'}
                    />
                </KeyboardAvoidingView>
                {this.state.error.length !== 0 && <Text style={styles.errorMessage} >{this.state.error}</Text>}
                <TouchableHighlight style={styles.button} onPress={this.handleSignUpPress}>
                    <Text style={styles.buttonText}>Criar conta</Text>
                </TouchableHighlight>
                <TouchableHighlight style={styles.signUpLink} onPress={this.handleBackToLoginPress}>
                    <Text style={styles.singUpLinkText}>Voltar ao login</Text>
                </TouchableHighlight>

            </View>
        );
    }
}


const styles = StyleSheet.create({
    container: {
        flex: 1,
        //alignItems: "center",
        justifyContent: "center",
        backgroundColor: "#F5F5F5"
    },
    logo: {
        height: 140,
        marginBottom: 40,
    },
    successMessage: {
        textAlign: "center",
        color: "#08a092",
        fontSize: 16,
        marginBottom: 15,
        marginHorizontal: 20
    },
    input: {
        paddingHorizontal: 20,
        paddingVertical: 15,
        borderRadius: 5,
        backgroundColor: "#fff",
        alignSelf: "stretch",
        marginBottom: 15,
        marginHorizontal: 20,
        fontSize: 16,
    },
    touchable: {
        paddingHorizontal: 20,
        paddingVertical: 15,
        borderRadius: 5,
        backgroundColor: "#fff",
        alignSelf: "stretch",
        marginBottom: 15,
        marginHorizontal: 20,
        fontSize: 16,
    },
    errorMessage: {
        textAlign: "center",
        color: "#ce2029",
        fontSize: 16,
        marginBottom: 15,
        marginHorizontal: 20,
    },
    button: {
        padding: 20,
        borderRadius: 5,
        backgroundColor: "#5DBA51",
        alignSelf: 'stretch',
        margin: 15,
        marginHorizontal: 20,
    },
    buttonText: {
        color: "#fff",
        fontWeight: "bold",
        fontSize: 16,
        textAlign: "center",
    },
    signUpLink: {
        padding: 10,
        marginTop: 20,
    },
    singUpLinkText: {
        color: "#999",
        fontWeight: "bold",
        fontSize: 16,
        textAlign: "center",

    }

});