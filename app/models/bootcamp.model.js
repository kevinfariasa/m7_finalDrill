import { DataTypes } from "sequelize";
import sequelize from "../database/db.config.js";

const Bootcamp = sequelize.define(
    "bootcamps",
    {
        title: {
            type: DataTypes.STRING(255),
            allowNull: false,
        },
        cue: {
            type: DataTypes.INTEGER,
            allowNull: false,
            validate: {
                min: 5,
                max: 20,
            },
        },
        description: {
            type: DataTypes.STRING(255),
            allowNull: false,
        },
    },
)

export default Bootcamp;
