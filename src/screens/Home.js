import React, { Component }from 'react';
import { View, StyleSheet, ViewPagerAndroid, ActivityIndicator } from 'react-native';
import CardDep from '../components/CardDep';

const basicData = 'https://dadosabertos.camara.leg.br/api/v2/deputados?siglaUf=AP&ordem=ASC&ordenarPor=nome';
const linkToDetail = 'https://dadosabertos.camara.leg.br/api/v2/deputados/';

class Home extends Component {
    state = {
        isLoading: true,
        data: [],
        pages: []
    }

    componentDidMount() {
        fetch(basicData).then(response => response.json())
        .then(responseJson => {
            let data = responseJson.dados;
            let linksWithId = [];
            let detailedData = [];
            data.forEach(item => {
                linksWithId.push(
                    linkToDetail + item.id
                );
            });
            linksWithId.forEach(link => {
                fetch(link).then(res => res.json())
                .then(resJson => {
                    let info = resJson.dados;
                    detailedData.push(info);
                    if (detailedData.length == linksWithId.length){
                        detailedData.forEach(item => {
                            this.state.pages.push(
                                <View key={item.id}>
                                    <CardDep
                                        profileimg={item.ultimoStatus.urlFoto}
                                        nome={item.ultimoStatus.nome}
                                        partido={item.ultimoStatus.siglaPartido}
                                        uf={item.ultimoStatus.siglaUf}
                                        nomecivil={item.nomeCivil}
                                        condeleitoral={item.ultimoStatus.condicaoEleitoral}
                                        datanasc={item.dataNascimento.split('-').reverse().join('/')}
                                        escolaridade={item.escolaridade}
                                    />
                                </View>
                            )
                        })
                        this.setState({ isLoading: false });
                    }
                })
                .catch((e) => {
                    console.error(e);
                });
            });            
        })
        .catch((error) => {
            console.error(error);
        });
    }

    render() {
        if(this.state.isLoading){
            return (
                <View style={{ flex: 1, padding: 20 }}>
                    <ActivityIndicator />
                </View>
            )
        }
        else {
            return(
                <View style={styles.content}>
                    <ViewPagerAndroid
                        style={{ flex:1 }}
                        initialPage={0}
                        peekEnabled={true}
                    >
                        {this.state.pages}
                    </ViewPagerAndroid>
                </View>
            );
        }
    }
}

const styles = StyleSheet.create({
    content: {
        flex: 1,
    },
    buttonStyle: {
        color: '#5cc85c'
    },
    buttonText: {
        padding: 10,
        color: 'white'
    },
    textStyle: {
        textAlign: 'center',
    },
});

export default Home;