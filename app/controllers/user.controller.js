import User from "../models/user.model.js";
import Bootcamp from "../models/bootcamp.model.js";

//Encuentra todos los usuarios activos y muestra los bootcamps vinculados
export const findAll = async (req, res) => {
    try {
        const users = await User.findAll({
            attributes: ['id', 'firstName', 'lastName', 'email'],
            include: [
                {
                    model: Bootcamp,
                    as: "bootcamps",
                    through: { attributes: [] },
                    attributes: ['id', 'title', 'cue', 'description']
                },
            ],
            where: { status: true }
        });
        res.send({ code: 200, data: users });
    } catch (error) {
        res.status(500).send({
            code: 500,
            message: "Error on consulting users",
        });
    }
};

//Crear y guardar usuario
export const createUser = async (req, res) => {
    try {
        let { firstName, lastName, email } = req.body;

        const [user, created] = await User.findOrCreate({
            where: { email },
            defaults: {
                firstName,
                lastName,
                email,
            },
        });

        if (!created) {
            return res.status(400).send({ code: 400, message: `User with email (${user.email}) already exist.` })
        }

        res.status(201).send({
            code: 201,
            message: `User ${user.firstName}, with ID: ${user.id} created successfully.`,
        });
    } catch (error) {
        console.log(error)
        res.status(500).send({ code: 500, message: error.message });
    }
};

//Obtener los bootcamp de un usuario
export const findUserById = async (req, res) => {
    try {
        let { id } = req.params;

        const user = await User.findOne({
            where: { id },
            attributes: ['id', 'firstName', 'lastName', 'email'],
            include: {
                model: Bootcamp,
                as: "bootcamps",
                through: { attributes: [] },
                attributes: ['id', 'title', 'cue', 'description']
            },

        });
        res.send({ code: 200, data: user });
    } catch (error) {
        res.status(500).send({
            code: 500,
            message: error.message,
        });
    }
};

//Actualizamos los datos de usuario por ID
export const updateUserById = async (req, res) => {
    try {
        let { id } = req.params;
        let { firstName, lastName, email } = req.body;
        let user = await User.findByPk(id)
        if (user) {
            await User.update(
                { id, firstName, lastName, email },
                { where: { id } }
            );
            return res.status(201).send(` User with ID: ${id} updated successfully`)
        }
    } catch (error) {
        console.log(error)
        res.status(500).send({
            code: 500,
            message: error.message
        })
    }
}

//Borramos a traves de un update al cambiar el status
export const changeStatus = async (req, res) => {
    try {
        let { id } = req.params;
        let { status } = req.body
        await User.update(
            { status },
            { where: { id } }
        )
        res.status(201).send(`User with ID: ${id} deleted successfully`)
    } catch (error) {
        console.log(error)
        res.status(500).send({
            code: 500,
            message: error.message
        })
    }
}

//Elimina de la base de dato la informacion
export const deleteUserById = async (req, res) => {
    try {
        let { id } = req.params;
        await User.destroy({
            where: { id }
        })
        res.status(201).send(`User with ID: ${id} deleted successfully`)
    } catch (error) {
        console.log(error)
        res.status(500).send({
            code: 500,
            message: error.message
        })
    }
}