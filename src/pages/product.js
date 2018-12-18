import React from 'react';

import { WebView, Text, View } from 'react-native';

const Product = ({navigation}) => (
    <View>
    <Text>Valor da Despesa: {navigation.state.params.product.txtdescricao}</Text>
    <Text>Valor da Despesa: {navigation.state.params.product.vlrdocumento}</Text>
    <Text>Valor da Despesa: {navigation.state.params.product.txtfornecedor}</Text>
    </View>
);

Product.navigationOptions = ({navigation}) => ({
    title: navigation.state.params.product.txnomeparlamentar
});

export default Product;