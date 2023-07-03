import express from "express";
import usersRoutes from "./routes/usuarios.routes.js";
import bootcampRoutes from "./routes/bootcamp.routes.js"

const app = express();

app.use(express.json());

//definir rutas
app.use("/api/users", usersRoutes);
app.use("/api/bootcamp", bootcampRoutes);

app.use("/", (req, res) =>{
    res.send({
        message:'Bienvenido a la API Bootcamp'
    })
});


export default app;