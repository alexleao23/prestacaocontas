import React, { Component } from 'react';
import { View, Text, FlatList, TouchableOpacity, StyleSheet, Image, Dimensions, ScrollView } from 'react-native';
import api2 from '../../services/api2';
import Icon from 'react-native-vector-icons/FontAwesome';



//let deviceHeight = Dimensions.get('screen').height


export default class Despesas extends Component {
    static navigationOptions = {
        title: "Precisava?"
    }


    state = {
        productInfo: {},
        results: [],
        page: 1,
        pages: {},
        main: '',
        deputado_id: '',
        pageNumber: 1,
    };

    componentDidMount() {
        this.loadDeputados();
    }



    loadDeputados = async (page = this.state.page, deputado_id = this.props.navigation.state.params.deputado_id) => {
        try {
            const response = await api2.get(`/api/deputados/${deputado_id}/despesas?page=${page}`);
            //const id = this.deputado_id;

            const results = response.data.data;

            const productInfo = response.data.meta.last_page;

            this.setState({
                results: [... this.state.results, ...results],
                productInfo,
                page,
            });
        } catch (results) {
            console.log(results.data);
        }
    };

    loadMore = () => {
        const { page, productInfo } = this.state;

        if (page === productInfo) return;
        //if (page === this.state.pages) return;
        const pageNumber = page + 1;
        //this.setState({page: pageNumber});
        this.loadDeputados(pageNumber);
    };

    renderItem = ({ item }) => (
        <View style={styles.productContainer}>
            <View>
                <Text style={styles.productTitle}>{item.nome_deputado}</Text>
            </View>
            <View style={styles.productRow}>
                <View>
                    <View>
                        <Text style={styles.productDescription}>{item.descricao} </Text>
                    </View>
                    <View style={styles.productLineValue}>
                        <Text style={styles.textvalue}>Valor: R$</Text>
                        <Text style={[item.valor_documento > 100 ? styles.productValueRed : styles.productValueGreen]} >{item.valor_documento}</Text>
                    </View>
                </View>
            </View>
            <View>
            <View style={{flexDirection: "row", marginTop: 2}} >
                <View style={{marginRight: 8, flexDirection: "column"}}  >
                    <Icon  name="thumbs-up" size={30} color="green" />
                    <Text> {item.num_reacoes_pos} </Text>
                </View>
                <View style={{flexDirection: "column"}}>
                    <Icon  name="thumbs-down" size={30} color="red" />
                    <Text> {item.num_reacoes_neg} </Text>
                </View>
            </View>
                <TouchableOpacity style={styles.productButton} onPress={() => { this.props.navigation.navigate("Detalhes", { detalhe: item, deputado_id: item.deputado_id, despesa_id: item.id, rct_pos: item.num_reacoes_pos, rct_neg: item.num_reacoes_neg, page: this.state.page }) }}>
                    <Text style={styles.productButtonText}>Detalhes</Text>
                </TouchableOpacity>
            </View> 
        </View>
    )

    render() {
        return (
            <View>
                <FlatList
                    contentContainerStyle={styles.list}
                    data={this.state.results}
                    keyExtractor={item => item.id}
                    renderItem={this.renderItem}
                    onEndReached={this.loadMore} //dispara quando chega no fim da lista
                    onEndReachedThreshold={0.2}  //basicamente, defini qual é o percentual que quer carregar antes de chegar no fim da lista
                />
            </View>
        );
    }
}


const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: "#fafafa"
    },

    list: {
        padding: 5
    },

    productContainer: {
        backgroundColor: '#FFF',
        borderWidth: 1,
        borderColor: "#DDD",
        borderRadius: 5,
        padding: 5,
        marginBottom: 5,
        height: 220,
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