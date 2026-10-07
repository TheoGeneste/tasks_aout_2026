// J'importe express
import express from 'express'
// Import dotenv pour utiliser les valeurs du .env
import dotenv from 'dotenv'
// J'importe le fichier des routes pour taches
import TasksRoute from './Routes/tasks.route.js'
import UsersRoute from './Routes/users.route.js'
import collaborateRoute from './Routes/collaborate.route.js'
import commentsRoute from './Routes/comments.route.js'
// Je créé la varible qui va accueillir mes parametres de serveur
const app = express();

// Je charge le fichier .env
dotenv.config();

// J'utilise le middleware express.json() pour que mon api utilise le JSON
app.use(express.json());
// Je dit que toutes les routes de mon fichier TasksRoute commencerons par /tasks
app.use("/tasks", TasksRoute);
app.use("/users", UsersRoute);
app.use("/collaborates", collaborateRoute);
app.use("/comments", commentsRoute);
// Je créé une route sur le / pour juste voir le status de mon api
app.get("/", (req,res) => {
    res.json({status : "OK"})
})

// Je lance mon server pour écouter les appels sur l'api
app.listen(process.env.SERVER_PORT, function(){
    console.log(`http://127.0.0.1:${process.env.SERVER_PORT}/`);
    console.log(`http://localhost:${process.env.SERVER_PORT}/`);
})