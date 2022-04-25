const Pool = require('pg').Pool;

const pool = new Pool({
  user: 'cyntel',
  host: 'localhost',
  database: 'product_overview',
  port: 5432,
})

const formatProductsById = function (arrayOfObjs) {
  let formattedObj = {};
  let features = [];
  if (arrayOfObjs.length > 0) {
    for (let i = 0; i < arrayOfObjs.length; i++) {
      let featureObj = {};
      for (let prop in arrayOfObjs[i]) {
        if (prop === 'feature' || prop === 'value') {
          featureObj[prop] = arrayOfObjs[i][prop];
        } else {
          formattedObj[prop] = arrayOfObjs[i][prop];
        }
      }
      if (Object.keys(featureObj).length > 0) {
        features.push(featureObj);
      }
    }
    formattedObj.features = features
    return formattedObj;
  }
}

const getProducts = (req, res) => {
  pool.query('SELECT * FROM product', (error, results) => {
    if (error) {
      throw error;
    }
    res.status(200).json(results.rows);
  })
}

const getProductsById = (req, res) => {
  const product_id = parseInt(req.params.product_id);
  const query = 'SELECT p.id, "name", slogan, description, category, default_price, feature, "value" FROM product AS p FULL JOIN feature AS f ON p.id = f.id WHERE p.id = $1'

  pool.query(query, [product_id], (error, results) => {
    if (error) {
      throw error;
    }
    res.status(200).json(formatProductsById(results.rows));
  });
}

const formatStylesByProductId = function (arrayOfObjs) {
  // format data from getStylesByProductId()
}

const getStylesByProductId = (req, res) => {
  const product_id = parseInt(req.params.product_id);
  const query = 'SELECT p.id, s.style_id, s.name, s.original_price, sale_price, s default_style, photo.url, photo.thumbnail_url, sku.sku_id, sku.size, sku.quantity FROM product AS p FULL JOIN style AS s ON p.id = s.id FULL JOIN photo AS photo ON s.style_id = photo.photo_id FULL JOIN sku AS sku ON s.style_id = sku.sku_id WHERE p.id = $1;';

  pool.query(query, [product_id], (error, results) => {
    if (error) {
      throw error;
    }
    res.status(200).json(results.rows);
  });
}

module.exports = {
  getProducts,
  getProductsById,
  getStylesByProductId,
}