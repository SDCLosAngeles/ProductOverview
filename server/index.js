const express = require('express');
const queries = request('./queries.js');
const port = 3100
const app = express();

app.use(express.json());

app.get('/', (req, res) => {
  res.json({ info: 'Node.js, Express, and Postgres API' })
})

app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});