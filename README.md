# Angiegram-RedSocial-Node.js
Una red social utilizando node.js, mysql, y express

Integrantes :  

* Cristian Tautiva 1151565
* Juan Pablo Cardenas 1151849
* Dairo Rodriguez Gomez 1151358


Back-end: Node.js

Front-end: Bootstrap 4, CSS, Javascript, HTML 5, Junto con Motor de plantilla Handlebars (.hbs)

Framework: Express

Arquitectura: Aunque no se toma fiel la arquitectura Modelo, vista , controlador, es la mas acorde al proyecto,
ya que se separo vista y funcionalidad.

Librerias usadas con NPM (Node Package Manager):  

- bcryptjs : Esta libreria me permite encriptar las contraseñas para darle mayor seguridad al usuario.
- cloudinary: Una libreria que me permite maniobrar con el servicio de alojamiento de imagenes llamado Cloudinary.
- connect-flash: Me permite Mandar mensajes con el Request, estos mensajes por lo general son informativos y dicen que una operacion finalizo.
- cross-env: manejar datos con process.env
- dotenv: hacer algo con los datos enviados por process.env
- express: Framework para manejar el servidor y las rutas asociadas a este.
- express-handlebars: Motor de plantilla para facilitar renders y funcionalidad html.
- express-mysql-session: para manejar las sessiones en mysql.
- express-session: para manejar la session del usuario en el server.
- express-validator: para validar credenciales de usuarios.
- fs-extra: para hacer cositas con el fileStream.
- morgan: manejo de colores y avisos por consola del server.
- multer: subida de imagenes al server, me proporciona la informacion de la imagen, se trabajo en conjunto con cloudinary.
- mysql: para manejar la base de datos.
- passport: autenticacion y metodos.
- passport-local: servicio local autenticacion.
- uuid: generador de nombre aleatorio para las imagenes subidas.



