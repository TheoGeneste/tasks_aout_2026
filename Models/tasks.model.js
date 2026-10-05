import Db from '../Config/db.js'

async function getAll(){
    const [rows] = await Db.query("SELECT ta_id, ta_title, ta_description, ta_dueDate, ta_owner FROM tasks");
    return rows;
}

async function getById(id){
    const [rows] = await Db.query(`SELECT ta_id, ta_title, ta_description, ta_dueDate, ta_owner, us_username, us_email
                                   FROM tasks
                                   INNER JOIN users ON us_id=ta_owner
                                   WHERE ta_id= ?`, [id])
    return rows;
}

export default {
    getAll,
    getById
}