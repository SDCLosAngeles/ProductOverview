const Pool = require('pg').Pool;

const pool = new Pool({
  user: 'cyntel',
  host: 'localhost',
  database: 'product_overview',
  port: 5432,
})

const getProducts = (request, response) => {
  pool.query('SELECT * FROM product', (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const getProductsById = (request, response) => {
  const product_id = parseInt(request.params.product_id)
  const query = 'SELECT p.product_id, "name", slogan, description, category, default_price, feature, "value"
    FROM product AS p
    INNER JOIN feature AS f
    ON p.product_id = f.product_id
    WHERE p.product_id = ' + product_id;

  pool.query(query + product_id, (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

const getStylesByProductId = (request, response) => {

}

module.exports = {
  getProducts,
  getProductsById,
  getStylesByProductId,
}