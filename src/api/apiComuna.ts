import axios from 'axios';
// const URL = 'http://192.168.100.10:8000'
const URL = 'https://api-comuna-6a3c126301d9.herokuapp.com/'

const apiComuna = axios.create({
    baseURL: URL,
});

export default apiComuna;