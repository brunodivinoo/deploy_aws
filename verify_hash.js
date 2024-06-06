const bcrypt = require('bcrypt');

const plainPassword = 'admin';
const hashedPassword = '$2b$10$KvJYzI.oHsdo0uQge8z6xO8bJvOQme5f3vG1V.KvFDFQ/ItP3PlOG';

bcrypt.compare(plainPassword, hashedPassword, (err, result) => {
    if (err) {
        console.error('Erro:', err);
    } else {
        console.log('A senha corresponde:', result);
    }
});
