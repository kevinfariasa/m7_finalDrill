API Cursos Bootcamp
Se entrega un servicio que permite hacer CRUD de las entidades usuario y bootcamp, así como también asociar un usuario a un bootcamp mediante requests HTTP con el respectivo método y payload. El payload soportado es en formato JSON.

Metodos soportados:
GET: Obtener información de un usuario o todos los usuarios/Bootcamp

POST: Crear un nuevo Usuario/Bootcamp

POST: Vincular un Usuario a un Bootcamp deseado

PUT: Actualizar la información de un Usuario

DELETE: Eliminar un Usuario

Instrucciones
Para ejecutar el servidor de ejemplo:

Verificar que el puerto 3000 no esté en uso

Ejecutar npm run dev desde la terminal

El servidor estará disponible en http://localhost:3000

Ejemplos de requests para Bootcamp
Obtener información de todos los Bootcamps:

GET http://localhost:3000/api/bootcamps

Obtener información de todos los Bootcamps:

GET http://localhost:3000/api/bootcamps/1

Crear Bootcamp:

POST http://localhost:3000/api/bootcamps/

Por body -> raw -> JSON se entregan los siguientes datos: { title, cue, description}

Vincular User a Bootcamp:

POST http://localhost:3000/api/bootcamps/vinculate/

Por body -> raw -> JSON se entregan los siguientes datos: { idBootcamp, idUser }

Ejemplos de requests para User
Obtener información de todos los usuarios:

GET http://localhost:3000/api/users

Obtener información de un usuario en particular (ID)

GET http://localhost:3000/api/users/2

Crear User:

POST http://localhost:3000/api/users/

Por body -> raw -> JSON se entregan los siguientes datos: { firstName, lastName, email }

Modificar User seleccionando por ID:

PUT http://localhost:3000/api/users/1

Por params se entrega el ID: { id } Por body -> raw -> JSON se entregan los siguientes datos: { firstName, lastName, email }

Se elimina modificando el status del User seleccionando por ID:

DELETE http://localhost:3000/api/users/1

Por params se entrega el ID: { id }

Se elimina destruyendo el User seleccionando por ID:

DELETE http://localhost:3000/api/users/destroy/1

Por params se entrega el ID: { id }