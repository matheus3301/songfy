require('dotenv').config();

const app = require('./app');
const port = process.env.PORT || 3333;
const db = require('./database/Connection');

app.listen(port, () => {
  console.log(`Server is running on ${port}`);
});
