import TaskModel from '../Models/tasks.model.js'

async function getAll(req, res) {
    try {
        const tasks = await TaskModel.getAll();
        res.json(tasks);
    } catch (error) {
        console.error("Une erreur est survenue lors de la récupération des taches");
        res.status(500).json({ error: "Une erreur est survenue lors de la récupération des taches" })
    }
}

async function getById(req, res) {
    try {
        const id = req.params.id;
        const task = await TaskModel.getById(id);
        res.json(task[0]);
    } catch (error) {
        res.status(500).json({ error: "Une erreur est survenue lors de la récupération de la tache" })
    }
}

export default {
    getAll,
    getById
}