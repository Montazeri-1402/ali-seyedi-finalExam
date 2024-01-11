var express = require('express');
var router = express.Router();


const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient()

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

module.exports = router;
