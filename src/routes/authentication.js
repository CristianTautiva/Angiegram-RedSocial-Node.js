const express = require('express');
const router = express.Router();
const passport = require('passport');
const pool = require('../databases');
const { isLoggedIn, isNotLoggedIn } = require('../lib/protectLinks');



router.get('/signup', isNotLoggedIn,(req,res)=>{
      res.render('auth/signup');
});

router.post('/signup', passport.authenticate('local.signup', {
  successRedirect: '/profile',
  failureRedirect: '/signup',
  failureFlash: true
}));

router.get('/signin',isNotLoggedIn,(req,res)=>{
  res.render('auth/signin');
});

router.post('/signin',(req,res,next)=>{
  passport.authenticate('local.signin', {
    successRedirect: '/profile',
    failureRedirect: '/signin',
    failureFlash: true
  })(req,res,next)
});



router.get('/profile',isLoggedIn,async(req,res)=>{
   let id= req.user.id;
  const photos = await pool.query('SELECT * FROM images WHERE id_user = ?', [id]);
  res.render('profiles/profile',{ photos });
});

router.get('/logout',(req,res)=>{
  req.logOut();
  res.redirect('/');
});


module.exports = router;