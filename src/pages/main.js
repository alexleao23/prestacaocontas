import React, {Component} from 'react';
import api from '../services/api';
import {View, Text, FlatList, TouchableOpacity, StyleSheet, Image}  from 'react-native';

export default class Main extends Component {

    static navigationOptions = {
        title: 'Precisava?'
        //backgroundImage: URL('./img/precisava.png')
    };


    state = {
        productInfo: {},
        results: [],
        page: 1,
        main: ''
    };

   componentDidMount() {
        this.loadDepudatos();
    }

    

    loadDepudatos = async (page = 1, main =  this.props.navigation.state.params.main) => {
        //const main =  this.props.navigation.state.params.main;
        //const params = this.props.navigation.state.params;
        const response = await api.get(`data?sguf=AP&limit=5&page=${page}&txnomeparlamentar=${main}`);

        const { results, ... productInfo } = response.data;

     //   this.setState({counter: results.length})
        this.setState({ results: [ ... this.state.results, ... results], 
            productInfo, 
            page 
        });
    };

    loadMore = () => {
        const {page, productInfo} =  this.state;

        if (page === productInfo.pages) return;
        
        const pageNumber = page + 1;
        

        this.loadProducts(pageNumber);
    };

    renderItem = ({item}) => (
    <View  style={styles.productContainer}>
            <View>
                <Text style={styles.productTitle}>{item.txnomeparlamentar}</Text>
            </View>
        <View style={styles.productRow}>
            <View>
                <Text style={styles.productDescription} >{item.txtdescricao} </Text>
            <View  style={styles.productLineValue}>
                <Text style={styles.textvalue}>Valor: R$</Text> 
                <Text style={[ item.vlrdocumento > 100 ? styles.productValueRed : styles.productValueGreen]} >{item.vlrdocumento}</Text>
            </View>
            </View>
            <View >
               
            </View>
        </View>
        <View>
            <TouchableOpacity style={styles.productButton} onPress={() => {this.props.navigation.navigate("Product", {product: item})}}>
                <Text style={styles.productButtonText}>Detalhes</Text>
            </TouchableOpacity>
        </View>
    </View>
        /*
        <View>
      <View style={{
        flex: 1,
        flexDirection: 'row',
        justifyContent: 'flex-start',
        backgroundColor: '#FFF',
        borderWidth: 1,
        borderColor: "#DDD",
        borderRadius: 5,
        padding: 5,
        marginBottom: 20
      }}>
        <View><Text style={{fontSize: 17, fontWeight: 'bold', lineHeight: 24 }}>{item.txnomeparlamentar}</Text></View>
      </View>
      <View style={{
        flex: 1,
        flexDirection: 'row',
  
      }}>
        <View  ><Text style={{marginRight: 15, justifyContent: 'center', lineHeight: 24, alignItems: 'center'}}>{item.txtdescricao}</Text></View>
        <View><Text style={{ justifyContent: 'center', alignItem: 'center', lineHeight: 24}}> {item.vlrdocumento} </Text></View>
      </View>
      </View>*/
    )

    render() {
        return (
           <View>
                {/* <View style={{backgroundColor: '#5DBA51'}} >
                <Image style={{fontSize: 10}}
                    source={require('../img/precisava2.png')}
                />
            </View> */}
               
                <FlatList
                contentContainerStyle={styles.list}
                data={this.state.results}
                keyExtractor={item => item.nudeputadoid}
                renderItem={this.renderItem}
                onEndReached={this.loadMore} //dispara quando chega no fim da lista
                onEndReachedThreshold={0.1}  //basicamente, defini qual é o percentual que quer carregar antes de chegar no fim da lista
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
        padding: 10
    },

    productContainer: {
        backgroundColor: '#FFF',
        borderWidth: 1,
        borderColor: "#DDD",
        borderRadius: 5,
        padding: 5,
        marginBottom: 5,
        height: 150
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