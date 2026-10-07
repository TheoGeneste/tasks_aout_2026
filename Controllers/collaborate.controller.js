import collaborateModel from '../Models/collaborate.model.js';

async function getAll(req, res) {
    try {
        const collaborates = await collaborateModel.getAll();
        res.json(collaborates);
    } catch (error) {
        res.status(500).json({ error: "Une erreur est survenue lors de la récupération de collaborate" });
    }
}

async function getByTaskId(req, res) {
    try {
        const taskId = req.params.taskID;
        const collaborates = await collaborateModel.getByTaskId(taskId);
        res.json(collaborates);
    } catch (error) {
        res.status(500).json({ error: "Une erreur est survenue lors de la récupération de collaborate via Task id" });
    }
}
async function getByUserId(req, res) {
    try {
        const userId = req.params.userID;
        const collaborates = await collaborateModel.getByUserId(userId);
        res.json(collaborates);
    } catch (error) {
        res.status(500).json({ error: "Une erreur est survenue lors de la récupération de collaborate via User id" });
    }
}

async function insert(req, res) {
    try {
        const body = req.body;
        const inserted = await collaborateModel.insert(body);
        res.status(201).json(inserted)
    } catch (error) {
        res.status(500).json({ error: "Une erreur est survenue lors de l'insertion de collaborate" });
    }
}

async function deleteCollaborate(req, res) {
    try {
        const taskId = req.params.taskID;
        const userId = req.params.userID;
        const deleted = await collaborateModel.deleteCollaborate(taskId, userId);
        res.json(deleted);
    } catch (error) {
        res.status(500).json({ error: "Une erreur est survenue lors de la suppréssion de collaborate" });
    }
}

export default {
    getAll,
    getByTaskId,
    getByUserId,
    insert,
    deleteCollaborate
}