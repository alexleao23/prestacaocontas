import React, { Component } from 'react';
import { View, Text, StyleSheet, Image } from 'react-native';
import { Card } from 'react-native-material-ui';

class CardDep extends Component {
    render(){
        return(
            <View style={styles.content}>
                <Card>
                    <Image
                        style={styles.imageStyle}
                        source={{ uri: this.props.profileimg }}
                    />
                    <Text
                        style={styles.name}
                    >
                        {this.props.nome}
                    </Text>
                    <View style={styles.infoContent}>
                        <Text style={styles.title}>
                            Informações
                        </Text>

                        <Text style={styles.information}>
                            Nome Civil: {this.props.nomecivil}
                        </Text>
                        <Text style={styles.information}>
                            Partido: {this.props.partido}
                        </Text>
                        <Text style={styles.information}>
                            UF: {this.props.uf}
                        </Text>
                        <Text style={styles.information}>
                            Condição Eleitoral: {this.props.condeleitoral}
                        </Text>
                        <Text style={styles.information}>
                            Data de Nascimento: {this.props.datanasc}
                        </Text>
                        <Text style={styles.information}>
                            Escolaridade: {this.props.escolaridade}
                        </Text>
                    </View>
                </Card>
            </View>
        )
    }
}

const styles = StyleSheet.create({
    content: {
        flex: 1,
        width: '90%',
        alignSelf: 'center',
    },
    imageStyle: {
        width: 120,
        height: 120,
        borderRadius: 80,
        margin: 15,
        alignSelf: 'center',

    },
    name: {
        textAlign: 'center',
        fontWeight: 'bold',
        fontSize: 20,
        marginBottom: 10,
    },
    title:{
        textAlign: 'center',
        fontWeight: 'bold',
        fontSize: 15,
        marginBottom: 10,
    },
    information: {
        fontWeight: 'bold',
    },
    infoContent: {
        borderColor: '#BDBDBD',
        borderStyle: 'dotted',
        borderWidth: 1,
        marginHorizontal: 15,
        marginBottom: 20,
        paddingHorizontal: 5,
        paddingVertical: 5,
    }
});

export default CardDep;