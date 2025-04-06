import * as likeService from "../services/like_res.service";

const likeController = {
  getAllLikes: async (req, res) => {
    try {
      const data = await likeService.getAll();
      res.json(data);
    } catch (err) {
      res.status(500).json({ error: err.message });
    }
  },

  likeRestaurant: async (req, res) => {
    try {
      const { user_id, res_id, date_like } = req.body;
      const like = await likeService.create({ user_id, res_id, date_like });
      res.status(201).json(like);
    } catch (err) {
      res.status(500).json({ error: err.message });
    }
  },

  unlikeRestaurant: async (req, res) => {
    try {
      const { user_id, res_id } = req.params;
      await likeService.remove(user_id, res_id);
      res.json({ message: "Unliked successfully" });
    } catch (err) {
      res.status(500).json({ error: err.message });
    }
  },
};
export default likeController;
