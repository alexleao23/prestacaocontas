import axios from 'axios';

const api = axios.create({
    baseURL: 'https://brasil.io/api/dataset/gastos-deputados/cota_parlamentar/'
});

export default api;