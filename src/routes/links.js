const express = require('express');
const router = express.Router();
const pool = require('../databases');
const { isLoggedIn } = require('../lib/protectLinks');
const helpers = require('../lib/helpers');
require('../routes/authentication');
const cloudinary = require('cloudinary').v2;

cloudinary.config({
     cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
     api_key: process.env.CLOUDINARY_API_KEY,
     api_secret: process.env.CLOUDINARY_API_SECRET,

});
const fs = require('fs-extra');




router.get('/upload_feed/:id', (req, res) => {
     const id = req.params.id;
     
     res.render('profiles/upload', { id });

});
//subiendo fotos o haciendo publicaciones
router.post('/upload_feed/:id', async (req, res) => {
     const id = Number(req.params.id);

     const result = await cloudinary.uploader.upload(req.file.path);
     const image_url = result.url;
     const public_id = result.public_id;
     const image = {
          id_user: id,
          image_url: image_url,
          public_id: public_id
     }

     await pool.query('INSERT INTO images SET id_user = ?,image_url = ?, public_id = ?', [image.id_user, image.image_url, image.public_id]);
     req.flash('success', 'Su foto ha sido subida correctamente');
     await fs.unlink(req.file.path);//eliminando imagen del servidor
     res.redirect('/profile');
});

//funcionalidad para seguir
router.get('/follow/:id', async (req,res)=>{
     const id_user=req.user.id;
     const id_seguido = req.params.id;
     const  username  = await pool.query('SELECT username FROM usuario WHERE id = ?', [id_seguido]);
     await pool.query('INSERT INTO follows SET id_user = ?, id_seguido = ?', [id_user, id_seguido]);
     const followers = await pool.query('SELECT seguidores FROM usuario WHERE id = ?',[id_seguido]);
     let seguidores = followers[0].seguidores+1;
     await pool.query('UPDATE usuario SET seguidores = ? WHERE id =?', [seguidores,id_seguido]);
     const followed = await pool.query('SELECT siguiendo FROM usuario WHERE id = ?',[id_user]);
     let siguiendo= followed[0].siguiendo+1;
     await pool.query('UPDATE usuario SET siguiendo = ? WHERE id =?', [siguiendo,id_user]);
     
     req.flash('success','Comenzaste a seguir a '+ username[0].username);
     res.redirect('/links/start');
     

});


//subiendo o actualizando foto de perfil del usuario
router.post('/upload/:id', isLoggedIn, async (req, res) => {
     const id = req.params.id;
     try {
          const row = await pool.query('SELECT public_id FROM usuario WHERE id = ?', [id]);
          await cloudinary.uploader.destroy(row[0].public_id);
     } catch (error) {

     }
     const result = await cloudinary.uploader.upload(req.file.path);
     const profile_img = result.url;
     const public_id = result.public_id;
     await pool.query('UPDATE usuario SET profile_img = ?, public_id = ? WHERE id = ?', [profile_img, public_id, id]);
     req.flash('success', 'Se actualizo su foto de perfil correctamente');
     await fs.unlink(req.file.path);//eliminando imagen del servidor

     res.redirect('/profile');
});


//mostrando posibles matches
router.get('/start', isLoggedIn, async (req, res) => {
     const id = req.user.id;
     const users = await pool.query('SELECT * FROM usuario WHERE id <> ?', [id]);

     res.render('links/list', { users });

});

router.get('/followed/:id',async (req,res)=>{
       const id  = req.params.id;
       console.log(id);
       followed = await pool.query('SELECT id_seguido FROM follows WHERE id_user = ?',[id]);
       console.log(followed);
       const tamaño = Object.keys(followed).length;
       for(let i =0; i<tamaño;i++){
           

       }
       res.send(followed);
       

});


//eliminando imagen del feed
router.get('/delete/:public_id', isLoggedIn, async (req, res) => {
     const { public_id } = req.params;
     console.log(public_id);
     try {
          await cloudinary.uploader.destroy(public_id);
     } catch (error) {

     }
     await pool.query('DELETE FROM images WHERE public_id = ?', [public_id]);
      req.flash('success','Imagen eliminada satisfactoriamente');
     res.redirect('/profile');
});
//viendo fotos usuario
router.get('/ver_fotos/:id', async (req, res) => {

     const { id } = req.params;
     var photos = await pool.query('SELECT * FROM images WHERE id_user = ?', [id]);
     console.log(photos);
     res.render('profiles/photos', { photos });

});
//viistando usuario
router.get('/profile/:id', async (req, res) => {
     const { id } = req.params;

     user = await pool.query('SELECT * FROM usuario WHERE id = ?', [id]);


     res.render('profiles/visit', user[0]);

});


//obteniendo ruta para editar datos del usuario
router.get('/edit_data/:id', isLoggedIn, async (req, res) => {
     const id = req.user.id;
     const myUser = await pool.query('SELECT * FROM usuario WHERE id = ?', [id]);
     res.render('links/edit_data', { myUser: myUser[0] });
});

//editando datos personales del usuario
router.post('/edit_data/:id', async (req, res) => {

     const { id } = req.params;

     console.log(req.body);
     var { username } = req.body;
     var { password } = req.body;
     const { name } = req.body;
     const { email } = req.body;



     var actUser = {
          nombres: name,
          username: username,
          email: email,
          password: password

     }

     if (password == "") {
          const row = await pool.query('SELECT password FROM usuario WHERE id = ?', [id]);
          actUser.password = row[0].password;

     } else {
          actUser.password = await helpers.encryptPassword(req.body.password);
     }

     await pool.query('UPDATE usuario SET ? WHERE id = ?', [actUser, id]);
     req.flash('success', 'Se actualizaron sus datos correctamente ' + actUser.username);
     res.redirect('/profile');
});







module.exports = router;