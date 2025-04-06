import db from "../Sequelize/index";

export const getAll = async () => await db.like_res.findAll();

export const create = async (data) => await db.like_res.create(data);

export const remove = async (userId, resId) => {
  const record = await db.like_res.findOne({
    where: { user_id: userId, res_id: resId },
  });
  if (!record) throw new Error("Like not found");
  await record.destroy();
};
