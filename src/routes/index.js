const express = require('express');
const router = express.Router();
const database = require('../database');

router.get('/', (req, res) => {

    res.json({saludo: 'ola'})
})

router.get('/example', async(req, res) => {
  database.query('SELECT * FROM users', (err, rows, fields) => {
      database.end();
      if(err) throw err;
      res.json(rows);
  });

})

module.exports = router;