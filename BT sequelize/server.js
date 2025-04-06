import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import { sequelize } from "./Sequelize/index.js"; // Sequelize models
import userRoutes from "./routes/user.route.js";
// import restaurantRoutes from "./routes/restaurant.route.js";
// import foodRoutes from "./routes/food.route.js";
import orderRoutes from "./routes/order.route.js";
import likeResRoutes from "./routes/like_res.route.js";
import rateResRoutes from "./routes/rate_res.route.js";

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3069;

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Routes
app.use("/api/users", userRoutes);
app.use("/api/orders", orderRoutes);
app.use("/api/like-res", likeResRoutes);
app.use("/api/rate-res", rateResRoutes);

// Test database connection
sequelize
  .authenticate()
  .then(() => {
    console.log("✅ Database connected successfully.");
    return sequelize.sync(); // Sync models to DB (optional)
  })
  .then(() => {
    app.listen(PORT, () => {
      console.log(`🚀 Server is running on http://localhost:${PORT}`);
    });
  })
  .catch((err) => {
    console.error("❌ Unable to connect to the database:", err);
  });
