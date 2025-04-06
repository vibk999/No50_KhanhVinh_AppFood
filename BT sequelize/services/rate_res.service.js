import db from "../Sequelize/index";

export const getAll = async () => await db.rate_res.findAll();

export const create = async (data) => {
  const existing = await db.rate_res.findOne({
    where: { user_id: data.user_id, res_id: data.res_id },
  });

  if (existing) {
    return await existing.update(data);
  }

  return await db.rate_res.create(data);
};
