import React, { Component, PureComponent } from 'React';
import api from '../../services/api2';
import Textarea from 'react-native-textarea';
import { FlatList, ScrollView, Alert, KeyboardAvoidingView, StyleSheet, Text, View, TouchableOpacity, TouchableHighlight } from 'react-native';
import Icon from 'react-native-vector-icons/FontAwesome';




export default class Detalhe extends PureComponent {

    constructor(props) {
        super(props);

    }

    state = {
        deputado_id: '',
        despesa_id: '',
        descricao: '',
        results: [],
        rct_pos: '',
        rct_neg: '',
        teste: [],
        page: '',
    };

    static navigationOptions = ({ navigation }) => ({
        title: navigation.state.params.detalhe.nome_deputado,
    });

    componentDidMount() {
        this.getCredentials();
        this.getComment();
    }


    getCredentials = async () => {
        const params = this.props.navigation.state.params;
        this.setState({
            deputado_id: params.deputado_id,
            despesa_id: params.detalhe.id,
            rct_pos: params.rct_pos,
            rct_neg: params.rct_neg,
            page: params.page,
        })
    };





    handleDescription = (descricao) => {
        this.setState({ descricao });
    };


    postComment = async (deputado_id = this.state.deputado_id, id = this.state.despesa_id) => {


        try {
            if (this.state.descricao.length === 0) return;
            const response = await api.post(`/api/deputados/${deputado_id}/despesas/${id}/comentario`, {
                descricao: this.state.descricao,
            });


            this.getComment();
            this.setState({ descricao: null })

            Alert.alert('Enviado com sucesso!');
        } catch (response) {
            console.log(response.data);
        }
    }




    postReactionPos = async (deputado_id = this.state.deputado_id, despesa_id = this.state.despesa_id) => {
        try {
            const response = await api.post(`/api/deputados/${deputado_id}/despesas/${despesa_id}/reacao`, {
                reacao: 1,
            });
            //this.getReacoes();
            //this.getCredentials();

            
            
            Alert.alert('Enviado com sucesso!');
             //this.state.rct_pos = 10;
            atual = this.state.rct_pos;


            this.setState({rct_pos: atual + 1});
        } catch (response) {
            console.log(response.data);
        }
    }


    postReactionNeg = async (deputado_id = this.state.deputado_id, despesa_id = this.state.despesa_id) => {
        try {
            const response = await api.post(`/api/deputados/${deputado_id}/despesas/${despesa_id}/reacao`, {
                reacao: 0,
            });
            //this.getCredentials();
            Alert.alert('Enviado com sucesso!');
            atual = this.state.rct_neg;
            this.setState({rct_neg: atual + 1});
        } catch (response) {
            console.log(response.data);
        }
    }



    renderItem = ({ item }) => (
        <View style={styles.productContainer}>
            <View>
                <Text style={styles.productTitle}>{item.usuario_id}</Text>
            </View>
            <View style={styles.productRow}>
                <View>
                    <View style={styles.productLineValue}>
                        <Text style={styles.productValueGreen} >{item.descricao}</Text>
                    </View>
                </View>
            </View>
            <View>
                <TouchableOpacity style={styles.productButton}>
                    <Text style={styles.productButtonText}>Comentário</Text>
                </TouchableOpacity>
            </View>
        </View>
    )

    getComment = async (deputado_id = this.props.navigation.state.params.deputado_id, id = this.props.navigation.state.params.despesa_id) => {
        try {
            const response = await api.get(`/api/deputados/${deputado_id}/despesas/${id}/comentarios`);

            const results = response.data;

            this.setState({ results: results.reverse() });
        } catch (results) {
            console.log(results.data)
        }
    };




    render() {
        const detalhe = this.props.navigation.state.params.detalhe;
        return (
            <ScrollView style={styles.detalheContainer}>
                <View>
                    <Text style={styles.detalheTitle}  >Detalhe da Despesa</Text>
                    <Text style={styles.detalheDescription} >Deputado: <Text style={styles.detalheValue} > {detalhe.nome_deputado}</Text></Text>
                    <Text style={styles.detalheDescription}>Partido:<Text style={styles.detalheValue} > {detalhe.sigla_partido}</Text></Text>

                    <Text style={styles.detalheTitle} >Dados do Documento</Text>
                    <Text style={styles.detalheDescription}>Tipo de Despesa: <Text style={styles.detalheValue} > {detalhe.descricao}</Text></Text>
                    <Text style={styles.detalheDescription}>Data de emissão: <Text style={styles.detalheValue} >{detalhe.mes_documento}/{detalhe.ano_documento}</Text></Text>

                    <Text style={styles.detalheTitle}>Fornecedor</Text>
                    <Text style={styles.detalheDescription}>Nome: <Text style={styles.detalheValue} >{detalhe.fornecedor}</Text>  </Text>
                    <Text style={styles.detalheDescription}>CPF/CNPJ: <Text style={styles.detalheValue} >{detalhe.cpfcnpj_fornecedor}</Text></Text>

                    <Text style={styles.detalheTitle}>Valores</Text>
                    <Text style={styles.detalheDescription}>Valor do Documento: <Text style={styles.detalheValue}>{detalhe.valor_documento}</Text></Text>
                </View>

                <View style={{ flexDirection: "column", margin: 5 }} >
                    <View style={{ flexDirection: 'row', justifyContent: 'center', marginBottom: 15, marginTop: 15 }}>
                        <TouchableOpacity style={{ flexDirection: 'column' }} onPress={this.postReactionPos}>
                            <Icon name="thumbs-up" size={50} color="green" />
                            <Text style={{ textAlign: 'center', color: 'green' }} >{this.state.rct_pos} </Text>
                        </TouchableOpacity>
                        <TouchableOpacity style={{ flexDirection: 'column' }} onPress={this.postReactionNeg}>
                            <Icon name="thumbs-down" size={50} color="red" style={{ marginLeft: 20 }} />
                            <Text style={{ textAlign: 'center', color: 'red' }}>{this.state.rct_neg} </Text>
                        </TouchableOpacity>
                    </View >
                    <KeyboardAvoidingView behavior="height" enabled>
                        <View>
                            <Textarea
                                containerStyle={styles.textareaContainer}
                                style={styles.textarea}
                                onChangeText={this.handleDescription}
                                defaultValue={this.state.descricao}
                                maxLength={120}
                                placeholder={'Escreva aqui ...'}
                                placeholderTextColor={'#c7c7c7'}
                                underlineColorAndroid={'transparent'}
                            />
                            <TouchableHighlight style={styles.buttonComment} onPress={this.postComment}>
                                <Text style={styles.textComment}>Enviar</Text>
                            </TouchableHighlight>
                        </View>
                    </KeyboardAvoidingView>
                </View>


                {this.state.results.length !== 0 &&
                    <View>
                        <Text style={styles.titleComment}>Comentários</Text>
                        <FlatList
                            contentContainerStyle={styles.list}
                            data={this.state.results}
                            keyExtractor={item => item.id}
                            renderItem={this.renderItem}
                            onEndReached={this.getComment}
                            onEndReachedThreshold={0.2}
                        />
                    </View>
                }
            </ScrollView>
        );
    }
}



const styles = StyleSheet.create({
    detalheContainer: {
        padding: 20,
        flex: 1,
        backgroundColor: '#F5F5F5',
        borderWidth: 2,
        borderRadius: 8,
        padding: 10,
        marginBottom: 5,
        height: 150,
        borderColor: "#5DBA51",
        flexDirection: 'column'
    },

    detalheTitle: {
        fontSize: 18,
        fontWeight: "bold",
        color: "#333"
    },

    detalheDescription: {
        fontSize: 16,
        color: '#999',
        marginTop: 5,
        lineHeight: 24,
    },

    detalheValue: {
        fontSize: 16,
        color: '#5DBA51',
        marginTop: 5,
        lineHeight: 24,
    }, container: {
        flex: 1,
        padding: 30,
        justifyContent: 'center',
        alignItems: 'center',
    },
    textareaContainer: {
        height: 140,
        padding: 5,
        backgroundColor: '#F5FCFF',
    },
    textarea: {
        textAlignVertical: 'top',  // hack android
        height: 130,
        fontSize: 16,
        color: '#5DBA51',
    },
    comment: {
        textAlign: 'center',
        fontSize: 15
    },
    buttonComment: {
        padding: 20,
        borderRadius: 5,
        backgroundColor: '#5DBA51',
        alignSelf: 'stretch',
        margin: 15,
        marginHorizontal: 20,
    },
    buttonCommentComment: {
        padding: 20,
        borderRadius: 5,
        backgroundColor: '#5DBA51',
        alignSelf: 'center',
        margin: 15,
        marginHorizontal: 20,
        height: 10
    },
    textComment: {
        color: '#FFF',
        fontWeight: 'bold',
        fontSize: 16,
        textAlign: 'center',
    },
    commentName: {
        backgroundColor: '#FFF',
        borderWidth: 1,
        borderColor: "#DDD",
        borderRadius: 5,
        padding: 5,
        marginBottom: 10,
        height: 70,
        flex: 1
    },

    commentDescription: {
        fontSize: 18,
        fontWeight: "bold",
        color: "#333"
    },
    titleComment: {
        fontSize: 30,
        fontWeight: "bold",
        textAlign: "center",
        marginBottom: 5
    },
    productContainer: {
        backgroundColor: '#FFF',
        borderWidth: 1,
        borderColor: "#DDD",
        borderRadius: 5,
        padding: 5,
        marginBottom: 10,
        height: 140,
        flex: 1
    },

    productTitle: {
        fontSize: 18,
        fontWeight: "bold",
        color: "#333"
    },

    productDescription: {
        fontSize: 16,
        color: '#999',
        marginTop: 5,
        lineHeight: 24,
    },

    productButton: {
        height: 42,
        borderRadius: 5,
        borderWidth: 2,
        borderColor: "#5DBA51",
        backgroundColor: "transparent",
        justifyContent: "center",
        alignItems: "center",
        marginTop: 10
    },

    productButtonText: {
        fontSize: 16,
        color: "#5DBA51",
        fontWeight: "bold"
    },
    productValueRed: {
        //flex: 1,
        fontSize: 17,
        fontWeight: 'bold',
        color: 'red',
        justifyContent: 'center',
        alignItems: "flex-start",
        marginTop: 5,
        marginLeft: 5

    },
    productValueGreen: {
        //flex: 1,
        fontSize: 17,
        fontWeight: 'bold',
        color: 'green',
        justifyContent: 'center',
        alignItems: "flex-start",
        marginTop: 5,
        marginLeft: 5
    },
    productRow: {
        flex: 1,
        flexDirection: 'row',
    },
    productLineValue: {
        flex: 1,
        flexDirection: 'row'
    },
    textvalue: {
        fontSize: 17,
        //marginLeft: 15,
        marginTop: 5,
        fontWeight: 'bold'
    },
    imagePrecisava: {
        flex: 1,
        height: 20

    }
});