import db from "../Sequelize/index";

export const getAll = async () => await db.order.findAll();

export const create = async (data) => await db.order.create(data);

export const remove = async (id) => {
  const order = await db.order.findByPk(id);
  if (!order) throw new Error("Order not found");
  await order.destroy();
};
