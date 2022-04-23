const Pool = require('pg').Pool;

const pool = new Pool({
  user: 'cyntel',
  host: 'localhost',
  database: 'product_overview',
  port: 5432,
})

const getProducts = (req, res) => {
  pool.query('SELECT * FROM product', (error, results) => {
    if (error) {
      throw error;
    }
    console.log(results.rows)
    res.status(200).json(results.rows);
  })
}

const getProductsById = (req, res) => {
  const product_id = parseInt(req.params.product_id);
  const query = 'SELECT p.id, "name", slogan, description, category, default_price, feature, "value" FROM product AS p INNER JOIN feature AS f ON p.id = f.id WHERE p.id = $1'

  pool.query(query, [product_id], (error, results) => {
    if (error) {
      throw error;
    }
    res.status(200).json(results.rows);
  });
}

const getStylesByProductId = (req, res) => {
  if (error) {
    throw error;
  }
  res.status(200).json(results.rows);
}

module.exports = {
  getProducts,
  getProductsById,
  getStylesByProductId,
}