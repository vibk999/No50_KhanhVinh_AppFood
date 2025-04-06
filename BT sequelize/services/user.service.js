import db from "../Sequelize/index";

export const getAllUsers = async () => {
  return await db.user.findAll();
};

export const getUserById = async (id) => {
  return await db.user.findByPk(id);
};

export const createUser = async (userData) => {
  return await db.user.create(userData);
};

export const updateUser = async (id, updateData) => {
  const user = await db.user.findByPk(id);
  if (!user) throw new Error("User not found");
  return await user.update(updateData);
};

export const deleteUser = async (id) => {
  const user = await db.user.findByPk(id);
  if (!user) throw new Error("User not found");
  return await user.destroy();
};
