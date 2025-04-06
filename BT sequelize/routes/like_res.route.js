import express from "express";
import likeController from "../controllers/like_res.controller";

const router = express.Router();

router.get("/", likeController.getAllLikes);
router.post("/", likeController.likeRestaurant);
router.delete("/:user_id/:res_id", likeController.unlikeRestaurant);

export default router;
