import express from 'express';
import dotenv from 'dotenv';
import cors from 'cors';

import userRoutes from './routes/user.routes.js'
import { connectDB } from './db/connectDB.js';

dotenv.config();
const app = express();

const PORT = process.env.PORT;

app.use(express.json());

app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', 'http://127.0.0.1:5500'); // Must match exactly
    res.header('Access-Control-Allow-Credentials', 'true');
    next();
});

app.use(cors({ credentials: 'http://127.0.0.1:5500', origin: true }));

app.use('/api/auth', userRoutes);

app.get("/", (req, res) => {
    res.json({message: "Hello World"});
})

app.listen(PORT, () => {
    connectDB();
    console.log(`Your server is running on http://localhost:${PORT}`);
})

//kLLSok1aIDfjo20F