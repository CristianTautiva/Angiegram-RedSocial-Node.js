const express = require('express');
const router = express.Router();
const pool = require('../databases');
const { isLoggedIn } = require('../lib/protectLinks');

router.get('/buscar', isLoggedIn, async (req, res) => {

    var dato = req.query.dato;
    dato = dato.toLowerCase();
    
   

    try {
        users = await pool.query('SELECT * FROM usuario WHERE username = ?', [dato]);
        
    } catch (error) {
        //nada
    }

    if (Object.keys(users).length === 0) {
        try {
            
            users = await pool.query('SELECT * FROM usuario WHERE nombres = ?', [dato]);
            
        } catch (error) {
            //nada
        }
    }
    
    
    res.render('links/list', { users });

});



module.exports = router;