// require('dotenv').config();
const express = require('express');
const db = require('./queries');

const port = 3100
const app = express();

app.use(express.json());

app.get('/', (req, res) => {
  res.send('Homepage');
})

app.get('/products', db.getProducts);

app.get('/products/:product_id', db.getProductsById);

app.get('/products/:product_id/styles', db.getStylesByProductId);

app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});