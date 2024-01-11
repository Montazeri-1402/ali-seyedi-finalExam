var express = require('express');
var router = express.Router();

const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient()

/* Post data. */
router.post('/', async function(req, res, next) {
    const age = parseInt(req.query.age);
    gender = req.query.gender;
    if (gender == "female"){
        gender = false;
    }else{
        gender = true;
    }
    const weight = parseInt(req.query.weight);
    let Ip = req.ip;
    const height = parseFloat(req.query.height)/100;
    const bmi = weight / (height ^ 2);
    const createdBmi = await prisma.bmi.create({
        data: {
            age: age,
            gender: gender,
            weight: weight,
            height: height,
            bmi: bmi,
            ip : Ip
        }
    });

    res.send(createdBmi);
});
/* Get data. */
router.get('/list', async function (req, res, next) {
    const orderBy = req.query.order;
    const page = parseInt(req.query.page) || 1;
    const pageSize = 5;

    let bmi;
    const totalCount = await prisma.bmi.count(); 

    if (orderBy == "asc") {
        bmi = await prisma.bmi.findMany({
            orderBy: {
                createdAt: 'asc',
            },
            skip: (page - 1) * pageSize,
            take: pageSize,
        });
    } else {
        bmi = await prisma.bmi.findMany({
            orderBy: {
                createdAt: 'desc',
            },
            skip: (page - 1) * pageSize,
            take: pageSize,
        });
    }

    res.send({
        data: bmi,
        page: page,
        totalCount: totalCount,
    });
});


/* Get data. */
router.get('/', async function (req, res, next) {
    const id = parseInt(req.query.id);
    const chats = await prisma.bmi.findMany({
        where: {
            id : id,
        }
    });
    res.send(chats);
});

module.exports = router;
