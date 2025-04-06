import { Sequelize } from "sequelize";
import dotenv from "dotenv";
import initModels from "../models/init-models";

dotenv.config();

const sequelize = new Sequelize(
  process.env.DB_NAME || "restaurant_db",
  process.env.DB_USER || "root",
  process.env.DB_PASSWORD || "1234",
  {
    host: process.env.DB_HOST || "localhost",
    port: process.env.DB_PORT || 3307,
    dialect: process.env.DB_DIALECT || "mysql",
    logging: false,
  }
);

const db = initModels(sequelize);

export { sequelize };
export default db;
