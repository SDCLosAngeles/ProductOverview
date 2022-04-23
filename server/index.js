const express = require('express');
const db = require('./queries');

const port = 3100
const app = express();

app.use(express.json());

app.get('/', (req, res) => {
  res.send({ info: 'Node.js, Express, and Postgres API' });
})

app.get('/products', db.getProducts);

app.get('/products/:product_id', db.getProductsById);

app.get('/products/:product_id/styles', db.getProductsById);

app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});