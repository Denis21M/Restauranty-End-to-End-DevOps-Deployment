const cloudinary = require('cloudinary').v2;
const { CloudinaryStorage } = require('multer-storage-cloudinary');
const multer = require('multer');


cloudinary.config({
    CLOUD_NAME: "drsjloigq",
    CLOUD_API_KEY: "926793658896175",
    CLOUD_API_SECRET: "5QhoDhOiODpETRSYUrRYDzu5tv0"
});


const storage = new CloudinaryStorage({
    cloudinary,
    params: {
        allowed_formats: ['png', 'jpeg', 'jpg'],
        folder: 'restaurant'
    }
});

module.exports = multer({ storage });